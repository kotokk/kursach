package com.example.tourfirm.controllers;

import com.example.tourfirm.models.Reservation;
import com.example.tourfirm.models.Tour;
import com.example.tourfirm.models.User;
import com.example.tourfirm.services.ReservationService;
import com.example.tourfirm.services.TourService;
import com.example.tourfirm.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.Date;
import java.util.List;

@Controller
public class ReservationController {
    @Autowired
    private ReservationService reservationsService;
    @Autowired
    private TourService tourService;

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/reservation/list/{id}")
    public String reservationsList(Model model, @PathVariable Long id) {
        Tour tour = tourService.getTourById(id);
        List<Reservation> reservations = reservationsService.listReservations(tour);
        model.addAttribute("tour", tour);
        model.addAttribute("reservations", reservations);
        return "tour-reservations";
    }


    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/reservation/delete/{id}")
    public String deleteReservation(@PathVariable Long id,
                                   @RequestParam("tourId") Tour tour) {
        reservationsService.deleteReservation(id);
        return "redirect:/reservation/list/" + tour.getId();
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/reservation/add/")
    public String addNewReservation(@RequestParam("tourId") Tour tour,
                                    @RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
                                    @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate){

        reservationsService.addReservation(tour, startDate, endDate);
        return "redirect:/reservation/list/" + tour.getId();
    }
}
