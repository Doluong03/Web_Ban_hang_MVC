package sof3021.luongddph27553.controller.admin;

import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sof3021.luongddph27553.entities.MauSac;
import sof3021.luongddph27553.repositories.MauSacRepository;
import sof3021.luongddph27553.viewmodel.QLMauSac;

import java.util.ArrayList;

@Controller
@RequestMapping("mausac")
public class MauSacController {
    ArrayList<QLMauSac> listCh = new ArrayList<>();
    @Autowired
    private MauSacRepository mausacRepo;
    @Autowired
    private QLMauSac ch;
    @Autowired
    private ModelMapper modelMapper;

    public MauSacController() {
//        this.listCh.add(new QLMauSac("CH1", "Luong", "Hoan Long", "ha_noi", "vi"));
//        this.listCh.add(new QLMauSac("CH2", "Luong2", "Hoan Long", "new_york", "us"));
//        this.listCh.add(new QLMauSac("CH3", "Luong3", "Hoan Long", "ha_noi", "vi"));
    }

    @GetMapping("index")
    public String index(Model model) {
        model.addAttribute("listCh", this.mausacRepo.findAll());
        model.addAttribute("view_qt","/views/mausac/index.jsp");
        return "layout/layoutCRUD";
    }

    @GetMapping("create")
    public String create(Model model) {
//        QLMauSac ch = new QLMauSac();
        model.addAttribute("ch", ch);
        model.addAttribute("action", "store");
        model.addAttribute("view_qt","/views/mausac/create.jsp");
        return "layout/layoutCRUD";
    }

    @PostMapping("store")
    public String store(Model model, @Valid @ModelAttribute("ch") QLMauSac mausac, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("action", "store");
            model.addAttribute("view_qt","/views/mausac/create.jsp");
            return "layout/layoutCRUD";
        } else {
            MauSac ch = modelMapper.map(mausac, MauSac.class);
            this.mausacRepo.save(ch);
//            listCh.add(mausac);
            return "redirect:/mausac/index";
        }
//        return "mausac/create";
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") MauSac mausac, Model model) {
        QLMauSac chvm = modelMapper.map(mausac, QLMauSac.class);
        System.out.println(chvm.getMa());
        System.out.println(mausac.getId());
        model.addAttribute("ch", chvm);
        model.addAttribute("action", "/mausac/update/" + mausac.getId());
        model.addAttribute("view_qt","/views/mausac/create.jsp");
        return "layout/layoutCRUD";
    }


    @PostMapping("update/{id}")
    public String update(@PathVariable("id") MauSac mausac, QLMauSac vm) {
        MauSac updatedMauSac = modelMapper.map(vm, MauSac.class);
        updatedMauSac.setId(mausac.getId()); // Đảm bảo ID của đối tượng được giữ nguyên
        this.mausacRepo.saveAndFlush(updatedMauSac);
        return "redirect:/mausac/index";
    }


    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") MauSac mausac , RedirectAttributes redirectAttributes) {
        try {
            this.mausacRepo.delete(mausac);
            redirectAttributes.addFlashAttribute("error", "Màu sắc đã được xóa thành công.");
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Không thể xóa vì Màu sắc đang được sử dụng.");
        }
        return "redirect:/mausac/index";
    }

}
