package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.WishlistDAO;
import com.fashionstore.util.DBConnection;

public class WishlistDAOImpl implements WishlistDAO {

    @Override
    public boolean addToWishlist(int userId, int productId) {
        if (isInWishlist(userId, productId)) return true;
        try (Connection con = DBConnection.getConnection()) {
            String query = "INSERT INTO wishlist (user_id, product_id) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            boolean success = ps.executeUpdate() > 0;
            System.out.println("💖 DEBUG: Added to wishlist for user " + userId);
            return success;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean removeFromWishlist(int userId, int productId) {
        try (Connection con = DBConnection.getConnection()) {
            String query = "DELETE FROM wishlist WHERE user_id=? AND product_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean isInWishlist(int userId, int productId) {
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT id FROM wishlist WHERE user_id=? AND product_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ps.setInt(2, productId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Integer> getWishlistProductIds(int userId) {
        List<Integer> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT product_id FROM wishlist WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("product_id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
