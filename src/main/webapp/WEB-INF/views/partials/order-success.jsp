<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success - FashionStore</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/order.css">
</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<div class="success-page">
    <div class="success-card">
        <div class="success-icon">✓</div>
        <h1>Order Placed Successfully!</h1>
        <p class="text-muted">Thank you for shopping with FashionStore</p>
        <p class="success-order-id">Order #${orderId}</p>
        <div class="success-details">
            <div class="success-detail">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="var(--success)" stroke-width="2"><rect x="1" y="3" width="15" height="13"/><polygon points="16 8 20 8 23 11 23 16 16 16 16 8"/><circle cx="5.5" cy="18.5" r="2.5"/><circle cx="18.5" cy="18.5" r="2.5"/></svg>
                <span>Estimated Delivery: <strong>Apr 30 - May 2</strong></span>
            </div>
            <div class="success-detail">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="var(--success)" stroke-width="2"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
                <span>Confirmation sent to your email</span>
            </div>
        </div>
        <div class="success-actions">
            <a href="<%=request.getContextPath()%>/order" class="btn-primary">View My Orders</a>
            <a href="<%=request.getContextPath()%>/products" class="btn-secondary">Continue Shopping</a>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>
</html>