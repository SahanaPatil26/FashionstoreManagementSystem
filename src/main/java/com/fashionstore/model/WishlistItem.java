package com.fashionstore.model;

public class WishlistItem {
    private int id;
    private int userId;
    private int productId;

    public WishlistItem() {}

    public WishlistItem(int userId, int productId) {
        this.userId = userId;
        this.productId = productId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }
}
