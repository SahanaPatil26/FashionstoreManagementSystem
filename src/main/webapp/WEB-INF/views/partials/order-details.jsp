<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Order Details - FashionStore</title>
            <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/order.css">
        </head>

        <body>

            <jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

            <div class="orders-page">
                <div class="container">
                    <h2 class="section-title">Order #${order.id}</h2>

                    <!-- Order Timeline -->
                    <div class="order-timeline">
                        <div class="timeline-step completed">
                            <div class="timeline-step__dot"></div>
                            <div class="timeline-step__info">
                                <strong>Order Placed</strong>
                                <p class="text-muted">${order.orderDate}</p>
                            </div>
                        </div>
                        <div
                            class="timeline-step ${order.status == 'Confirmed' || order.status == 'Shipped' || order.status == 'Delivered' ? 'completed' : 'active'}">
                            <div class="timeline-step__dot"></div>
                            <div class="timeline-step__info">
                                <strong>Order Confirmed</strong>
                            </div>
                        </div>
                        <div
                            class="timeline-step ${order.status == 'Shipped' || order.status == 'Delivered' ? 'completed' : (order.status == 'Confirmed' ? 'active' : '')}">
                            <div class="timeline-step__dot"></div>
                            <div class="timeline-step__info">
                                <strong>Shipped</strong>
                            </div>
                        </div>
                        <div
                            class="timeline-step ${order.status == 'Delivered' ? 'completed' : (order.status == 'Shipped' ? 'active' : '')}">
                            <div class="timeline-step__dot"></div>
                            <div class="timeline-step__info">
                                <strong>Delivered</strong>
                            </div>
                        </div>
                    </div>

                    <!-- Order Items -->
                    <div class="order-detail-card">
                        <c:forEach var="item" items="${orderItems}">
                            <c:set var="p" value="${productMap[item.productId]}" />
                            <div class="order-card__body">
                                <div class="order-card__img"
                                    style="background-image: url('<%=request.getContextPath()%>${p.imageUrl}'); background-size: cover; background-position: center;">
                                </div>
                                <div class="order-card__info">
                                    <h4>${p.brand} ${p.name}</h4>
                                    <p class="text-muted">Size: ${item.size} | Qty: ${item.quantity}</p>
                                    <p class="price-current">₹${item.price}</p>
                                </div>
                            </div>
                            <div class="divider"></div>
                        </c:forEach>
                        <div class="order-detail-row"><span>Delivery Address</span><span>${order.address}</span></div>
                        <div class="order-detail-row"><span>Mobile</span><span>${order.phone}</span></div>
                        <div class="order-detail-row"><span>Payment Mode</span><span>${order.paymentMode}</span></div>
                        <div class="order-detail-row"><span>Total Paid</span><span
                                class="text-bold">₹${order.totalAmount}</span></div>
                    </div>

                    <a href="<%=request.getContextPath()%>/order" class="btn-secondary">← Back to Orders</a>
                </div>
            </div>

            <jsp:include page="/WEB-INF/views/partials/footer.jsp" />
            <script src="<%=request.getContextPath()%>/assets/js/order.js"></script>

        </body>

        </html>