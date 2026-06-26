package com.fashionstore.util;

import java.util.List;

import com.fashionstore.dao.UserDAO;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.CartDAO;
import com.fashionstore.dao.OrderDAO;

import com.fashionstore.dao.impl.UserDAOImpl;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.dao.impl.CartDAOImpl;
import com.fashionstore.dao.impl.OrderDAOImpl;

import com.fashionstore.model.User;
import com.fashionstore.model.Product;
import com.fashionstore.model.CartItem;
import com.fashionstore.model.Order;

public class DAOTest {

    public static void main(String[] args) {

        // ================= USER DAO =================
        UserDAO userDAO = new UserDAOImpl();

        System.out.println("---- USER TEST ----");

        User user = new User();
        user.setName("Test User");
        user.setEmail("testuser@gmail.com");
        user.setPassword("123456");
        user.setPhone("9999999999");

        boolean reg = userDAO.registerUser(user);
        System.out.println("Register: " + (reg ? "Success ✅" : "Failed ❌"));

        User login = userDAO.loginUser("testuser@gmail.com", "123456");
        System.out.println("Login: " + (login != null ? "Success ✅" : "Failed ❌"));

        User fetched = userDAO.getUserById(1);
        if (fetched != null) {
            System.out.println("Fetched User: " + fetched.getName());
        }

        // ================= PRODUCT DAO =================
        ProductDAO productDAO = new ProductDAOImpl();

        System.out.println("\n---- PRODUCT TEST ----");

        List<Product> products = productDAO.getAllProducts();
        for (Product p : products) {
            System.out.println(p.getId() + " | " + p.getName() + " | ₹" + p.getPrice());
        }

        // ================= CART DAO =================
        CartDAO cartDAO = new CartDAOImpl();

        System.out.println("\n---- CART TEST ----");

        int cartId = cartDAO.getCartIdByUserId(1);
        System.out.println("Cart ID: " + cartId);

        List<CartItem> cartItems = cartDAO.getCartItems(cartId);
        for (CartItem item : cartItems) {
            System.out.println("Product ID: " + item.getProductId() +
                    " | Size: " + item.getSize() +
                    " | Qty: " + item.getQuantity());
        }

        // ================= ORDER DAO =================
        OrderDAO orderDAO = new OrderDAOImpl();

        System.out.println("\n---- ORDER TEST ----");

        List<Order> orders = orderDAO.getOrdersByUserId(1);
        for (Order o : orders) {
            System.out.println("Order ID: " + o.getId() +
                    " | Amount: ₹" + o.getTotalAmount() +
                    " | Status: " + o.getStatus());
        }

        System.out.println("\n---- ALL DAO TEST COMPLETED ----");
    }
}
