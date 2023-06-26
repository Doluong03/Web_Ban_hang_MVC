package sof3021.luongddph27553.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import sof3021.luongddph27553.viewmodel.QLHoaDonChiTiet;

import java.math.BigDecimal;
import java.util.UUID;

@Entity(name="HoaDonChiTiet")
@NoArgsConstructor
@Getter
@Setter
@Table(name = "HoaDonChiTiet")
@IdClass(QLHoaDonChiTiet.class)
public class HoaDonChiTiet {
        @Id
        @ManyToOne
        @JoinColumn(name = "IdHoaDon")
        private HoaDon hoaDon;

        @Id
        @ManyToOne()
        @JoinColumn(name = "IdChiTietSP")
        private ChiTietSP chiTietSP;

        @Column(name = "tongTienSP")
        private BigDecimal tongTien;

        @Column(name = "SoLuong")
        private int soLuong;

        @Column(name = "DonGia")
        private BigDecimal donGia;

        public HoaDonChiTiet(HoaDon hoaDon, ChiTietSP chiTietSP, int soLuong) {
                this.hoaDon = hoaDon;
                this.chiTietSP = chiTietSP;
                this.donGia = chiTietSP.getGiaBan();
                this.soLuong = soLuong;
                this.tongTien = this.donGia.multiply(BigDecimal.valueOf(this.soLuong)) ;

        }

    }
