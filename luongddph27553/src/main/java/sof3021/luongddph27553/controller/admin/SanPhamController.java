package sof3021.luongddph27553.controller.admin;

import com.microsoft.sqlserver.jdbc.SQLServerException;
import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sof3021.luongddph27553.entities.SanPham;
import sof3021.luongddph27553.repositories.SanPhamRepository;
import sof3021.luongddph27553.viewmodel.QLSanPham;

import java.sql.SQLException;
import java.util.ArrayList;

@Controller
@RequestMapping("sanpham")
public class SanPhamController {
    ArrayList<QLSanPham> listCh = new ArrayList<>();
    @Autowired
    private SanPhamRepository sanphamRepo;
    @Autowired
    private QLSanPham ch;
    @Autowired
    private ModelMapper modelMapper;

    public SanPhamController() {
//        this.listCh.add(new QLSanPham("CH1", "Luong", "Hoan Long", "ha_noi", "vi"));
//        this.listCh.add(new QLSanPham("CH2", "Luong2", "Hoan Long", "new_york", "us"));
//        this.listCh.add(new QLSanPham("CH3", "Luong3", "Hoan Long", "ha_noi", "vi"));
    }

    @GetMapping("index")
    public String index(Model model) {
        model.addAttribute("listCh", this.sanphamRepo.findAll());
        model.addAttribute("view_qt","/views/sanpham/index.jsp");
        return "layout/layoutCRUD";
    }

    @GetMapping("create")
    public String create(Model model) {
//        QLSanPham ch = new QLSanPham();
        model.addAttribute("ch", ch);
        model.addAttribute("action", "store");
        model.addAttribute("view_qt","/views/sanpham/create.jsp");
        return "layout/layoutCRUD";
    }

    @PostMapping("store")
    public String store(Model model, @Valid @ModelAttribute("ch") QLSanPham sanpham, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("action", "store");
            model.addAttribute("msg", "Null");
            model.addAttribute("view_qt","/views/sanpham/create.jsp");
            return "layout/layoutCRUD";
        } else {
            SanPham ch = modelMapper.map(sanpham, SanPham.class);
            this.sanphamRepo.save(ch);
//            listCh.add(sanpham);
            return "redirect:/sanpham/index";
        }
//        return "sanpham/create";
    }

    @GetMapping("edit/{id}")
    public String edit(@PathVariable("id") SanPham sanpham, Model model) {
        QLSanPham chvm = modelMapper.map(sanpham, QLSanPham.class);
        System.out.println(chvm.getMa());
        System.out.println(sanpham.getId());
        model.addAttribute("ch", chvm);
        model.addAttribute("action", "/sanpham/update/" + sanpham.getId());
        model.addAttribute("view_qt","/views/sanpham/create.jsp");
        return "layout/layoutCRUD";
    }


    @PostMapping("update/{id}")
    public String update(@PathVariable("id") SanPham sanpham, QLSanPham vm) {
        SanPham updatedSanPham = modelMapper.map(vm, SanPham.class);
        updatedSanPham.setId(sanpham.getId()); // Đảm bảo ID của đối tượng được giữ nguyên
        this.sanphamRepo.saveAndFlush(updatedSanPham);
        return "redirect:/sanpham/index";
    }


    @GetMapping("delete/{id}")
    public String delete(@PathVariable("id") SanPham sanpham , RedirectAttributes redirectAttributes) {
        try {
            this.sanphamRepo.delete(sanpham);
            redirectAttributes.addFlashAttribute("error", "sản phẩm đã được xóa thành công.");
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Không thể xóa vì sản phẩm đang được sử dụng.");
        }
        return "redirect:/sanpham/index";
    }

}
