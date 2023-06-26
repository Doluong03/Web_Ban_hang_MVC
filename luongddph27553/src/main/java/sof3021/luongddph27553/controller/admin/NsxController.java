package sof3021.luongddph27553.controller.admin;

import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sof3021.luongddph27553.entities.Nsx;
import sof3021.luongddph27553.repositories.NsxRepository;
import sof3021.luongddph27553.viewmodel.QLNsx;

import java.util.ArrayList;

@Controller
@RequestMapping("nsx")
public class NsxController {
    ArrayList<QLNsx> listCh = new ArrayList<>();
    @Autowired
    private NsxRepository nsxRepo;
    @Autowired
    private QLNsx ch;
    @Autowired
    private ModelMapper modelMapper;

    public NsxController() {
//        this.listCh.add(new QLNsx("CH1", "Luong", "Hoan Long", "ha_noi", "vi"));
//        this.listCh.add(new QLNsx("CH2", "Luong2", "Hoan Long", "new_york", "us"));
//        this.listCh.add(new QLNsx("CH3", "Luong3", "Hoan Long", "ha_noi", "vi"));
    }

    @GetMapping("index")
    public String index(Model model) {
        model.addAttribute("listCh", this.nsxRepo.findAll());
        model.addAttribute("view_qt","/views/nsx/index.jsp");
        return "layout/layoutCRUD";
    }

    @GetMapping("create")
    public String create(Model model) {
//        QLNsx ch = new QLNsx();
        model.addAttribute("ch", ch);
        model.addAttribute("action", "store");
        model.addAttribute("view_qt","/views/nsx/create.jsp");
        return "layout/layoutCRUD";
    }

    @PostMapping("store")
    public String store(Model model, @Valid @ModelAttribute("ch") QLNsx nsx, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("action", "store");
            model.addAttribute("msg", "Null");
                    model.addAttribute("view_qt","/views/nsx/create.jsp");
        return "layout/layoutCRUD";
        } else {
            Nsx ch = modelMapper.map(nsx, Nsx.class);
            this.nsxRepo.save(ch);
//            listCh.add(nsx);
            return "redirect:/nsx/index";
        }
//                model.addAttribute("view_qt","/views/nsx/create.jsp");

    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") Nsx nsx, Model model) {
        QLNsx chvm = modelMapper.map(nsx, QLNsx.class);
        System.out.println(chvm.getMa());
        System.out.println(nsx.getId());
        model.addAttribute("ch", chvm);
        model.addAttribute("action", "/nsx/update/" + nsx.getId());
                model.addAttribute("view_qt","/views/nsx/create.jsp");
        return "layout/layoutCRUD";
    }


    @PostMapping("update/{id}")
    public String update(@PathVariable("id") Nsx nsx, QLNsx vm) {
        Nsx updatedNsx = modelMapper.map(vm, Nsx.class);
        updatedNsx.setId(nsx.getId()); // Đảm bảo ID của đối tượng được giữ nguyên
        this.nsxRepo.saveAndFlush(updatedNsx);
        return "redirect:/nsx/index";
    }


    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") Nsx nsx , RedirectAttributes redirectAttributes) {
        try {
            this.nsxRepo.delete(nsx);
            redirectAttributes.addFlashAttribute("error", "NSX đã được xóa thành công.");
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Không thể xóa vì NSX đang được sử dụng.");
        }
        return "redirect:/nsx/index";
    }

}
