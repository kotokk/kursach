package com.example.tourfirm.controllers;

import com.example.tourfirm.models.Order;
import com.example.tourfirm.models.Reservation;
import com.example.tourfirm.models.User;
import com.example.tourfirm.services.OrderService;
import com.example.tourfirm.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Controller
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;

    @GetMapping("/order")
    public String listOrders(Model model, Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        List<Order> orders = orderService.listOrderByUser(user);
        model.addAttribute("user", user);
        model.addAttribute("orders", orders);
        return "orders";
    }

    @PostMapping("/orders/create")
    public String createOrder(@RequestParam("reservationId") Reservation reservation,
                             Principal principal) {
        User user = userService.getUserByPrincipal(principal);
        orderService.createOrder(reservation, user);
        return "redirect:/order";
    }

    @PostMapping("/order/cancel")
    public String cancelOrder(@RequestParam("orderId") Order order) {
        orderService.cancelOrder(order);
        return "redirect:/order";
    }
    @GetMapping("/order/confirm")
    public String confirmOrder(@RequestParam("orderId") Order order) {
        orderService.cancelOrder(order);
        return "redirect:/order/list";
    }

    @PostMapping("/order/complete")
    public String completeOrder(@RequestParam("orderId") Order order, @RequestParam("phoneNumber") String contactPhoneNumber) {
        orderService.completeOrder(order, contactPhoneNumber);
        return "redirect:/order";
    }
    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("order/list")
    public String listOrder(Model model) {
        model.addAttribute("orders", orderService.listCompletedOrders());
        return "order-list";
    }
}
