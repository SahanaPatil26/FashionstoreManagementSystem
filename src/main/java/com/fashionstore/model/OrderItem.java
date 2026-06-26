package com.fashionstore.model;

public class OrderItem {

    private int id;
    private int orderId;
    private int productId;
    private String size;
    private int quantity;
    private double price;

    // Default Constructor
    public OrderItem() {
    }

    // Parameterized Constructor
    public OrderItem(int orderId, int productId, String size, int quantity, double price) {
        this.orderId = orderId;
        this.productId = productId;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
    }

    // Full Constructor
    public OrderItem(int id, int orderId, int productId, String size, int quantity, double price) {
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.size = size;
        this.quantity = quantity;
        this.price = price;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
