package sof3021.luongddph27553.controller.admin;

import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sof3021.luongddph27553.entities.DongSP;
import sof3021.luongddph27553.repositories.DongSPRepository;
import sof3021.luongddph27553.viewmodel.QLDongSP;

import java.util.ArrayList;

@Controller
@RequestMapping("dongsp")
public class DongSPController {
    ArrayList<QLDongSP> listCh = new ArrayList<>();
    @Autowired
    private DongSPRepository dongspRepo;
    @Autowired
    private QLDongSP ch;
    @Autowired
    private ModelMapper modelMapper;

    public DongSPController() {
//        this.listCh.add(new QLDongSP("CH1", "Luong", "Hoan Long", "ha_noi", "vi"));
//        this.listCh.add(new QLDongSP("CH2", "Luong2", "Hoan Long", "new_york", "us"));
//        this.listCh.add(new QLDongSP("CH3", "Luong3", "Hoan Long", "ha_noi", "vi"));
    }

    @GetMapping("index")
    public String index(Model model) {
        model.addAttribute("listCh", this.dongspRepo.findAll());
        model.addAttribute("view_qt","/views/dongsp/index.jsp");
        return "layout/layoutCRUD";
    }

    @GetMapping("create")
    public String create(Model model) {
//        QLDongSP ch = new QLDongSP();
        model.addAttribute("ch", ch);
        model.addAttribute("action", "store");
        model.addAttribute("view_qt","/views/dongsp/create.jsp");
        return "layout/layoutCRUD";
    }

    @PostMapping("store")
    public String store(Model model, @Valid @ModelAttribute("ch") QLDongSP dongsp, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("action", "store");
            model.addAttribute("msg", "Null");
            model.addAttribute("view_qt","/views/dongsp/create.jsp");
            return "layout/layoutCRUD";
        } else {
            DongSP ch = modelMapper.map(dongsp, DongSP.class);
            this.dongspRepo.save(ch);
//            listCh.add(dongsp);
            return "redirect:/dongsp/index";
        }
//        return "dongsp/create";
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") DongSP dongsp, Model model) {
        QLDongSP chvm = modelMapper.map(dongsp, QLDongSP.class);
        System.out.println(chvm.getMa());
        System.out.println(dongsp.getId());
        model.addAttribute("ch", chvm);
        model.addAttribute("action", "/dongsp/update/" + dongsp.getId());
        model.addAttribute("view_qt","/views/dongsp/create.jsp");
        return "layout/layoutCRUD";    }


    @PostMapping("update/{id}")
    public String update(@PathVariable("id") DongSP dongsp, QLDongSP vm) {
        DongSP updatedDongSP = modelMapper.map(vm, DongSP.class);
        updatedDongSP.setId(dongsp.getId()); // Đảm bảo ID của đối tượng được giữ nguyên
        this.dongspRepo.saveAndFlush(updatedDongSP);
        return "redirect:/dongsp/index";
    }


    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") DongSP dongsp , RedirectAttributes redirectAttributes) {
        try {
            this.dongspRepo.delete(dongsp);
            redirectAttributes.addFlashAttribute("error", "Dòng sản phẩm  đã được xóa thành công.");
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Không thể xóa vì Dòng sản phẩm  đang được sử dụng.");
        }
        return "redirect:/dongsp/index";
    }

}
