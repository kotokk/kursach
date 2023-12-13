package com.example.tourfirm.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Table(name = "tours")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Tour {
    @Getter
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Id;
    @Getter
    @Column(name = "tourname")
    private String tour_name;
    @Getter
    @Column(name = "tourprice")
    private int tour_price;
    @Getter
    @Column(name = "tourlocation")
    private String location;
    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.LAZY)
    List<Reservation> reservations;

    public void addReservation(Reservation reservation) {
        reservations.add(reservation);
    }

    public void setId(Long id) {
        Id = id;
    }

    public void setTour_name(String tour_name) {
        this.tour_name = tour_name;
    }

    public void setTour_price(int tour_price) {
        this.tour_price = tour_price;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}
