package com.example.tourfirm.repositories;

import com.example.tourfirm.models.Order;
import com.example.tourfirm.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findByUser(User user);

    List<Order> findByCompleted(boolean b);
}
