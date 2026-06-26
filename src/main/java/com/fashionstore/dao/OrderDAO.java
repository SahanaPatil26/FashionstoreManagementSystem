package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.Order;
import com.fashionstore.model.OrderItem;

public interface OrderDAO {

    int createOrder(Order order);

    boolean addOrderItem(OrderItem item);

    List<Order> getOrdersByUserId(int userId);
    List<Order> getAllOrders();

    List<OrderItem> getOrderItems(int orderId);

    boolean updateOrderStatus(int orderId, String status);
}