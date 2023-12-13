package com.example.tourfirm.services;

import com.example.tourfirm.models.Order;
import com.example.tourfirm.models.Reservation;
import com.example.tourfirm.models.User;
import com.example.tourfirm.repositories.OrderRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@AllArgsConstructor
public class OrderService {
    private final OrderRepository orderRepository;
    public Order createOrder(Reservation reservation, User user) {
        Order order = new Order(reservation, user, false);
        return orderRepository.save(order);
    }

    public void cancelOrder(Order order) {
        orderRepository.delete(order);
    }

    public void completeOrder(Order order, String contactPhoneNumber) {
        order.setContactPhoneNumber(contactPhoneNumber);
        order.setCompleted(true);
        orderRepository.save(order);
    }

    public List<Order> listOrderByUser(User user) {
        return orderRepository.findByUser(user);
    }

    public List<Order> listCompletedOrders() {
        return orderRepository.findByCompleted(true);
    }
}
