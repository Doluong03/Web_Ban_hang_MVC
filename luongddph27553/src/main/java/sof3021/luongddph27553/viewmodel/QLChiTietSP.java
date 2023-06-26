package sof3021.luongddph27553.viewmodel;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.stereotype.Component;
import sof3021.luongddph27553.entities.DongSP;
import sof3021.luongddph27553.entities.MauSac;
import sof3021.luongddph27553.entities.Nsx;
import sof3021.luongddph27553.entities.SanPham;

import java.math.BigDecimal;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Component
public class QLChiTietSP {

    private UUID id;
    @NotBlank(message = "Không được để trống !!!")
    private String ma;
    private UUID sanPham;
    private UUID nsx;
    private UUID mauSac;
    private UUID dongSP;
    @NotNull(message = "Không được để trống !!!")
    private int namBh;
    @NotBlank(message = "Không được để trống !!!")
    @Length.List({
            @Length(min = 1, message = "Mô tả quá ngắn "),
            @Length(max = 49, message = "Mô tả chỉ được phép 50 ký tự")
    })
    private String moTa;
    @NotNull(message = "Không được để trống !!!")
    private int soLuongTon;
    @NotNull(message = "Không được để trống !!!")
    private BigDecimal giaNhap;
    @NotNull(message = "Không được để trống !!!")
    private BigDecimal giaBan;
    @NotBlank(message = "Không được để trống !!!")
    private String anh;
}
