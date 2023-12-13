package com.example.tourfirm.controllers;

import com.example.tourfirm.models.Tour;
import com.example.tourfirm.services.ReservationService;
import com.example.tourfirm.services.TourService;
import com.example.tourfirm.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class TourController {
    private final TourService tourService;
    private final UserService userService;
    private final ReservationService reservationsService;

    @GetMapping("/tours")
    public String tours(@RequestParam(name = "tourlocation", required = false) String location,
                          Principal principal, Model model) {
        model.addAttribute("tours", tourService.listTours(location));
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("tour_location", location);
        return "indexs";
    }


    @GetMapping("tour/{id}")
    public String tourInfo(@PathVariable Long id, Principal principal, Model model) {
        Tour tour = tourService.getTourById(id);
        model.addAttribute("tour", tour);
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("reservations", tour.getReservations());
        System.out.println(tour.getReservations());
        return "tour-info";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("tour/new")
    public String formTour() {
        return "tour-form";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("tour/create")
    public String createTour(Tour product) {
        tourService.saveTour(product);
        return "redirect:/tours";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("tour/delete/{id}")
    public String deleteTour(@PathVariable Long id) {
        tourService.deleteTour(id);
        return "redirect:/tour/list";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("tour/list")
    public String listTour(@RequestParam(name = "name", required = false) String name,
                             Model model) {
        model.addAttribute("tours", tourService.listTours(name));
        return "tour-list";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("tour/list/{tour}")
    public String TourEditForm(@PathVariable Tour tour, Model model) {
        model.addAttribute("tour", tour);
        return "tour-edit";
    }

    @PostMapping("tour/edit")
    public String userSave(@RequestParam String name,
                           @RequestParam int price,
                           @RequestParam String tour_location,
                           @RequestParam("tourId") Tour product) {
        tourService.updateTour(name, price, tour_location, product);

        return "redirect:/tour/list";
    }
}
