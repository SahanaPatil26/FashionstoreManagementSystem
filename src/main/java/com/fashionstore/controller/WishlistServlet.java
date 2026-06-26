package com.fashionstore.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.WishlistDAO;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.dao.impl.WishlistDAOImpl;
import com.fashionstore.model.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class WishlistServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login?error=login_required");
            return;
        }

        String action = request.getParameter("action");
        WishlistDAO wishlistDAO = new WishlistDAOImpl();
        ProductDAO productDAO = new ProductDAOImpl();

        if ("toggle".equals(action)) {
            int productId = Integer.parseInt(request.getParameter("id"));
            if (wishlistDAO.isInWishlist(userId, productId)) {
                wishlistDAO.removeFromWishlist(userId, productId);
            } else {
                wishlistDAO.addToWishlist(userId, productId);
            }
            String referer = request.getHeader("referer");
            response.sendRedirect(referer != null ? referer : request.getContextPath() + "/products");
            return;
        }

        // Show Wishlist
        List<Integer> productIds = wishlistDAO.getWishlistProductIds(userId);
        List<Product> products = new ArrayList<>();
        for (int id : productIds) {
            Product p = productDAO.getProductById(id);
            if (p != null) products.add(p);
        }

        request.setAttribute("wishlistProducts", products);
        request.getRequestDispatcher("/WEB-INF/views/partials/wishlist.jsp").forward(request, response);
    }
}
