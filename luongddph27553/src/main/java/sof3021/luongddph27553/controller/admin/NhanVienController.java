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
import sof3021.luongddph27553.entities.ChucVu;
import sof3021.luongddph27553.entities.CuaHang;
import sof3021.luongddph27553.entities.NhanVien;
import sof3021.luongddph27553.repositories.ChucVuRepository;
import sof3021.luongddph27553.repositories.CuaHangRepository;
import sof3021.luongddph27553.repositories.NhanVienRepository;
import sof3021.luongddph27553.viewmodel.QLNhanVien;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class NhanVienController {

    @Autowired
    private NhanVienRepository nhanVienRepository;
    @Autowired
    private CuaHangRepository cuaHangRepository;
    @Autowired
    private ChucVuRepository chucVuRepository;
    @Autowired
    private ModelMapper modelMapper;


    ArrayList<QLNhanVien> listNV = new ArrayList<>();

    public NhanVienController() {
//        this.listNV.add(new QLNhanVien("NV1", "Luong", "Duc", "Do", "0865683753", "Nam", "Hoan Long", "1", date("2003-04-03"), 1));
//        this.listNV.add(new QLNhanVien("NV2", "Luong2", "Duc", "Do", "0865683753", "Nam", "Hoan Long", "1", date("2001-05-04"), 0));
//        this.listNV.add(new QLNhanVien("NV3", "Luong3", "Duc", "Do", "0865683753", "Nam", "Hoan Long", "1", date("2001-12-22"), 1));
    }

    @GetMapping("nhanvien/index")
    public String index(Model model) {
        model.addAttribute("listNv", this.nhanVienRepository.findAll());
        model.addAttribute("view_qt","/views/nhanvien/index.jsp");
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

    @GetMapping("nhanvien/create")
    public String create(Model model) {
        QLNhanVien nv = new QLNhanVien();
        model.addAttribute("nv", nv);
        model.addAttribute("action", "store");
        model.addAttribute("listCh", this.cuaHangRepository.findAll());
        model.addAttribute("listCv", this.chucVuRepository.findAll());
        model.addAttribute("view_qt","/views/nhanvien/create.jsp");
        return "layout/layoutCRUD";
    }

    @PostMapping("nhanvien/store")
    public String store(Model model, @Valid @ModelAttribute("nv") QLNhanVien nhanVien, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("action", "store");
            model.addAttribute("msg", "Null");
            System.out.println(result.getAllErrors());
                    model.addAttribute("view_qt","/views/nhanvien/create.jsp");
        return "layout/layoutCRUD";
        } else {
            CuaHang ch = new CuaHang();
            ch.setId(nhanVien.getCuaHang());
            ChucVu cv = new ChucVu();
            cv.setId(nhanVien.getChucVu());
            NhanVien nv = modelMapper.map(nhanVien, NhanVien.class);
            nv.setCuaHang(ch);
            nv.setChucVu(cv);
            this.nhanVienRepository.save(nv);
            return "redirect:/nhanvien/index";
        }
    }

    @GetMapping("nhanvien/edit/{id}")
    public String edit(@PathVariable("id") NhanVien nhanVien , Model model) {
        QLNhanVien nvvm = modelMapper.map(nhanVien, QLNhanVien.class);
        model.addAttribute("nv", nvvm);
        model.addAttribute("nv2", nhanVien);
        model.addAttribute("listCh", this.cuaHangRepository.findAll());
        model.addAttribute("listCv", this.chucVuRepository.findAll());
        model.addAttribute("action", "/nhanvien/update/" + nhanVien.getId());
                model.addAttribute("view_qt","/views/nhanvien/create.jsp");
        return "layout/layoutCRUD";
    }


    @PostMapping("nhanvien/update/{id}")
    public String update(Model model, @PathVariable("id") @Valid @ModelAttribute("nhanvien") NhanVien nhanVien, QLNhanVien nvvm, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("nhanvien", nvvm);
            System.out.println(result.getAllErrors());
            return "nhanvien/edit";
        } else {
            CuaHang ch = new CuaHang();
            ch.setId(nvvm.getCuaHang());
            ChucVu cv = new ChucVu();
            cv.setId(nvvm.getChucVu());
            NhanVien updatedNV = modelMapper.map(nvvm, NhanVien.class);
            updatedNV.setCuaHang(ch);
            updatedNV.setChucVu(cv);
            updatedNV.setId(nhanVien.getId());
            this.nhanVienRepository.saveAndFlush(updatedNV);
            return "redirect:/nhanvien/index";
        }
    }


    @GetMapping("nhanvien/delete/{id}")
    public String delete(@PathVariable("id") NhanVien nv, RedirectAttributes redirectAttributes) {
        try {
            this.nhanVienRepository.delete(nv);
            redirectAttributes.addFlashAttribute("error", "Nhân viên đã được xóa thành công.");
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Không thể xóa vì Nhân viên đang được sử dụng.");
        }
                return "redirect:/nhanvien/index";
    }
}
