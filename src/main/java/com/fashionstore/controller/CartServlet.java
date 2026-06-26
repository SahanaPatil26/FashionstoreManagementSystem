package com.fashionstore.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fashionstore.dao.CartDAO;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.CartDAOImpl;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.CartItem;
import com.fashionstore.model.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login?error=login_required");
            return;
        }

        CartDAO cartDAO = new CartDAOImpl();
        ProductDAO productDAO = new ProductDAOImpl();

        int cartId = cartDAO.getCartIdByUserId(userId);
        List<CartItem> items = cartDAO.getCartItems(cartId);

        // Fetch product info for each item
        Map<Integer, Product> productMap = new HashMap<>();
        double totalMrp = 0;
        double totalDiscount = 0;

        for (CartItem item : items) {
            Product p = productDAO.getProductById(item.getProductId());
            productMap.put(item.getProductId(), p);
            
            if (p != null) {
                totalMrp += p.getMrp() * item.getQuantity();
                totalDiscount += (p.getMrp() - p.getPrice()) * item.getQuantity();
            }
        }

        request.setAttribute("cartItems", items);
        request.setAttribute("productMap", productMap);
        request.setAttribute("totalMrp", totalMrp);
        request.setAttribute("totalDiscount", totalDiscount);
        request.setAttribute("totalAmount", totalMrp - totalDiscount);

        request.getRequestDispatcher("/WEB-INF/views/partials/cart.jsp")
                .forward(request, response);
    }
}