package com.example.tourfirm.repositories;

import com.example.tourfirm.models.Reservation;
import com.example.tourfirm.models.Tour;
import com.example.tourfirm.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Long> {
    List<Reservation> getAllByTour(Tour tour);
    List<Reservation> findByTourAndStartDateAndEndDate(Tour tour, Date startDate, Date endDate);
    List<Reservation> findByTourOrderByStartDate(Tour tour);
}
