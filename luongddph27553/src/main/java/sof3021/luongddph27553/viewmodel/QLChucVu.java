package sof3021.luongddph27553.viewmodel;

import jakarta.validation.constraints.NotBlank;
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
public class QLChucVu {
    @NotBlank(message = "Không được để trống !!!")
    private String ma;
    @NotBlank(message = "Không được để trống !!!")
    private String ten;
}
