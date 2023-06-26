package sof3021.luongddph27553.controller.admin;

import jakarta.servlet.http.HttpSession;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import sof3021.luongddph27553.entities.*;
import sof3021.luongddph27553.repositories.*;
import sof3021.luongddph27553.viewmodel.QLHoaDon;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("muahang")
public class MuaHangController {
    ArrayList<HoaDonChiTiet> ListOut = new ArrayList<>();
    @Autowired
    private ChiTietSPRepository chiTietSPRepository;
    @Autowired
    private HoaDonChiTietRepository hdctr;
    @Autowired
    private HoaDonRepository hoaDonRepository;
    @Autowired
    private HoaDonChiTietRepository hoaDonChiTietRepository;
    @Autowired
    private NhanVienRepository nvr;
    @Autowired
    private MuaHangRepo mhr;
    @Autowired
    private ModelMapper modelMapper;

    @GetMapping("trangchu")
    public String trangchu(Model model) {
        model.addAttribute("listCt", chiTietSPRepository.findAll());
        Map<String, Integer> slbMap = new HashMap<>();
        for (ChiTietSP x : chiTietSPRepository.findAll()) {
            int slb = (int) Math.floor(x.getSoLuongTon() / 3);
            slbMap.put(x.getSanPham().getTen(), slb);
        }
        model.addAttribute("slbMap", slbMap);
        model.addAttribute("view","/views/muahang/home.jsp");
        return "layout/layoutBH";
    }

    @GetMapping("edit/{id}/{sl}")
    public String editGH(@PathVariable("id")ChiTietSP qlct,@PathVariable("sl") int soLuong, Model model) {
        if (ListOut.isEmpty()) {
            HoaDon hd = mhr.taoHD((ArrayList<HoaDon>) hoaDonRepository.findAll(), new HoaDon());
            hoaDonRepository.save(hd);
            HoaDonChiTiet qlhd = new HoaDonChiTiet(hd, qlct, soLuong);
            mhr.addCart(qlhd, ListOut,soLuong);
            for (HoaDonChiTiet x : ListOut) {
                hdctr.save(x);
            }
        } else {
            Optional<HoaDon> hd = hoaDonRepository.findById((ListOut.get(0).getHoaDon().getId()));
            HoaDon hoaDon = hd.get();
            HoaDonChiTiet qlhd = new HoaDonChiTiet(hoaDon, qlct, soLuong);
            mhr.addCart(qlhd, ListOut,soLuong);
            for (HoaDonChiTiet x : ListOut) {
                hdctr.save(x);
            }
        }
        model.addAttribute("ct", qlct);
        return "redirect:/muahang/giohang";
    }

    @GetMapping("giohang")
    public String giohang(Model model) {
        model.addAttribute("listCt2", ListOut);
        model.addAttribute("view","/views/muahang/giohang.jsp");
        return "layout/layoutBH";
    }

    @GetMapping("deleteSP/{id}")
    public String delete(@PathVariable("id") ChiTietSP nv) {
        Optional<ChiTietSP> ctsp = chiTietSPRepository.findById((nv.getId()));
        ChiTietSP ct = ctsp.get();
        HoaDonChiTiet qlct = this.mhr.findByMa2(ct.getMa(), ListOut);
        ListOut.remove(qlct);
        hdctr.delete(qlct);
        return "redirect:/muahang/giohang";
    }

    @GetMapping("editThanhtoan")
    public String viewThanhToan(@RequestParam("ma") String ma, @RequestParam("total") BigDecimal total, Model model) {
        HoaDon hd = hoaDonRepository.findByMaLike(ma);
        hd.setTongTien(total);
        model.addAttribute("hd", hd);
        model.addAttribute("listCt2", ListOut);
        model.addAttribute("view","/views/muahang/thanhtoan.jsp");
        return "layout/layoutBH";
    }

    @PostMapping("thanhtoan")
    public String thanhtoan(@RequestParam("ma") String ma, HttpSession session, QLHoaDon hdvm) {
        HoaDon hd = hoaDonRepository.findByMaLike(ma);
        KhachHang kh = (KhachHang) session.getAttribute("user");
        System.out.println(kh.getMa());
        String maNv = "NVDefault";
//        if (kh != null) {
//            hdvm.setKhachHang(kh.getId());
//        }
        NhanVien nhanVien = nvr.findByMaLike(maNv);
//        if (nhanVien != null) {
//            hdvm.setNhanVien(nhanVien.getId());
//        }
        try {
            // Thiết lập các giá trị ngày cho đối tượng hd
            Date ngayHienTai = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            String ngayHienTaiStr = formatter.format(ngayHienTai);
            Date ngayTao = formatter.parse(ngayHienTaiStr);
            Calendar cal = Calendar.getInstance();
            cal.add(Calendar.DATE, 5);
            Date ngayNhan = cal.getTime();
            Calendar cal2 = Calendar.getInstance();
            cal2.add(Calendar.DATE, 1);
            Date ngayShip = cal2.getTime();
            HoaDon hoaDon = modelMapper.map(hdvm, HoaDon.class);
            hoaDon.setKhachHang(kh);
            hoaDon.setNhanVien(nhanVien);
            hoaDon.setNgayTao(ngayTao);
            hoaDon.setNgayThanhToan(ngayNhan);
            hoaDon.setNgayShip(ngayShip);
            hoaDon.setNgayNhan(ngayNhan);
            hoaDon.setId(hd.getId());
            hoaDonRepository.save(hoaDon);

            return "redirect:/muahang/lichsugd";
        } catch (ParseException e) {
            e.printStackTrace();
        }
        this.ListOut.removeAll(ListOut);
        return "redirect:/muahang/lichsugd";
    }

    @GetMapping("lichsugd")
    public String lichsuGD(HttpSession session, Model model) {
        KhachHang kh = (KhachHang) session.getAttribute("user");
        model.addAttribute("listHd", hoaDonRepository.findByKhachHang(kh));
        model.addAttribute("view","/views/muahang/lichsuGD.jsp");
        return "layout/layoutBH";
    }

    @GetMapping("chitiet/{id}")
    public String chitiet(@PathVariable("id") HoaDon hd, Model model) {
        model.addAttribute("hd", hd);
        model.addAttribute("listHd", hoaDonChiTietRepository.findByHoaDon(hd));
        model.addAttribute("view","/views/muahang/hoaDonChiTiet.jsp");
        return "layout/layoutBH";
    }

    @GetMapping("/decrementValue/{ctid}/{hdid}")
    public String decrementValue(@PathVariable("ctid") UUID ctid, @PathVariable("hdid") UUID hdid, Model model) {
        // Xử lý giảm số lượng sản phẩm theo id
        Optional<ChiTietSP> chiTietSP = chiTietSPRepository.findById(ctid);
        ChiTietSP ct = chiTietSP.get();
        Optional<HoaDon> hoaDon = hoaDonRepository.findById(hdid);
        HoaDon hd = hoaDon.get();
        HoaDonChiTiet hdct = hoaDonChiTietRepository.findByChiTietSPAndHoaDon(ct, hd);
        // ...
        // Cập nhật lại tổng tiền
        // Tính toán tổng tiền sau khi giảm số lượng sản phẩm
        HoaDonChiTiet qlhd = new HoaDonChiTiet(hd, ct, hdct.getSoLuong() - 1);
        mhr.decreCart(qlhd, ListOut);
        hdctr.delete(qlhd);
        Iterator<HoaDonChiTiet> iterator = ListOut.iterator();
        while (iterator.hasNext()) {
            HoaDonChiTiet x = iterator.next();
            if (x.getSoLuong() <= 0) {
                iterator.remove(); // Xóa phần tử hiện tại một cách an toàn
            } else {
                hdctr.save(x);
            }
        }

//        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("listCt2", ListOut);
        return "redirect:/muahang/giohang"; // Thay thế "your-view" bằng tên view của bạn
    }

    @GetMapping("/incrementValue/{ctid}/{hdid}")
    public String incrementValue(@PathVariable("ctid") UUID ctid, @PathVariable("hdid") UUID hdid, Model model) {
        // Xử lý giảm số lượng sản phẩm theo id
        Optional<ChiTietSP> chiTietSP = chiTietSPRepository.findById(ctid);
        ChiTietSP ct = chiTietSP.get();
        Optional<HoaDon> hoaDon = hoaDonRepository.findById(hdid);
        HoaDon hd = hoaDon.get();
        HoaDonChiTiet hdct = hoaDonChiTietRepository.findByChiTietSPAndHoaDon(ct, hd);

        // ...
        // Cập nhật lại tổng tiền
        // Tính toán tổng tiền sau khi giảm số lượng sản phẩm
        HoaDonChiTiet qlhd = new HoaDonChiTiet(hd, ct, 1);
        mhr.addCart(qlhd, ListOut,1);
        hdctr.delete(qlhd);
        for (HoaDonChiTiet x : ListOut) {
                hdctr.save(x);

        }
        model.addAttribute("listCt2", ListOut);
        return "redirect:/muahang/giohang"; // Thay thế "your-view" bằng tên view của bạn
    }

    @GetMapping("detail/{id}")
    public String detailSP(@PathVariable("id") ChiTietSP chiTietSP, Model model){
        model.addAttribute("ct",chiTietSP);
        model.addAttribute("listCt",chiTietSPRepository.findAll());
        model.addAttribute("view","/views/muahang/detailSP.jsp");
        return "layout/layoutBH";
    }

    @GetMapping("updateTT/{id}/{tt}")
    public String updateTT(@PathVariable("id") HoaDon hd, @PathVariable("tt") int tt){
        Optional<HoaDon> hoaDon = hoaDonRepository.findById(hd.getId());
        HoaDon newHd=hoaDon.get();
        newHd.setId(hd.getId());
        newHd.setTinhTrang(tt);
        hoaDonRepository.save(newHd);
        return "redirect:/muahang/lichsugd";
    }
    @GetMapping("/timkiem")
    public String timKiem(@RequestParam("tenSP") String key, Model model) {
        ArrayList<ChiTietSP> listOutSP=chiTietSPRepository.findBySanPhamTenOrDongSPMa(key);
        model.addAttribute("listCt", listOutSP);
        model.addAttribute("view","/views/muahang/home.jsp");
        return "layout/layoutBH";
    }

}
