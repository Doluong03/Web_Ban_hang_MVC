package sof3021.luongddph27553.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import sof3021.luongddph27553.entities.CuaHang;
import sof3021.luongddph27553.entities.HoaDon;
import sof3021.luongddph27553.entities.NhanVien;

import java.util.UUID;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien, UUID> {
    NhanVien findByMaLike(String ma);
}
