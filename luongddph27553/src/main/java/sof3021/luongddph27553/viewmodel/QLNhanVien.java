package sof3021.luongddph27553.viewmodel;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class QLNhanVien {
    //    @NotBlank(message = "Không được để trống ")
//    private UUID id;
    @NotBlank(message = "Không được để trống ")
    @Length.List({
            @Length(max = 20, message = "Nhập quá ký tự(30 ký tự)")
    })
    private String ma;
    @NotBlank(message = "Không được để trống ")
    @Length.List({
            @Length(max = 30, message = "Nhập quá ký tự(30 ký tự)")
    })
    private String ten;
    @NotBlank(message = "Không được để trống ")
    @Length.List({
            @Length(max = 30, message = "Nhập quá ký tự(30 ký tự)")
    })
    private String tenDem;
    @NotBlank(message = "Không được để trống ")
    @Length.List({
            @Length(max = 30, message = "Nhập quá ký tự(30 ký tự)")
    })
    private String ho;
    @Length.List({
            @Length(min = 10, message = "Vui lòng nhập đúng sdt"),
            @Length(max = 10, message = "Vui lòng nhập đúng sdt")
    })
    @NotBlank(message = "Không được để trống ")
    private String sdt;
//    @NotBlank(message = "Không được để trống ")
    private String gioiTinh;
    @NotBlank(message = "Không được để trống ")
    private String diaChi;
    @NotBlank(message = "Không được để trống ")
    private String matKhau;
    @NotNull(message = "Không được để trống ")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ngaySinh;
    private int trangThai;
    private UUID cuaHang;
    private UUID chucVu;
//    @NotBlank(message = "Không được để trống ")
//    private UUID cuaHang;
//    @NotBlank(message = "Không được để trống ")
//    private UUID chucVu;
}
