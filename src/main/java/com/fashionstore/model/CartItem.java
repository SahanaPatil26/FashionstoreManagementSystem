package com.fashionstore.model;

public class CartItem {

    private int id;
    private int cartId;
    private int productId;
    private String size;
    private int quantity;

    // Default Constructor
    public CartItem() {
    }

    // Parameterized Constructor
    public CartItem(int cartId, int productId, String size, int quantity) {
        this.cartId = cartId;
        this.productId = productId;
        this.size = size;
        this.quantity = quantity;
    }

    // Full Constructor
    public CartItem(int id, int cartId, int productId, String size, int quantity) {
        this.id = id;
        this.cartId = cartId;
        this.productId = productId;
        this.size = size;
        this.quantity = quantity;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
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
}
