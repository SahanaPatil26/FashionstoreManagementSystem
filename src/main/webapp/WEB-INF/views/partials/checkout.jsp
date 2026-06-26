<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Checkout - FashionStore</title>
            <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/checkout.css">
        </head>

        <body>

            <!-- NAVBAR -->
            <jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

            <!-- STEP INDICATOR -->
            <div class="cart-steps">
                <div class="container">
                    <div class="cart-steps__inner">
                        <div class="cart-step completed"><span class="cart-step__num">✓</span><span
                                class="cart-step__label">BAG</span></div>
                        <div class="cart-step__line cart-step__line--done"></div>
                        <div class="cart-step active"><span class="cart-step__num">2</span><span
                                class="cart-step__label">ADDRESS</span></div>
                        <div class="cart-step__line"></div>
                        <div class="cart-step"><span class="cart-step__num">3</span><span
                                class="cart-step__label">PAYMENT</span></div>
                    </div>
                </div>
            </div>

            <!-- CHECKOUT LAYOUT -->
            <div class="checkout-layout">
                <div class="container checkout-layout__inner">

                    <!-- LEFT: FORMS -->
                    <div class="checkout-forms">

                        <!-- Address Section -->
                        <div class="checkout-section" id="addressSection">
                            <h3 class="checkout-section__title">
                                <span class="checkout-section__num">1</span>
                                Delivery Address
                            </h3>
                            <form class="checkout-form" id="orderForm"
                                action="<%=request.getContextPath()%>/order/place" method="post">
                                <div class="form-row">
                                    <div class="form-group">
                                        <label class="form-label">Full Name *</label>
                                        <input type="text" name="fullName" class="form-input"
                                            placeholder="Enter full name" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Mobile Number *</label>
                                        <input type="tel" name="mobile" class="form-input" placeholder="10-digit mobile"
                                            maxlength="10" required>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group">
                                        <label class="form-label">Pincode *</label>
                                        <input type="text" name="pincode" class="form-input"
                                            placeholder="6-digit pincode" maxlength="6" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">City *</label>
                                        <input type="text" name="city" class="form-input" placeholder="City" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Address *</label>
                                    <textarea name="address" class="form-input" rows="3"
                                        placeholder="House No, Street, Area" required></textarea>
                                </div>
                                <div class="form-group">
                                    <label class="form-label">Landmark (Optional)</label>
                                    <input type="text" name="landmark" class="form-input" placeholder="Near...">
                                </div>

                                <input type="hidden" name="totalAmount" value="${totalAmount}">

                                <div class="checkout-section" id="paymentSection">
                                    <h3 class="checkout-section__title">
                                        <span class="checkout-section__num">2</span>
                                        Payment Method
                                    </h3>
                                    <div class="checkout-form" id="paymentForm">
                                        <label class="payment-option">
                                            <input type="radio" name="payment" value="COD" checked>
                                            <div class="payment-option__content">
                                                <strong>💵 Cash on Delivery</strong>
                                                <p class="text-muted">Pay when you receive</p>
                                            </div>
                                        </label>
                                        <label class="payment-option">
                                            <input type="radio" name="payment" value="UPI">
                                            <div class="payment-option__content">
                                                <strong>📱 UPI (GPay / PhonePe)</strong>
                                                <p class="text-muted">Pay via UPI ID</p>
                                            </div>
                                        </label>
                                        <button type="submit" class="btn-primary btn-block">Place Order</button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <!-- RIGHT: ORDER SUMMARY -->
                        <aside class="checkout-summary">
                            <h4 class="checkout-summary__title">Order Summary</h4>
                            <c:forEach var="item" items="${cartItems}">
                                <c:set var="p" value="${productMap[item.productId]}" />
                                <div class="checkout-summary__item">
                                    <div class="checkout-summary__img"
                                        style="background-image: url('<%=request.getContextPath()%>${p.imageUrl}'); background-size: cover; background-position: center;">
                                    </div>
                                    <div>
                                        <p class="text-bold">${p.brand} ${p.name}</p>
                                        <p class="text-muted" style="font-size:12px;">Size: ${item.size} | Qty:
                                            ${item.quantity}</p>
                                        <span class="price-current">₹${p.price}</span>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="divider"></div>
                            <div class="checkout-summary__row"><span>Total MRP</span><span>₹${totalMrp}</span></div>
                            <div class="checkout-summary__row"><span>Discount</span><span
                                    class="text-success">-₹${totalDiscount}</span></div>
                            <div class="checkout-summary__row"><span>Delivery</span><span
                                    class="text-success">FREE</span></div>
                            <div class="divider"></div>
                            <div class="checkout-summary__row checkout-summary__total">
                                <span>Total</span><span>₹${totalAmount}</span>
                            </div>
                        </aside>

                    </div>
                </div>

                <jsp:include page="/WEB-INF/views/partials/footer.jsp" />

                <script src="<%=request.getContextPath()%>/assets/js/checkout.js"></script>

        </body>

        </html>