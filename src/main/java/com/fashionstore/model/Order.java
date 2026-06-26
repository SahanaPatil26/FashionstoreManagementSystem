package com.fashionstore.model;

import java.sql.Timestamp;

public class Order {

    private int id;
    private int userId;
    private double totalAmount;
    private String address;
    private String phone;
    private String status;
    private Timestamp orderDate;
    private String paymentMode;

    // Default Constructor
    public Order() {
    }

    // Parameterized Constructor
    public Order(int userId, double totalAmount, String address, String phone, String status) {
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.address = address;
        this.phone = phone;
        this.status = status;
    }

    // Full Constructor
    public Order(int id, int userId, double totalAmount, String address, String phone, String status, Timestamp orderDate) {
        this.id = id;
        this.userId = userId;
        this.totalAmount = totalAmount;
        this.address = address;
        this.phone = phone;
        this.status = status;
        this.orderDate = orderDate;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(String paymentMode) {
        this.paymentMode = paymentMode;
    }

    public void setOrderDate(java.util.Date date) {
        this.orderDate = new Timestamp(date.getTime());
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }
}
