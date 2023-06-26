package sof3021.luongddph27553.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import sof3021.luongddph27553.entities.ChucVu;
import sof3021.luongddph27553.entities.HoaDon;
import sof3021.luongddph27553.entities.KhachHang;

import java.util.ArrayList;
import java.util.UUID;

@Repository
public interface HoaDonRepository extends JpaRepository<HoaDon, UUID> {

    HoaDon findByMaLike(String ma);
    ArrayList<HoaDon> findByKhachHang(KhachHang kh);
}
