package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.OrderDAO;
import com.fashionstore.model.Order;
import com.fashionstore.model.OrderItem;
import com.fashionstore.util.DBConnection;

public class OrderDAOImpl implements OrderDAO {

    private Connection con;

    public OrderDAOImpl() {
        con = DBConnection.getConnection();
    }

    // 🔹 CREATE ORDER (returns generated order ID)
    @Override
    public int createOrder(Order order) {
        int orderId = 0;

        try {
            String query = "INSERT INTO orders(user_id, total_amount, address, phone, status, payment_mode) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotalAmount());
            ps.setString(3, order.getAddress());
            ps.setString(4, order.getPhone());
            ps.setString(5, order.getStatus());
            ps.setString(6, order.getPaymentMode());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    orderId = rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }

    // 🔹 ADD ORDER ITEM
    @Override
    public boolean addOrderItem(OrderItem item) {
        boolean status = false;

        try {
            String query = "INSERT INTO order_items(order_id, product_id, size, quantity, price) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getProductId());
            ps.setString(3, item.getSize());
            ps.setInt(4, item.getQuantity());
            ps.setDouble(5, item.getPrice());

            int rows = ps.executeUpdate();
            status = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // 🔹 GET ORDERS BY USER ID
    @Override
    public List<Order> getOrdersByUserId(int userId) {
        List<Order> list = new ArrayList<>();

        try {
            String query = "SELECT * FROM orders WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Order order = new Order();

                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
                order.setStatus(rs.getString("status"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setPaymentMode(rs.getString("payment_mode"));

                list.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM orders ORDER BY order_date DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setAddress(rs.getString("address"));
                order.setPhone(rs.getString("phone"));
                order.setStatus(rs.getString("status"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setPaymentMode(rs.getString("payment_mode"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 🔹 GET ORDER ITEMS
    @Override
    public List<OrderItem> getOrderItems(int orderId) {
        List<OrderItem> list = new ArrayList<>();

        try {
            String query = "SELECT * FROM order_items WHERE order_id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setInt(1, orderId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderItem item = new OrderItem();

                item.setId(rs.getInt("id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setProductId(rs.getInt("product_id"));
                item.setSize(rs.getString("size"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));

                list.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 🔹 UPDATE ORDER STATUS
    @Override
    public boolean updateOrderStatus(int orderId, String statusValue) {
        boolean status = false;

        try {
            String query = "UPDATE orders SET status=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, statusValue);
            ps.setInt(2, orderId);

            int rows = ps.executeUpdate();
            status = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}