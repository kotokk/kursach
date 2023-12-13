package com.example.tourfirm.services;

import com.example.tourfirm.models.Reservation;
import com.example.tourfirm.models.Tour;
import com.example.tourfirm.models.User;
import com.example.tourfirm.repositories.ReservationRepository;
import com.example.tourfirm.repositories.TourRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@AllArgsConstructor
public class ReservationService {
    private final ReservationRepository reservationRepository;
    private final TourRepository tourRepository;


    public void addReservation(Tour tour, Date startDate, Date endDate) {
        Reservation reservation = new Reservation();
        if (reservationRepository.findByTourAndStartDateAndEndDate(tour, startDate, endDate).isEmpty()) {
            reservation.setTour(tour);
            reservation.setStartDate(startDate);
            reservation.setEndDate(endDate);
            reservationRepository.save(reservation);  // Save the reservation to the database
            tour.addReservation(reservation);
            tourRepository.save(tour);
        }
    }

    public void deleteReservation(Long id) {
        reservationRepository.deleteById(id);
    }

    public List<Reservation> listReservations(Tour tour) {
        return reservationRepository.findByTourOrderByStartDate(tour);
    }


}
