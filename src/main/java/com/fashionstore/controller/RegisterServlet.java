

package com.fashionstore.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // show register page
        request.getRequestDispatcher("/WEB-INF/views/partials/register.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        com.fashionstore.model.User user = new com.fashionstore.model.User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setRole("USER");

        com.fashionstore.dao.UserDAO userDAO = new com.fashionstore.dao.impl.UserDAOImpl();
        boolean success = userDAO.registerUser(user);

        if (success) {
            // Auto-login or go to login page
            response.sendRedirect(request.getContextPath() + "/login?registered=true");
        } else {
            response.sendRedirect(request.getContextPath() + "/register?error=failed");
        }
    }
}
