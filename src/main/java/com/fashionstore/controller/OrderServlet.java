

package com.fashionstore.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.fashionstore.dao.CartDAO;
import com.fashionstore.dao.OrderDAO;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.CartDAOImpl;
import com.fashionstore.dao.impl.OrderDAOImpl;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.CartItem;
import com.fashionstore.model.Order;
import com.fashionstore.model.OrderItem;
import com.fashionstore.model.Product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login?error=login_required");
            return;
        }

        String path = request.getPathInfo();

        if (path == null || path.equals("/")) {
            // My Orders List
            OrderDAO orderDAO = new OrderDAOImpl();
            ProductDAO productDAO = new ProductDAOImpl();
            List<Order> orders = orderDAO.getOrdersByUserId(userId);
            
            // Map to store first item of each order for display
            Map<Integer, OrderItem> firstItemMap = new HashMap<>();
            Map<Integer, Product> productMap = new HashMap<>();
            
            for (Order o : orders) {
                List<OrderItem> items = orderDAO.getOrderItems(o.getId());
                if (!items.isEmpty()) {
                    OrderItem firstItem = items.get(0);
                    firstItemMap.put(o.getId(), firstItem);
                    productMap.put(firstItem.getProductId(), productDAO.getProductById(firstItem.getProductId()));
                }
            }
            
            request.setAttribute("orders", orders);
            request.setAttribute("firstItemMap", firstItemMap);
            request.setAttribute("productMap", productMap);
            request.getRequestDispatcher("/WEB-INF/views/partials/my-orders.jsp").forward(request, response);
        } else if (path.equals("/details")) {
            // Order Details
            int orderId = Integer.parseInt(request.getParameter("id"));
            OrderDAO orderDAO = new OrderDAOImpl();
            ProductDAO productDAO = new ProductDAOImpl();
            
            Order order = null;
            List<Order> userOrders = orderDAO.getOrdersByUserId(userId);
            for(Order o : userOrders) if(o.getId() == orderId) order = o;
            
            if (order != null) {
                List<OrderItem> items = orderDAO.getOrderItems(orderId);
                Map<Integer, Product> productMap = new HashMap<>();
                for(OrderItem item : items) productMap.put(item.getProductId(), productDAO.getProductById(item.getProductId()));
                
                request.setAttribute("order", order);
                request.setAttribute("orderItems", items);
                request.setAttribute("productMap", productMap);
                request.getRequestDispatcher("/WEB-INF/views/partials/order-details.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/order");
            }
        } else if (path.equals("/checkout")) {
            // Checkout Page
            CartDAO cartDAO = new CartDAOImpl();
            ProductDAO productDAO = new ProductDAOImpl();
            int cartId = cartDAO.getCartIdByUserId(userId);
            List<CartItem> items = cartDAO.getCartItems(cartId);
            
            Map<Integer, Product> productMap = new HashMap<>();
            double totalMrp = 0;
            double totalAmount = 0;
            for (CartItem item : items) {
                Product p = productDAO.getProductById(item.getProductId());
                productMap.put(item.getProductId(), p);
                if (p != null) {
                    totalMrp += p.getMrp() * item.getQuantity();
                    totalAmount += p.getPrice() * item.getQuantity();
                }
            }
            
            request.setAttribute("cartItems", items);
            request.setAttribute("productMap", productMap);
            request.setAttribute("totalMrp", totalMrp);
            request.setAttribute("totalAmount", totalAmount);
            request.setAttribute("totalDiscount", totalMrp - totalAmount);

            request.getRequestDispatcher("/WEB-INF/views/partials/checkout.jsp").forward(request, response);
        } else if (path.equals("/success")) {
             String orderId = request.getParameter("id");
             request.setAttribute("orderId", orderId);
             request.getRequestDispatcher("/WEB-INF/views/partials/order-success.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        String path = request.getPathInfo();

        if (userId != null && path != null && path.equals("/place")) {
            // Place Order
            String fullName = request.getParameter("fullName");
            String mobile = request.getParameter("mobile");
            String pincode = request.getParameter("pincode");
            String city = request.getParameter("city");
            String rawAddress = request.getParameter("address");
            String landmark = request.getParameter("landmark");
            
            String fullAddress = fullName + ", " + rawAddress + ", " + city + " - " + pincode + (landmark != null && !landmark.isEmpty() ? " (Landmark: " + landmark + ")" : "");
            
            String payment = request.getParameter("payment");
            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

            CartDAO cartDAO = new CartDAOImpl();
            OrderDAO orderDAO = new OrderDAOImpl();
            ProductDAO productDAO = new ProductDAOImpl();

            int cartId = cartDAO.getCartIdByUserId(userId);
            List<CartItem> items = cartDAO.getCartItems(cartId);

            if (items.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }

            Order order = new Order();
            order.setUserId(userId);
            order.setOrderDate(new Date());
            order.setTotalAmount(totalAmount);
            order.setStatus("Ordered");
            order.setAddress(fullAddress);
            order.setPhone(mobile);
            order.setPaymentMode(payment);

            int orderId = orderDAO.createOrder(order);
            if (orderId > 0) {
                for (CartItem item : items) {
                    Product p = productDAO.getProductById(item.getProductId());
                    OrderItem orderItem = new OrderItem();
                    orderItem.setOrderId(orderId);
                    orderItem.setProductId(item.getProductId());
                    orderItem.setQuantity(item.getQuantity());
                    orderItem.setPrice(p.getPrice());
                    orderItem.setSize(item.getSize());
                    orderDAO.addOrderItem(orderItem);
                }
                // Clear cart
                cartDAO.clearCart(cartId);
                response.sendRedirect(request.getContextPath() + "/order/success?id=" + orderId);
            } else {
                response.sendRedirect(request.getContextPath() + "/order/checkout?error=true");
            }
        }
    }
}