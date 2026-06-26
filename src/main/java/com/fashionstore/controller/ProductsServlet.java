package com.fashionstore.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.Product;

public class ProductsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProductDAO productDAO = new ProductDAOImpl();
        List<Product> products;

        // Get filter/sort params from URL
        String categoryIdStr = request.getParameter("categoryId");
        String searchQuery = request.getParameter("search");
        String sort = request.getParameter("sort");
        String[] brandArray = request.getParameterValues("brand");
        String[] categoryArray = request.getParameterValues("category");
        String priceRange = request.getParameter("price");
        String minRatingStr = request.getParameter("minRating");
        
        double minPrice = 0, maxPrice = 1000000;
        double minRating = 0;

        if (priceRange != null && priceRange.contains("-")) {
            String[] parts = priceRange.split("-");
            minPrice = Double.parseDouble(parts[0]);
            maxPrice = Double.parseDouble(parts[1]);
        }
        if (minRatingStr != null) {
            minRating = Double.parseDouble(minRatingStr);
        }

        if (brandArray != null || categoryArray != null || priceRange != null || minRatingStr != null) {
            List<String> brands = brandArray != null ? java.util.Arrays.asList(brandArray) : null;
            List<String> categories = categoryArray != null ? java.util.Arrays.asList(categoryArray) : null;
            
            // Cast to Impl to use the extended filter method
            products = ((com.fashionstore.dao.impl.ProductDAOImpl)productDAO).filterProductsExtended(minPrice, maxPrice, brands, categories, sort, minRating);
        } else if (searchQuery != null && !searchQuery.isEmpty()) {
            products = productDAO.searchProducts(searchQuery);
        } else if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            int categoryId = Integer.parseInt(categoryIdStr);
            if (sort != null && !sort.isEmpty()) {
                products = productDAO.sortProductsByCategory(sort, categoryId);
                request.setAttribute("selectedSort", sort);
            } else {
                products = productDAO.getProductsByCategory(categoryId);
            }
            request.setAttribute("selectedCategory", categoryId);
        } else if (sort != null && !sort.isEmpty()) {
            products = productDAO.sortProducts(sort);
            request.setAttribute("selectedSort", sort);
        } else {
            products = productDAO.getAllProducts();
        }

        // Fetch wishlist IDs for highlighting hearts
        jakarta.servlet.http.HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId != null) {
            com.fashionstore.dao.WishlistDAO wishlistDAO = new com.fashionstore.dao.impl.WishlistDAOImpl();
            List<Integer> wishlistIds = wishlistDAO.getWishlistProductIds(userId);
            request.setAttribute("wishlistIds", wishlistIds);
        }

        // Pass params and product list to JSP
        request.setAttribute("productList", products);
        if (searchQuery != null) request.setAttribute("searchQuery", searchQuery);

        request.getRequestDispatcher("/WEB-INF/views/partials/products.jsp")
                .forward(request, response);
    }
}
