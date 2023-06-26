package sof3021.luongddph27553.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import sof3021.luongddph27553.entities.ChiTietSP;
import sof3021.luongddph27553.entities.HoaDon;
import sof3021.luongddph27553.entities.HoaDonChiTiet;

import java.util.ArrayList;
import java.util.UUID;

@Repository
public interface HoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, UUID> {

    ArrayList<HoaDonChiTiet> findByHoaDon(HoaDon hd);
    HoaDonChiTiet findByChiTietSPAndHoaDon(ChiTietSP ct, HoaDon hd);
}
