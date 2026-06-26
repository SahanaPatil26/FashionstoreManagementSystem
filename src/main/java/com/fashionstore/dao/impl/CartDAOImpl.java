package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.CartDAO;
import com.fashionstore.model.CartItem;
import com.fashionstore.util.DBConnection;

public class CartDAOImpl implements CartDAO {

    // 🔹 CREATE CART FOR USER
    @Override
    public boolean createCart(int userId) {
        boolean status = false;
        try (Connection con = DBConnection.getConnection()) {
            String query = "INSERT INTO cart(user_id) VALUES(?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            int rows = ps.executeUpdate();
            System.out.println("🛒 DEBUG: New cart created for user " + userId);
            status = rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // 🔹 GET CART ID BY USER ID
    @Override
    public int getCartIdByUserId(int userId) {
        int cartId = 0;
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT id FROM cart WHERE user_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cartId = rs.getInt("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartId;
    }

    // 🔹 ADD TO CART
    @Override
    public boolean addToCart(CartItem item) {
        boolean status = false;
        try (Connection con = DBConnection.getConnection()) {
            String checkQuery = "SELECT id, quantity FROM cart_items WHERE cart_id=? AND product_id=? AND size=?";
            PreparedStatement checkPs = con.prepareStatement(checkQuery);
            checkPs.setInt(1, item.getCartId());
            checkPs.setInt(2, item.getProductId());
            checkPs.setString(3, item.getSize());
            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {
                int existingId = rs.getInt("id");
                int newQuantity = rs.getInt("quantity") + item.getQuantity();
                String updateQuery = "UPDATE cart_items SET quantity=? WHERE id=?";
                PreparedStatement updatePs = con.prepareStatement(updateQuery);
                updatePs.setInt(1, newQuantity);
                updatePs.setInt(2, existingId);
                int rows = updatePs.executeUpdate();
                System.out.println("🛒 DEBUG: Item quantity updated in cart_items. Rows: " + rows);
                status = rows > 0;
            } else {
                String insertQuery = "INSERT INTO cart_items(cart_id, product_id, size, quantity) VALUES (?, ?, ?, ?)";
                PreparedStatement insertPs = con.prepareStatement(insertQuery);
                insertPs.setInt(1, item.getCartId());
                insertPs.setInt(2, item.getProductId());
                insertPs.setString(3, item.getSize());
                insertPs.setInt(4, item.getQuantity());
                int rows = insertPs.executeUpdate();
                System.out.println("🛒 DEBUG: Item added to cart_items. Rows: " + rows);
                status = rows > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // 🔹 GET CART ITEMS
    @Override
    public List<CartItem> getCartItems(int cartId) {
        List<CartItem> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT * FROM cart_items WHERE cart_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartItem item = new CartItem();
                item.setId(rs.getInt("id"));
                item.setCartId(rs.getInt("cart_id"));
                item.setProductId(rs.getInt("product_id"));
                item.setSize(rs.getString("size"));
                item.setQuantity(rs.getInt("quantity"));
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean updateCartItem(CartItem item) {
        boolean status = false;
        try (Connection con = DBConnection.getConnection()) {
            String query = "UPDATE cart_items SET quantity=?, size=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, item.getQuantity());
            ps.setString(2, item.getSize());
            ps.setInt(3, item.getId());
            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public boolean updateCartItemQuantity(int cartItemId, int quantity) {
        boolean status = false;
        try (Connection con = DBConnection.getConnection()) {
            String query = "UPDATE cart_items SET quantity=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, cartItemId);
            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public boolean removeCartItem(int cartItemId) {
        boolean status = false;
        try (Connection con = DBConnection.getConnection()) {
            String query = "DELETE FROM cart_items WHERE id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartItemId);
            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    @Override
    public boolean clearCart(int cartId) {
        boolean status = false;
        try (Connection con = DBConnection.getConnection()) {
            String query = "DELETE FROM cart_items WHERE cart_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartId);
            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}