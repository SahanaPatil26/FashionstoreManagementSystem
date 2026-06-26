package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.model.Product;
import com.fashionstore.util.DBConnection;

public class ProductDAOImpl implements ProductDAO {

    public ProductDAOImpl() {}

    private Connection getFreshConnection() {
        return DBConnection.getConnection();
    }

    @Override
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try (Connection con = getFreshConnection()) {
            String query = "SELECT * FROM products";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(extractProduct(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    @Override
    public List<Product> getProductsByCategory(int categoryId) {
        List<Product> list = new ArrayList<>();
        try (Connection con = getFreshConnection()) {
            String query = "SELECT * FROM products WHERE category_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(extractProduct(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    @Override
    public Product getProductById(int id) {
        try (Connection con = getFreshConnection()) {
            String query = "SELECT * FROM products WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return extractProduct(rs);
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    @Override
    public List<Product> searchProducts(String keyword) {
        List<Product> list = new ArrayList<>();
        try (Connection con = getFreshConnection()) {
            String query = "SELECT * FROM products WHERE name LIKE ? OR brand LIKE ?";
            PreparedStatement ps = con.prepareStatement(query);
            String k = "%" + keyword + "%";
            ps.setString(1, k);
            ps.setString(2, k);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(extractProduct(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    @Override
    public List<Product> filterProducts(double minPrice, double maxPrice, List<String> brands, List<String> categories, String sort) {
        // Overloaded helper for old calls if needed, but we'll use the main one
        return filterProductsExtended(minPrice, maxPrice, brands, categories, sort, 0);
    }

    public List<Product> filterProductsExtended(double minPrice, double maxPrice, List<String> brands, List<String> categories, String sort, double minRating) {
        List<Product> list = new ArrayList<>();
        try (Connection con = getFreshConnection()) {
            StringBuilder query = new StringBuilder("SELECT * FROM products WHERE price BETWEEN ? AND ? AND rating >= ?");
            
            if (brands != null && !brands.isEmpty()) {
                query.append(" AND brand IN (");
                for (int i=0; i<brands.size(); i++) { query.append("?"); if(i<brands.size()-1) query.append(","); }
                query.append(")");
            }
            
            if (categories != null && !categories.isEmpty()) {
                query.append(" AND category_id IN (");
                for (int i=0; i<categories.size(); i++) { query.append("?"); if(i<categories.size()-1) query.append(","); }
                query.append(")");
            }

            if (sort != null) {
                if (sort.contains("price-low")) query.append(" ORDER BY price ASC");
                else if (sort.contains("price-high")) query.append(" ORDER BY price DESC");
                else if (sort.contains("rating")) query.append(" ORDER BY rating DESC");
                else if (sort.contains("newest")) query.append(" ORDER BY id DESC");
            }

            PreparedStatement ps = con.prepareStatement(query.toString());
            ps.setDouble(1, minPrice);
            ps.setDouble(2, maxPrice);
            ps.setDouble(3, minRating);
            
            int idx = 4;
            if (brands != null) for (String b : brands) ps.setString(idx++, b);
            if (categories != null) for (String c : categories) ps.setInt(idx++, Integer.parseInt(c));

            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(extractProduct(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    @Override
    public List<Product> sortProductsByCategory(String sort, int categoryId) {
        List<Product> list = new ArrayList<>();
        try (Connection con = getFreshConnection()) {
            String query = "SELECT * FROM products WHERE category_id=?";
            if ("price-low".equals(sort)) query += " ORDER BY price ASC";
            else if ("price-high".equals(sort)) query += " ORDER BY price DESC";
            else if ("rating".equals(sort)) query += " ORDER BY rating DESC";
            else if ("newest".equals(sort)) query += " ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(extractProduct(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    @Override
    public List<Product> sortProducts(String sortBy) {
        List<Product> list = new ArrayList<>();
        try (Connection con = getFreshConnection()) {
            String query = "SELECT * FROM products";
            if ("price-low".equals(sortBy)) query += " ORDER BY price ASC";
            else if ("price-high".equals(sortBy)) query += " ORDER BY price DESC";
            else if ("rating".equals(sortBy)) query += " ORDER BY rating DESC";
            else if ("newest".equals(sortBy)) query += " ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(extractProduct(rs));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    private Product extractProduct(ResultSet rs) throws Exception {
        Product p = new Product();
        p.setId(rs.getInt("id"));
        p.setName(rs.getString("name"));
        p.setDescription(rs.getString("description"));
        p.setPrice(rs.getDouble("price"));
        p.setCategoryId(rs.getInt("category_id"));
        p.setColor(rs.getString("color"));
        p.setImageUrl(rs.getString("image_url"));
        p.setBrand(rs.getString("brand"));
        p.setMrp(rs.getDouble("mrp"));
        p.setDiscount(rs.getInt("discount"));
        p.setRating(rs.getDouble("rating"));
        p.setReviewCount(rs.getInt("review_count"));
        p.setSize(rs.getString("size"));
        return p;
    }

    @Override public boolean addProduct(Product p) { return false; }
    @Override public boolean updateProduct(Product p) { return false; }
    @Override public boolean deleteProduct(int id) { return false; }
}