package com.fashionstore.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.fashionstore.dao.UserDAO;
import com.fashionstore.dao.impl.UserDAOImpl;
import com.fashionstore.model.User;

import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/partials/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAOImpl();
        User user = userDAO.loginUser(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user.getName());
            session.setAttribute("userId", user.getId());
            session.setAttribute("userRole", user.getRole() != null ? user.getRole() : "USER");

            // Ensure user has a cart
            com.fashionstore.dao.CartDAO cartDAO = new com.fashionstore.dao.impl.CartDAOImpl();
            int cartId = cartDAO.getCartIdByUserId(user.getId());
            if (cartId == 0) {
                cartDAO.createCart(user.getId());
            }

            response.sendRedirect(request.getContextPath() + "/home");
        } else {
            response.sendRedirect(request.getContextPath() + "/login?error=invalid");
        }
    }
}
