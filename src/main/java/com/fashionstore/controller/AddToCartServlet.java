package com.fashionstore.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fashionstore.dao.CartDAO;
import com.fashionstore.dao.impl.CartDAOImpl;
import com.fashionstore.model.CartItem;

import java.io.IOException;

public class AddToCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login?error=login_required");
            return;
        }

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String size = request.getParameter("size");

            CartDAO cartDAO = new CartDAOImpl();
            int cartId = cartDAO.getCartIdByUserId(userId);
            
            if (cartId == 0) {
                cartDAO.createCart(userId);
                cartId = cartDAO.getCartIdByUserId(userId);
            }

            CartItem item = new CartItem();
            item.setCartId(cartId);
            item.setProductId(productId);
            item.setQuantity(quantity);
            item.setSize(size != null ? size : "M");

            cartDAO.addToCart(item);

            String referer = request.getHeader("referer");
            response.sendRedirect(referer != null ? referer : request.getContextPath() + "/products");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/products?error=failed");
        }
    }
}