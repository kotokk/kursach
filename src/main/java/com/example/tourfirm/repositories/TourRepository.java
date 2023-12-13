package com.example.tourfirm.repositories;

import com.example.tourfirm.models.Tour;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TourRepository extends JpaRepository<Tour, Long> {
    List<Tour> findAllByLocation(String location);
}
