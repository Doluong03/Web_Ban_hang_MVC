package sof3021.luongddph27553.controller.admin;

import jakarta.validation.Valid;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sof3021.luongddph27553.entities.*;
import sof3021.luongddph27553.repositories.*;
import sof3021.luongddph27553.viewmodel.QLChiTietSP;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

@Controller
public class ChiTietSPController {

    @Autowired
    private ChiTietSPRepository chitietSpRepo;
    @Autowired
    private SanPhamRepository sanPhamRepo;
    @Autowired
    private DongSPRepository dongSprepo;
    @Autowired
    private NsxRepository nsxRepo;
    @Autowired
    private MauSacRepository mauSacRepo;
    @Autowired
    private ModelMapper modelMapper;


    ArrayList<QLChiTietSP> listNV = new ArrayList<>();

    public ChiTietSPController() {
//        this.listNV.add(new QLChiTietSP("NV1", "Luong", "Duc", "Do", "0865683753", "Nam", "Hoan Long", "1", date("2003-04-03"), 1));
//        this.listNV.add(new QLChiTietSP("NV2", "Luong2", "Duc", "Do", "0865683753", "Nam", "Hoan Long", "1", date("2001-05-04"), 0));
//        this.listNV.add(new QLChiTietSP("NV3", "Luong3", "Duc", "Do", "0865683753", "Nam", "Hoan Long", "1", date("2001-12-22"), 1));
    }

    @GetMapping("chitietsp/index")
    public String index(@RequestParam(defaultValue = "0",name = "page") Integer number, Model model) {
        model.addAttribute("listNv", this.chitietSpRepo.findAll());
        model.addAttribute("view_qt","/views/chitietsp/index.jsp");
        Pageable pageable = PageRequest.of(number, 4);
        Page<ChiTietSP> listMayTinh = chitietSpRepo.findAll(pageable);
        model.addAttribute("listMayTinh",listMayTinh);
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

    @GetMapping("chitietsp/create")
    public String create(Model model) {
        QLChiTietSP nv = new QLChiTietSP();
        model.addAttribute("nv", nv);
        model.addAttribute("action", "store");
        model.addAttribute("listCh", this.sanPhamRepo.findAll());
        model.addAttribute("listCv", this.dongSprepo.findAll());
        model.addAttribute("listms", this.mauSacRepo.findAll());
        model.addAttribute("listnsx", this.nsxRepo.findAll());
        model.addAttribute("view_qt","/views/chitietsp/create.jsp");
        return "layout/layoutCRUD";
    }

    @PostMapping("chitietsp/store")
    public String store(Model model, @Valid @ModelAttribute("nv") QLChiTietSP chiTietSp, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("listCh", this.sanPhamRepo.findAll());
            model.addAttribute("listCv", this.dongSprepo.findAll());
            model.addAttribute("listms", this.mauSacRepo.findAll());
            model.addAttribute("listnsx", this.nsxRepo.findAll());
            model.addAttribute("action", "store");
            model.addAttribute("msg", "Null");
            System.out.println(result.getAllErrors());
            model.addAttribute("view_qt","/views/chitietsp/create.jsp");
            return "layout/layoutCRUD";
        } else {
            SanPham sp = new SanPham();
            sp.setId(chiTietSp.getSanPham());
            MauSac ms = new MauSac();
            ms.setId(chiTietSp.getMauSac());
            DongSP dsp = new DongSP();
            dsp.setId(chiTietSp.getDongSP());
            Nsx nsx = new Nsx();
            nsx.setId(chiTietSp.getNsx());
            ChiTietSP nv = modelMapper.map(chiTietSp, ChiTietSP.class);
            nv.setSanPham(sp);
            nv.setNsx(nsx);
            nv.setDongSP(dsp);
            nv.setMauSac(ms);
            this.chitietSpRepo.save(nv);
            return "redirect:/chitietsp/index";
        }
    }

    @GetMapping("chitietsp/edit/{id}")
    public String edit(@PathVariable("id") ChiTietSP chiTietSp , Model model) {
        QLChiTietSP nvvm = modelMapper.map(chiTietSp, QLChiTietSP.class);
        model.addAttribute("nv", nvvm);
        model.addAttribute("nv2", chiTietSp);
        model.addAttribute("listCh", this.sanPhamRepo.findAll());
        model.addAttribute("listCv", this.dongSprepo.findAll());
        model.addAttribute("listms", this.mauSacRepo.findAll());
        model.addAttribute("listnsx", this.nsxRepo.findAll());
        model.addAttribute("action", "/chitietsp/update/" + chiTietSp.getId());
        model.addAttribute("view_qt","/views/chitietsp/create.jsp");
        return "layout/layoutCRUD";
    }


    @PostMapping("chitietsp/update/{id}")
    public String update(Model model, @PathVariable("id") @Valid @ModelAttribute("chitietsp") ChiTietSP chiTietSp, QLChiTietSP nvvm, BindingResult result) {
        if (result.hasErrors()) {
            model.addAttribute("listCh", this.sanPhamRepo.findAll());
            model.addAttribute("listCv", this.dongSprepo.findAll());
            model.addAttribute("listms", this.mauSacRepo.findAll());
            model.addAttribute("listnsx", this.nsxRepo.findAll());
            model.addAttribute("chitietsp", nvvm);
            System.out.println(result.getAllErrors());
            model.addAttribute("view_qt","/views/chitietsp/edit.jsp");
            return "layout/layoutCRUD";
        } else {
            SanPham ch = new SanPham();
            ch.setId(nvvm.getSanPham());
            Nsx cv = new Nsx();
            cv.setId(nvvm.getNsx());
            DongSP dsp = new DongSP();
            dsp.setId(nvvm.getDongSP());
            MauSac ms = new MauSac();
            ms.setId(nvvm.getMauSac());
            ChiTietSP updatedNV = modelMapper.map(nvvm, ChiTietSP.class);
            updatedNV.setSanPham(ch);
            updatedNV.setNsx(cv);
            updatedNV.setDongSP(dsp);
            updatedNV.setMauSac(ms);
            updatedNV.setId(chiTietSp.getId());
            this.chitietSpRepo.saveAndFlush(updatedNV);
            return "redirect:/chitietsp/index";
        }
    }


    @GetMapping("chitietsp/delete/{id}")
    public String delete(@PathVariable("id") ChiTietSP nv, RedirectAttributes redirectAttributes) {
        try {
            this.chitietSpRepo.delete(nv);
            redirectAttributes.addFlashAttribute("error", "sản phẩm đã được xóa thành công.");
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Không thể xóa vì sản phẩm đang được sử dụng.");
        }
                return "redirect:/chitietsp/index";
    }
}
