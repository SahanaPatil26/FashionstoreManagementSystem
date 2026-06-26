package com.fashionstore.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.Product;

import java.io.IOException;
import java.util.List;

public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO productDAO = new ProductDAOImpl();
        List<Product> products = productDAO.getAllProducts();
        List<Product> featuredProducts = products.size() > 8 ? products.subList(0, 8) : products;
        
        // Fetch wishlist IDs for highlighting hearts
        jakarta.servlet.http.HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId != null) {
            com.fashionstore.dao.WishlistDAO wishlistDAO = new com.fashionstore.dao.impl.WishlistDAOImpl();
            List<Integer> wishlistIds = wishlistDAO.getWishlistProductIds(userId);
            request.setAttribute("wishlistIds", wishlistIds);
        }

        request.setAttribute("featuredProducts", featuredProducts);

        // Forward to home page
        request.getRequestDispatcher("/WEB-INF/views/partials/home.jsp")
                .forward(request, response);
    }
}