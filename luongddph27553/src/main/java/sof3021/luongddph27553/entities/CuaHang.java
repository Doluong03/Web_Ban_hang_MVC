package sof3021.luongddph27553.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity(name="CuaHang")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "CuaHang")
public class CuaHang {
        @Id
        @Column(name = "Id")
        @GeneratedValue(strategy = GenerationType.UUID)
        private UUID Id;

        @Column(name = "Ma")
        private String ma;

        @Column(name = "Ten")
        private String ten;

        @Column(name = "DiaChi")
        private String diaChi;

        @Column(name = "ThanhPho")
        private String thanhPho;

        @Column(name = "QuocGia")
        private String quocGia;

    }
