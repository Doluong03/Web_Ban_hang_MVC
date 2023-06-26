package sof3021.luongddph27553.controller.admin;

import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sof3021.luongddph27553.entities.NhanVien;
import sof3021.luongddph27553.entities.KhachHang;
import sof3021.luongddph27553.entities.HoaDon;
import sof3021.luongddph27553.repositories.KhachHangRepository;
import sof3021.luongddph27553.repositories.HoaDonRepository;
import sof3021.luongddph27553.repositories.NhanVienRepository;
import sof3021.luongddph27553.viewmodel.QLHoaDon;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class HoaDonController {

    @Autowired
    private HoaDonRepository hoadonRepo;
    @Autowired
    private KhachHangRepository khachhangRepo;
    @Autowired
    private NhanVienRepository nhanvienRepo;
    @Autowired
    private ModelMapper modelMapper;


    ArrayList<QLHoaDon> listNV = new ArrayList<>();

    public HoaDonController() {
//        this.listNV.add(new QLHoaDon("NV1", "Luong", "Duc", "Do", "0865683753", "Nam", "Hoan Long", "1", date("2003-04-03"), 1));
//        this.listNV.add(new QLHoaDon("NV2", "Luong2", "Duc", "Do", "0865683753", "Nam", "Hoan Long", "1", date("2001-05-04"), 0));
//        this.listNV.add(new QLHoaDon("NV3", "Luong3", "Duc", "Do", "0865683753", "Nam", "Hoan Long", "1", date("2001-12-22"), 1));
    }

    @GetMapping("hoadon/index")
    public String index(Model model) {
        model.addAttribute("listHd", this.hoadonRepo.findAll());
        model.addAttribute("view_qt","/views/hoadon/index.jsp");
        return "layout/layoutCRUD";
    }

    private Date date(String ns) {
        try {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = format.parse(ns);
            return date;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    @GetMapping("hoadon/create")
    public String create(Model model) {
        QLHoaDon nv = new QLHoaDon();
        model.addAttribute("nv", nv);
        model.addAttribute("action", "store");
        model.addAttribute("listKh", this.khachhangRepo.findAll());
        model.addAttribute("listNv", this.nhanvienRepo.findAll());
        model.addAttribute("view_qt","/views/hoadon/create.jsp");
        return "layout/layoutCRUD";
    }

    @PostMapping("hoadon/store")
    public String store(Model model, @Valid @ModelAttribute("nv") QLHoaDon hoadon, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("action", "store");
            model.addAttribute("msg", "Null");
            System.out.println(result.getAllErrors());
            model.addAttribute("view_qt","/views/hoadon/create.jsp");
            return "layout/layoutCRUD";
        } else {
            KhachHang ch = new KhachHang();
            ch.setId(hoadon.getKhachHang());
            NhanVien cv = new NhanVien();
            cv.setId(hoadon.getNhanVien());
            HoaDon nv = modelMapper.map(hoadon, HoaDon.class);
            nv.setKhachHang(ch);
            nv.setNhanVien(cv);
            this.hoadonRepo.save(nv);
            return "redirect:/hoadon/index";
        }
    }

    @GetMapping("hoadon/edit/{id}")
    public String edit(@PathVariable("id") HoaDon hoadon , Model model) {
        QLHoaDon nvvm = modelMapper.map(hoadon, QLHoaDon.class);
        model.addAttribute("nv", nvvm);
        model.addAttribute("nv2", hoadon);
        model.addAttribute("listKh", this.khachhangRepo.findAll());
        model.addAttribute("listNv", this.nhanvienRepo.findAll());
        model.addAttribute("action", "/hoadon/update/" + hoadon.getId());
        model.addAttribute("view_qt","/views/hoadon/create.jsp");
        return "layout/layoutCRUD";
    }


    @PostMapping("hoadon/update/{id}")
    public String update(Model model, @PathVariable("id") @Valid @ModelAttribute("hoadon") HoaDon hoadon, QLHoaDon nvvm, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("hoadon", nvvm);
            System.out.println(result.getAllErrors());
            return "hoadon/edit";
        } else {
            KhachHang ch = new KhachHang();
            ch.setId(nvvm.getKhachHang());
            NhanVien cv = new NhanVien();
            cv.setId(nvvm.getNhanVien());
            HoaDon updatedNV = modelMapper.map(nvvm, HoaDon.class);
            updatedNV.setKhachHang(ch);
            updatedNV.setNhanVien(cv);
            updatedNV.setId(hoadon.getId());
            this.hoadonRepo.saveAndFlush(updatedNV);
            return "redirect:/hoadon/index";
        }
    }


    @GetMapping("hoadon/delete/{id}")
    public String delete(@PathVariable("id") HoaDon nv, RedirectAttributes redirectAttributes) {
        try {
            this.hoadonRepo.delete(nv);
            redirectAttributes.addFlashAttribute("error", "sản phẩm đã được xóa thành công.");
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Không thể xóa vì sản phẩm đang được sử dụng.");
        }
                return "redirect:/hoadon/index";
    }
}
