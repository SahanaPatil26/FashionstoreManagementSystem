package com.fashionstore.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.fashionstore.dao.CartDAO;
import com.fashionstore.dao.impl.CartDAOImpl;

import java.io.IOException;

public class RemoveFromCartServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int cartItemId = Integer.parseInt(request.getParameter("cartItemId"));
            
            CartDAO cartDAO = new CartDAOImpl();
            cartDAO.removeCartItem(cartItemId);
            
            response.sendRedirect(request.getContextPath() + "/cart");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/cart?error=remove_failed");
        }
    }
}
