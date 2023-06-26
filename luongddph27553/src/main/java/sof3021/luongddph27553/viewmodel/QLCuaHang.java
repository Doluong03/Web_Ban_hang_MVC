package sof3021.luongddph27553.viewmodel;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Component;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Component
public class QLCuaHang {
    @NotBlank(message = "Không được để trống !!!")
    private String ma;
    @NotBlank(message = "Không được để trống !!!")
    private String ten;
    @NotBlank(message = "Không được để trống !!!")
    private String diaChi;
    @NotBlank(message = "Không được để trống !!!")
    private String thanhPho;
    @NotBlank(message = "Không được để trống !!!")
    private String quocGia;
}
