package com.fashionstore.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fashionstore.dao.OrderDAO;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.OrderDAOImpl;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.Order;
import com.fashionstore.model.Product;

import java.io.IOException;
import java.util.List;

public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("userRole");

        // Simple check for admin role
        if (!"ADMIN".equals(userRole)) {
            response.sendRedirect(request.getContextPath() + "/login?error=admin_only");
            return;
        }

        String path = request.getPathInfo();
        ProductDAO productDAO = new ProductDAOImpl();
        OrderDAO orderDAO = new OrderDAOImpl();

        if (path == null || path.equals("/")) {
            // Admin Dashboard
            request.setAttribute("products", productDAO.getAllProducts());
            request.setAttribute("orders", orderDAO.getAllOrders());
            request.getRequestDispatcher("/WEB-INF/views/partials/admin.jsp").forward(request, response);
        } else if (path.equals("/orders")) {
             // Handle order management
        }
    }
}
