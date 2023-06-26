package sof3021.luongddph27553.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

@Entity(name="HoaDon")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "HoaDon")
public class HoaDon {
        @Id
        @GeneratedValue(strategy = GenerationType.UUID)
        @Column(name = "Id")
        private UUID id;
        @ManyToOne()
        @JoinColumn(name = "IdKH")
        private KhachHang khachHang;
        @ManyToOne()
        @JoinColumn(name = "IdNV")
        private NhanVien nhanVien;
        @Column(name = "Ma")
        private String ma;
        @Column(name = "NgayTao")
        private Date ngayTao;
        @Column(name = "NgayThanhToan")
        private Date ngayThanhToan;
        @Column(name = "NgayShip")
        private Date ngayShip;
        @Column(name = "NgayNhan")
        private Date ngayNhan;
        @Column(name = "TinhTrang")
        private int tinhTrang;
        @Column(name = "TenNguoiNhan")
        private String tenNguoiNhan;
        @Column(name = "DiaChi")
        private String diaChi;
        @Column(name = "Sdt")
        private String sdt;
        @Column(name = "TongTien")
        private BigDecimal tongTien;
    }
