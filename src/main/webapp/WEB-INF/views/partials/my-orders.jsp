<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <%@ page import="java.util.List" %>
            <%@ page import="com.fashionstore.model.Order" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>My Orders - FashionStore</title>
                    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/order.css">
                </head>

                <body>

                    <jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

                    <div class="orders-page">
                        <div class="container">
                            <h2 class="section-title">My Orders</h2>

                            <c:forEach var="o" items="${orders}">
                                <c:set var="item" value="${firstItemMap[o.id]}" />
                                <c:set var="p" value="${productMap[item.productId]}" />
                                <!-- Order Card -->
                                <div class="order-card"
                                    onclick="window.location.href='<%=request.getContextPath()%>/order/details?id=${o.id}'">
                                    <div class="order-card__header">
                                        <div>
                                            <span class="order-card__id">Order #${o.id}</span>
                                            <span class="text-muted">| Placed on ${o.orderDate}</span>
                                        </div>
                                        <span
                                            class="order-status order-status--${o.status.toLowerCase()}">${o.status}</span>
                                    </div>
                                    <div class="order-card__body">
                                        <div class="order-card__img"
                                            style="background-image: url('<%=request.getContextPath()%>${p.imageUrl}'); background-size: cover; background-position: center;">
                                        </div>
                                        <div class="order-card__info">
                                            <h4>${p.brand} ${p.name}</h4>
                                            <p class="text-muted">Size: ${item.size} | Qty: ${item.quantity}</p>
                                            <p class="price-current">₹${o.totalAmount}</p>
                                        </div>
                                        <div class="order-card__action">
                                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none"
                                                stroke="var(--text-muted)" stroke-width="2">
                                                <path d="m9 18 6-6-6-6" />
                                            </svg>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${empty orders}">
                                <div class="no-orders" style="text-align: center; padding: 50px;">
                                    <p>You haven't placed any orders yet.</p>
                                    <a href="<%=request.getContextPath()%>/products" class="btn-primary"
                                        style="display: inline-block; margin-top: 20px;">Start Shopping</a>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <jsp:include page="/WEB-INF/views/partials/footer.jsp" />
                    <script src="<%=request.getContextPath()%>/assets/js/order.js"></script>

                </body>

                </html>