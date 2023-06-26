package sof3021.luongddph27553.viewmodel;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.UUID;
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Component
public class QLKhachHang {
    @NotBlank(message = "Không được để trống !!!")
    private String ma;
    @NotBlank(message = "Không được để trống !!!")
    private String ho;
    @NotBlank(message = "Không được để trống !!!")
    private String tenDem;
    @NotBlank(message = "Không được để trống !!!")
    private String ten;
    @NotNull(message = "Không được để trống !!!")
    @DateTimeFormat( pattern = "yyyy-MM-dd")
    private Date ngaySinh;
    @NotBlank(message = "Không được để trống !!!")
    @Length.List({
            @Length(min = 10, message = "SDT không chính xác"),
            @Length(max = 10, message = "SDT không chính xác")
    })
    private String sdt;
    @NotBlank(message = "Không được để trống !!!")
    private String diaChi;
    @NotBlank(message = "Không được để trống !!!")
    private String thanhPho;
    @NotBlank(message = "Không được để trống !!!")
    private String matKhau;
    @NotBlank(message = "Không được để trống !!!")
    private String quocGia;
}
