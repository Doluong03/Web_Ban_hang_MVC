package sof3021.luongddph27553.controller.admin;

import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sof3021.luongddph27553.entities.ChucVu;
import sof3021.luongddph27553.repositories.ChucVuRepository;
import sof3021.luongddph27553.viewmodel.QLChucVu;

import java.awt.print.Pageable;
import java.util.ArrayList;

@Controller
@RequestMapping("chucvu")
public class ChucVuController {
    ArrayList<QLChucVu> listCh = new ArrayList<>();
    @Autowired
    private ChucVuRepository chucvuRepo;
    @Autowired
    private QLChucVu ch;
    @Autowired
    private ModelMapper modelMapper;

    public ChucVuController() {
//        this.listCh.add(new QLChucVu("CH1", "Luong", "Hoan Long", "ha_noi", "vi"));
//        this.listCh.add(new QLChucVu("CH2", "Luong2", "Hoan Long", "new_york", "us"));
//        this.listCh.add(new QLChucVu("CH3", "Luong3", "Hoan Long", "ha_noi", "vi"));
    }

    @GetMapping("index")
    public String index(Model model) {
        model.addAttribute("listCh", this.chucvuRepo.findAll());
        model.addAttribute("view_qt","/views/chucvu/index.jsp");
        return "layout/layoutCRUD";
    }

    @GetMapping("create")
    public String create(Model model) {
//        QLChucVu ch = new QLChucVu();
        model.addAttribute("ch", ch);
        model.addAttribute("action", "store");
        model.addAttribute("view_qt","/views/chucvu/create.jsp");
        return "layout/layoutCRUD";
    }

    @PostMapping("store")
    public String store(Model model, @Valid @ModelAttribute("ch") QLChucVu chucvu, BindingResult result , RedirectAttributes redirectAttributes) {
        if (result.hasErrors()) {
            model.addAttribute("action", "store");
            model.addAttribute("view_qt","/views/chucvu/create.jsp");
            return "layout/layoutCRUD";
        } else {
            ChucVu ch = modelMapper.map(chucvu, ChucVu.class);
            try {
                this.chucvuRepo.save(ch);
            }catch (Exception e){
                e.printStackTrace();
                redirectAttributes.addFlashAttribute("error", "Trùng mã");
                model.addAttribute("action", "store");
                model.addAttribute("view_qt","/views/chucvu/create.jsp");
                return "layout/layoutCRUD";
            }
//            listCh.add(chucvu);
            return "redirect:index";
        }
//        return "chucvu/create";
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") ChucVu chucvu, Model model) {
        QLChucVu chvm = modelMapper.map(chucvu, QLChucVu.class);
        System.out.println(chvm.getMa());
        System.out.println(chucvu.getId());
        model.addAttribute("ch", chvm);
        model.addAttribute("action", "/chucvu/update/" + chucvu.getId());
        model.addAttribute("view_qt","/views/chucvu/create.jsp");
        return "layout/layoutCRUD";
    }


    @PostMapping("update/{id}")
    public String update(@PathVariable("id") ChucVu chucvu, QLChucVu vm) {
        ChucVu updatedChucVu = modelMapper.map(vm, ChucVu.class);
        updatedChucVu.setId(chucvu.getId()); // Đảm bảo ID của đối tượng được giữ nguyên
        this.chucvuRepo.saveAndFlush(updatedChucVu);
        return "redirect:/chucvu/index";
    }


    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") ChucVu chucvu, RedirectAttributes redirectAttributes) {
        try {
            this.chucvuRepo.delete(chucvu);
            redirectAttributes.addFlashAttribute("error", "Chức vụ đã được xóa thành công.");
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Không thể xóa vì chức vụ đang được sử dụng.");
        }
        return "redirect:/chucvu/index";
    }

}
