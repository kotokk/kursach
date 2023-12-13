package com.example.tourfirm.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;
@Entity
@Table(name = "orders")
@Data
@AllArgsConstructor
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    Long id;
    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "reservation_id")
    private Reservation reservation;
    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "user_id")
    private User user;
    @Column(name = "contactPhoneNumber")
    private String contactPhoneNumber;
    @Column(name = "completed")
    private boolean completed;

    public Order(Reservation reservation, User user, boolean b) {
        this.reservation = reservation;
        this.user = user;
        this.completed = b;
    }

    public Order() {    }

    public void setReservation(Reservation reservation) {
        this.reservation = reservation;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setContactPhoneNumber(String contactPhoneNumber) {
        this.contactPhoneNumber = contactPhoneNumber;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }

    @Override
    public String toString() {
        return "Your order:\n" + reservation;
    }
}
