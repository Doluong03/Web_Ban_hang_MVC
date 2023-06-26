package sof3021.luongddph27553.controller.admin;

import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sof3021.luongddph27553.entities.CuaHang;
import sof3021.luongddph27553.entities.KhachHang;
import sof3021.luongddph27553.repositories.KhachHangRepository;
import sof3021.luongddph27553.viewmodel.QLCuaHang;
import sof3021.luongddph27553.viewmodel.QLKhachHang;

import java.util.ArrayList;

@Controller
@RequestMapping("khachhang")
public class KhachHangController {
    @Autowired
    private QLKhachHang kh;
    @Autowired
    private KhachHangRepository khachHangRepository;
    @Autowired
    private ModelMapper modelMapper;

    private ArrayList<QLKhachHang> ListKH = new ArrayList<>();

    private KhachHangController() {
//        this.ListKH.add(new QLKhachHang("KH0", "Đỗ", "Đức", "Lương", "2003-12-04", "0865683753", "Hoàn Long", "Hưng Yên", "1", "Việt Nam"));
//        this.ListKH.add(new QLKhachHang("KH1", "Nguyễn", "Văn", "Nam", "2003-07-27", "0349375275", "Phú Đô ", "Hà Nội", "2", "Việt Nam"));
    }

    @GetMapping("index")
    public String index(Model model) {
        model.addAttribute("listKH", this.khachHangRepository.findAll());
        model.addAttribute("view_qt","/views/khachhang/index.jsp");
        return "layout/layoutCRUD";
    }

    @GetMapping("create")
    public String create(Model model) {
        model.addAttribute("kh", kh);
        model.addAttribute("action", "store");
                model.addAttribute("view_qt","/views/khachhang/create.jsp");
        return "layout/layoutCRUD";
    }

    @PostMapping("store")
    public String store(@Valid @ModelAttribute("kh") QLKhachHang khachHang, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("action", "store");
            System.out.println(result.getAllErrors());
                    model.addAttribute("view_qt","/views/khachhang/create.jsp");
        return "layout/layoutCRUD";
        } else {
            KhachHang kh = modelMapper.map(khachHang, KhachHang.class);
            this.khachHangRepository.save(kh);
            return "redirect:/khachhang/index";
        }
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") KhachHang khachHang , Model model) {
        QLKhachHang khvm = modelMapper.map(khachHang, QLKhachHang.class);
        model.addAttribute("kh", khvm);
        model.addAttribute("action", "/khachhang/update/" + khachHang.getId());
                model.addAttribute("view_qt","/views/khachhang/create.jsp");
        return "layout/layoutCRUD";
    }


    @PostMapping("update/{id}")
    public String update( @PathVariable("id")   @Valid @ModelAttribute("kh")KhachHang khachHang, QLKhachHang khvm, BindingResult result ,Model model) {
        if (result.hasErrors()) {
            System.out.println(result.getAllErrors());
            model.addAttribute("kh", khvm);
            return "khachhang/edit";
        } else {
                    KhachHang updatedKh = modelMapper.map(khvm, KhachHang.class);
                    updatedKh.setId(khachHang.getId());
                    this.khachHangRepository.saveAndFlush(updatedKh);
                    return "redirect:/khachhang/index";
                }
    }

    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") KhachHang khachHang, RedirectAttributes redirectAttributes) {

        try {
            this.khachHangRepository.delete(khachHang);
            redirectAttributes.addFlashAttribute("error", "Khách hàng đã được xóa thành công.");
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Không thể xóa vì Khách hàng đang được sử dụng.");
        }
                return "redirect:/khachhang/index";
    }

}
