package sof3021.luongddph27553.controller.admin;

import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sof3021.luongddph27553.configuration.MapingConfig;
import sof3021.luongddph27553.entities.CuaHang;
import sof3021.luongddph27553.repositories.CuaHangRepository;
import sof3021.luongddph27553.request.Account;
import sof3021.luongddph27553.viewmodel.QLCuaHang;

import java.util.ArrayList;

@Controller
@RequestMapping("cuahang")
public class CuaHangController {
    ArrayList<QLCuaHang> listCh = new ArrayList<>();
    @Autowired
    private CuaHangRepository cuaHangRepository;
    @Autowired
    private QLCuaHang ch;
    @Autowired
    private ModelMapper modelMapper;

    public CuaHangController() {
        this.listCh.add(new QLCuaHang("CH1", "Luong", "Hoan Long", "ha_noi", "vi"));
        this.listCh.add(new QLCuaHang("CH2", "Luong2", "Hoan Long", "new_york", "us"));
        this.listCh.add(new QLCuaHang("CH3", "Luong3", "Hoan Long", "ha_noi", "vi"));
    }

    @GetMapping("index")
    public String index(Model model) {
        model.addAttribute("listCh", this.cuaHangRepository.findAll());
        model.addAttribute("view_qt","/views/cuahang/index.jsp");
        return "layout/layoutCRUD";
    }

    @GetMapping("create")
    public String create(Model model) {
//        QLCuaHang ch = new QLCuaHang();
        model.addAttribute("ch", ch);
        model.addAttribute("action", "store");
        model.addAttribute("view_qt","/views/cuahang/create.jsp");
        return "layout/layoutCRUD";
    }

    @PostMapping("store")
    public String store(Model model, @Valid @ModelAttribute("ch") QLCuaHang cuaHang, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("action", "store");
            model.addAttribute("msg", "Null");
            model.addAttribute("view_qt","/views/cuahang/create.jsp");
            return "layout/layoutCRUD";
        } else {
            CuaHang ch = modelMapper.map(cuaHang, CuaHang.class);
            this.cuaHangRepository.save(ch);
//            listCh.add(cuaHang);
            return "redirect:index";
        }
//        return "cuahang/create";
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") CuaHang cuaHang, Model model) {
        QLCuaHang chvm = modelMapper.map(cuaHang, QLCuaHang.class);
        model.addAttribute("ch", chvm);
        model.addAttribute("action", "/cuahang/update/" + cuaHang.getId());
        model.addAttribute("view_qt","/views/cuahang/create.jsp");
        return "layout/layoutCRUD";
    }


    @PostMapping("update/{id}")
    public String update(@PathVariable("id") CuaHang cuaHang, QLCuaHang vm) {
                CuaHang updatedCuaHang = modelMapper.map(vm, CuaHang.class);
                updatedCuaHang.setId(cuaHang.getId()); // Đảm bảo ID của đối tượng được giữ nguyên
                this.cuaHangRepository.saveAndFlush(updatedCuaHang);
                return "redirect:/cuahang/index";
    }


    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") CuaHang cuaHang, RedirectAttributes redirectAttributes) {
        try {
            this.cuaHangRepository.delete(cuaHang);
            redirectAttributes.addFlashAttribute("error", "Cửa hàng  đã được xóa thành công.");
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Không thể xóa vì Cửa hàng  đang được sử dụng.");
        }
        return "redirect:/cuahang/index";
    }

}
