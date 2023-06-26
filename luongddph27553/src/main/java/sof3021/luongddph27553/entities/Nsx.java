package sof3021.luongddph27553.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity(name="Nsx")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Table(name = "Nsx")
public class Nsx {
        @Id
        @Column(name = "Id")
        @GeneratedValue(strategy = GenerationType.UUID)
        private UUID Id;

        @Column(name = "Ma")
        private String ma;

        @Column(name = "Ten")
        private String ten;
    }
