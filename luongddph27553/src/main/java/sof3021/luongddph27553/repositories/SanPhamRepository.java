package sof3021.luongddph27553.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import sof3021.luongddph27553.entities.ChucVu;
import sof3021.luongddph27553.entities.SanPham;

import java.util.UUID;

@Repository
public interface SanPhamRepository extends JpaRepository<SanPham, UUID> {

}
