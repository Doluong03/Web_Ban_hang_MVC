package sof3021.luongddph27553.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.UUID;

@Entity(name="ChiTietSP")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "ChiTietSP")
public class ChiTietSP {
        @Id
        @GeneratedValue(strategy = GenerationType.UUID)
        @Column(name = "Id")
        private UUID id;
        @Column(name = "Ma")
        private String ma;
        @ManyToOne()
        @JoinColumn(name = "IdSP")
        private SanPham sanPham;
        @ManyToOne()
        @JoinColumn(name = "IdNsx")
        private Nsx nsx;
        @ManyToOne()
        @JoinColumn(name = "IdMauSac")
        private MauSac mauSac;
        @ManyToOne()
        @JoinColumn(name = "IdDongSP")
        private DongSP dongSP;
        @Column(name = "NamBH")
        private int namBh;
        @Column(name = "MoTa")
        private String moTa;
        @Column(name = "SoLuongTon")
        private int soLuongTon;
        @Column(name = "GiaNhap")
        private BigDecimal giaNhap;
        @Column(name = "GiaBan")
        private BigDecimal giaBan;
        @Column(name = "Anh")
        private String anh;

    }
