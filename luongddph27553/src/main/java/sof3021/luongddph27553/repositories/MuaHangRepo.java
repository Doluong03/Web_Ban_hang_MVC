package sof3021.luongddph27553.repositories;

import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sof3021.luongddph27553.entities.ChiTietSP;
import sof3021.luongddph27553.entities.HoaDon;
import sof3021.luongddph27553.entities.HoaDonChiTiet;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Random;
@Repository
public class MuaHangRepo {
    @Autowired
    private HoaDonChiTietRepository hdctr;;
    @Autowired
    private ChiTietSPRepository chiTietSPRepository;


    public HoaDon taoHD(ArrayList<HoaDon> List, HoaDon qlhd) {
        boolean found = false;
        for (HoaDon x : List
        ) {
            if (x.getMa().equals(qlhd.getMa())) {
                found = true;
                System.out.println("Trung ma");
                break;
            }
        }
        if (!found) {
            Random rand = new Random();
            int randomNumber = rand.nextInt(9000) + 1000;
            qlhd.setMa("HD"+randomNumber);
            return qlhd;
        }
        return null;
    }

    public void addCart(HoaDonChiTiet qlct, ArrayList<HoaDonChiTiet> List,int soLuong) {
        boolean found = false;
        for (HoaDonChiTiet x : List) {
            if (x.getChiTietSP().getMa().equals(qlct.getChiTietSP().getMa())) {
                x.setSoLuong(x.getSoLuong() + soLuong);
                x.setTongTien(x.getDonGia().multiply(BigDecimal.valueOf(x.getSoLuong())));
                hdctr.delete(hdctr.findByChiTietSPAndHoaDon(x.getChiTietSP(),x.getHoaDon()));
                this.updateSLT(x.getSoLuong(),x.getChiTietSP());
                found = true;
                break;
            }
        }

        if (!found) {
            qlct.setSoLuong(soLuong);
            List.add(qlct);
        }
    }
    public void decreCart(HoaDonChiTiet qlct, ArrayList<HoaDonChiTiet> List) {
        boolean found = false;
        for (HoaDonChiTiet x : List) {
            if (x.getChiTietSP().getMa().equals(qlct.getChiTietSP().getMa())) {
                x.setSoLuong(x.getSoLuong() -1);
                x.setTongTien(x.getDonGia().multiply(BigDecimal.valueOf(x.getSoLuong())));
                hdctr.delete(hdctr.findByChiTietSPAndHoaDon(x.getChiTietSP(),x.getHoaDon()));
                found = true;
                break;
            }
        }

        if (!found) {
            List.add(qlct);
        }
    }
    public HoaDonChiTiet findByMa2(String ma, ArrayList<HoaDonChiTiet> List) {
        for (int i = 0; i < List.size(); i++) {
            HoaDonChiTiet x = List.get(i);
            if (x.getChiTietSP().getMa().equals(ma)) {
                return List.get(i);
            }
        }
        return null;
    }

    public void updateSLT(int sl,ChiTietSP chiTietSP){
        chiTietSP.setSoLuongTon(chiTietSP.getSoLuongTon()-sl);
        chiTietSP.setId(chiTietSP.getId());
        chiTietSPRepository.save(chiTietSP);
    }

}
