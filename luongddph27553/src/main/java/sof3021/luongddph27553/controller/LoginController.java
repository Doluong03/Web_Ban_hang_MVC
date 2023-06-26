package sof3021.luongddph27553.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import sof3021.luongddph27553.entities.KhachHang;
import sof3021.luongddph27553.entities.NhanVien;
import sof3021.luongddph27553.repositories.KhachHangRepository;
import sof3021.luongddph27553.repositories.NhanVienRepository;
import sof3021.luongddph27553.request.Account;

@Controller
public class LoginController {
    @Autowired
    private KhachHangRepository khr;
    @Autowired
    private NhanVienRepository nvr;

    @GetMapping("login")
    public String getLoginForm() {

        return "login";
    }

    @PostMapping("login")
    public String login(Account account, HttpSession session,HttpServletRequest request) {
        System.out.println(account.getMa());

        // Kiểm tra thông tin đăng nhập
        if (account.getMatkhau() == null || account.getMatkhau().isEmpty()) {
            System.out.println(account.getMatkhau());
            return "login";
        }else{


        // Kiểm tra thông tin đăng nhập của khách hàng
        for (KhachHang kh : khr.findAll()) {
            if (account.getMa().equals(kh.getSdt()) && account.getMatkhau().equals(kh.getMatKhau())) {
                session.setAttribute("user", kh);
                return "redirect:/muahang/trangchu";
            }
        }
        for (NhanVien nv : nvr.findAll()) {
            if (account.getMa().equals(nv.getMa()) && account.getMatkhau().equals(nv.getMatKhau())) {
                session.setAttribute("user", nv);
                return "redirect:/chitietsp/index";
            }
        }
        }

//        // Kiểm tra quyền truy cập của nhân viên và khách hàng
//        NhanVien nv = (NhanVien) session.getAttribute("nv");
//        KhachHang kh = (KhachHang) session.getAttribute("kh");
//        if (nv != null && kh == null) {
//            // Nếu là nhân viên, cho phép truy cập tất cả các trang
//            return "redirect:/muahang/trangchu";
//        } else if (nv == null && kh != null) {
//            HttpServletRequest req = (HttpServletRequest) request;
//            // Nếu là khách hàng, chỉ cho phép truy cập các trang hạn chế
//            String path = req.getRequestURI();
//            if (path.contains("/muahang/")) {
//                return "redirect:/muahang/trangchu";
//            } else {
//                return "access-denied";
//            }
//        } else {
//            // Nếu không phải nhân viên hoặc khách hàng, chuyển hướng đến trang đăng nhập
//
//        }
        return "redirect:/login";
    }




    @GetMapping("logout")
    public String logOut(HttpSession session) {
            session.removeAttribute("user");
        return "login";
    }


}
