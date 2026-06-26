package com.fashionstore.model;

public class Product {

    private int id;
    private String name;
    private String description;
    private double price;
    private int categoryId;
    private String color;
    private String imageUrl;

    // New fields for Myntra-style UI
    private String brand;
    private double mrp;          // Original MRP (for strikethrough)
    private int discount;        // Discount percentage
    private double rating;       // Star rating (e.g. 4.2)
    private int reviewCount;     // Number of reviews
    private String size;         // Available sizes

    // Default Constructor
    public Product() {
    }

    // Parameterized Constructor
    public Product(String name, String description, double price, int categoryId, String color, String imageUrl) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.categoryId = categoryId;
        this.color = color;
        this.imageUrl = imageUrl;
    }

    // Full Constructor
    public Product(int id, String name, String description, double price, int categoryId, String color, String imageUrl) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.categoryId = categoryId;
        this.color = color;
        this.imageUrl = imageUrl;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    // New getters and setters

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getMrp() {
        return mrp;
    }

    public void setMrp(double mrp) {
        this.mrp = mrp;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getReviewCount() {
        return reviewCount;
    }

    public void setReviewCount(int reviewCount) {
        this.reviewCount = reviewCount;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }
}
