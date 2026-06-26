package com.fashionstore.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.Product;

import java.io.IOException;

public class ProductDetailsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            ProductDAO productDAO = new ProductDAOImpl();
            Product product = productDAO.getProductById(id);
            
            if (product != null) {
                com.fashionstore.dao.ReviewDAO reviewDAO = new com.fashionstore.dao.impl.ReviewDAOImpl();
                java.util.List<com.fashionstore.model.Review> reviews = reviewDAO.getReviewsByProductId(id);
                request.setAttribute("product", product);
                request.setAttribute("reviews", reviews);
            }
        }

        request.getRequestDispatcher("/WEB-INF/views/partials/product-details.jsp")
                .forward(request, response);
    }
}
