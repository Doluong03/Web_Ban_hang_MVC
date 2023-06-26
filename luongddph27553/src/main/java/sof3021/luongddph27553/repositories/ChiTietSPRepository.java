package sof3021.luongddph27553.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import sof3021.luongddph27553.entities.ChiTietSP;
import sof3021.luongddph27553.entities.ChucVu;

import java.util.ArrayList;
import java.util.UUID;

@Repository
public interface ChiTietSPRepository extends JpaRepository<ChiTietSP, UUID> {
        @Query("SELECT ct FROM ChiTietSP ct WHERE ct.sanPham.ten LIKE %:key% OR ct.dongSP.ma LIKE %:key%")
        ArrayList<ChiTietSP> findBySanPhamTenOrDongSPMa(@Param("key") String key);

}
