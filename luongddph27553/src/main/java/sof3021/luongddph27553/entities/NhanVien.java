package sof3021.luongddph27553.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.UUID;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "NhanVien")
public class NhanVien {

        @Id
        @GeneratedValue(strategy = GenerationType.UUID)
        @Column(name = "Id")

        private UUID id;

        @Column(name = "Ma")
        private String ma;

        @Column(name = "Ten")
        private String ten;

        @Column(name = "TenDem")
        private String tenDem;

        @Column(name = "Ho")
        private String ho;

        @Column(name = "Sdt")
        private String sdt;

        @Column(name = "GioiTinh")
        private String gioiTinh;

        @Column(name = "DiaChi")
        private String diaChi;

        @Column(name = "MatKhau")
        private String matKhau;

        @Column(name = "NgaySinh")
        private Date ngaySinh;

        @Column(name = "TrangThai")
        private int trangThai;

        @ManyToOne()
        @JoinColumn(name = "IdCH")
        private CuaHang cuaHang;
        @ManyToOne()
        @JoinColumn(name = "IdCV")
        private ChucVu chucVu;

    }
