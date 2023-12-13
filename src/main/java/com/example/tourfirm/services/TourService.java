package com.example.tourfirm.services;

import com.example.tourfirm.models.Tour;
import com.example.tourfirm.models.User;
import com.example.tourfirm.repositories.TourRepository;
import com.example.tourfirm.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class TourService {
    private final TourRepository tourRepository;
    private final UserRepository userRepository;

    public Tour getTourById(Long id) {
        return tourRepository.findById(id).orElse(null);
    }

    public List<Tour> listTours(String tour_location) {
        if (tour_location == null || tour_location.isEmpty()) return tourRepository.findAll();
        return tourRepository.findAllByLocation(tour_location);
    }


    public void deleteTour(Long id) {
        tourRepository.deleteById(id);
    }

    public void saveTour(Tour tour){
        tourRepository.save(tour);
        log.info("Tour is saved. ID: {}", tour.getId());
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByUsername(principal.getName());
    }

    public void updateTour(String name, int price,
                             String location,
                             Tour tour) {
        tour.setTour_name(name);
        tour.setTour_price(price);
        tour.setLocation(location);
        tourRepository.save(tour);
    }




}
