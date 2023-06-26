package sof3021.luongddph27553.viewmodel;

import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Component
public class QLHoaDon {
    @NotBlank
    private String ma;
    private UUID khachHang;
    private UUID nhanVien;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayTao;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayThanhToan;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayShip;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngayNhan;
    private int tinhTrang;
    @NotBlank
    private String tenNguoiNhan;
    @NotBlank
    private String diaChi;
    @NotBlank
    @Length.List({
            @Length(min = 10, message = "sdt ko chinh xac"),
            @Length(max = 10, message = "sdt ko chinh xac")
    })
    private String sdt;
    @NotNull
    @DecimalMin(value = "0.00", inclusive = true, message = "gia tien phai lon hon 0")
    @DecimalMax(value = "1000000000.00", inclusive = true, message = "gia tien phai nho hon 1.000.000.000")
    private BigDecimal tongTien;


}
