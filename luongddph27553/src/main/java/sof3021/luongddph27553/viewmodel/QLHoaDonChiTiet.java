package sof3021.luongddph27553.viewmodel;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;
import sof3021.luongddph27553.entities.ChiTietSP;
import sof3021.luongddph27553.entities.HoaDon;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Component
public class QLHoaDonChiTiet implements Serializable {

    private UUID hoaDon;

    private UUID chiTietSP;

    private BigDecimal tongTien;

    private int soLuong;

    private BigDecimal donGia;
}
