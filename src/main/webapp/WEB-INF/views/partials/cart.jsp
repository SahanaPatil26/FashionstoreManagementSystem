<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Shopping Bag - FashionStore</title>
            <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/cart.css">
        </head>

        <body>

            <!-- NAVBAR -->
            <jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

            <!-- CART STEPS INDICATOR -->
            <div class="cart-steps">
                <div class="container">
                    <div class="cart-steps__inner">
                        <div class="cart-step active">
                            <span class="cart-step__num">1</span>
                            <span class="cart-step__label">CART</span>
                        </div>
                        <div class="cart-step__line"></div>
                        <div class="cart-step">
                            <span class="cart-step__num">2</span>
                            <span class="cart-step__label">ADDRESS</span>
                        </div>
                        <div class="cart-step__line"></div>
                        <div class="cart-step">
                            <span class="cart-step__num">3</span>
                            <span class="cart-step__label">PAYMENT</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- CART LAYOUT -->
            <div class="cart-layout">
                <div class="container cart-layout__inner">

                    <!-- LEFT: CART ITEMS -->
                    <div class="cart-items">

                        <!-- Delivery Info -->
                        <div class="cart-delivery-bar">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="var(--success)"
                                stroke-width="2">
                                <path d="m5 12 5 5L20 7" />
                            </svg>
                            <span>Yay! <strong>Free delivery</strong> on this order</span>
                        </div>

                        <c:forEach var="item" items="${cartItems}">
                            <c:set var="p" value="${productMap[item.productId]}" />
                            <!-- Cart Card -->
                            <div class="cart-card">
                                <c:set var="finalImgUrl" value="${p.imageUrl.startsWith('http') ? p.imageUrl : pageContext.request.contextPath.concat(p.imageUrl)}" />
                                <div class="cart-card__img"
                                    style="background-image: url('${finalImgUrl}'); background-size: cover; background-position: center;">
                                </div>
                                <div class="cart-card__details">
                                    <div class="cart-card__top">
                                        <div>
                                            <h3 class="cart-card__brand">${p.brand}</h3>
                                            <p class="cart-card__name">${p.name}</p>
                                            <p class="cart-card__meta text-muted">Size: ${item.size} | Qty:
                                                ${item.quantity}</p>
                                        </div>
                                        <form action="<%=request.getContextPath()%>/removefromcart" method="post"
                                            style="margin-top: 10px;">
                                            <input type="hidden" name="cartItemId" value="${item.id}">
                                            <button type="submit" class="btn-ghost"
                                                style="color: #ff3f6c; font-size: 12px; font-weight: bold; border: 1px solid #ddd; padding: 5px 10px; cursor: pointer;">REMOVE
                                                FROM CART</button>
                                        </form>
                                    </div>
                                    <div class="cart-card__bottom">
                                        <div class="cart-card__qty">
                                            <button
                                                onclick="location.href='<%=request.getContextPath()%>/updatecart?id=${item.id}&qty=${item.quantity - 1}'"
                                                ${item.quantity <=1 ? 'disabled' : '' }>−</button>
                                            <span class="cart-card__qty-val">${item.quantity}</span>
                                            <button
                                                onclick="location.href='<%=request.getContextPath()%>/updatecart?id=${item.id}&qty=${item.quantity + 1}'">+</button>
                                        </div>
                                        <div class="cart-card__price">
                                            <span class="price-current">₹${p.price}</span>
                                            <c:if test="${p.mrp > p.price}">
                                                <span class="price-original">₹${p.mrp}</span>
                                                <span class="price-discount">${p.discount}% OFF</span>
                                            </c:if>
                                        </div>
                                    </div>
                                    <p class="cart-card__delivery text-muted">
                                        <svg width="14" height="14" viewBox="0 0 24 24" fill="none"
                                            stroke="currentColor" stroke-width="2">
                                            <rect x="1" y="3" width="15" height="13" />
                                            <polygon points="16 8 20 8 23 11 23 16 16 16 16 8" />
                                            <circle cx="5.5" cy="18.5" r="2.5" />
                                            <circle cx="18.5" cy="18.5" r="2.5" />
                                        </svg>
                                        Estimated delivery in 3-5 days
                                    </p>
                                </div>
                            </div>
                        </c:forEach>

                        <c:if test="${empty cartItems}">
                            <div class="empty-cart" style="text-align: center; padding: 50px;">
                                <img src="<%=request.getContextPath()%>/assets/images/empty_cart.png" alt="Empty Cart"
                                    style="width: 200px; margin-bottom: 20px;">
                                <h3>Your bag is empty!</h3>
                                <p class="text-muted">Add something from your wishlist or shop our new arrivals.</p>
                                <a href="<%=request.getContextPath()%>/products" class="btn-primary"
                                    style="display: inline-block; margin-top: 20px;">Continue Shopping</a>
                            </div>
                        </c:if>

                    </div>

                    <!-- RIGHT: PRICE SUMMARY -->
                    <aside class="cart-summary">
                        <div class="divider"></div>

                        <!-- Price Details -->
                        <h4 class="cart-summary__title">Price Details</h4>

                        <div class="cart-summary__row">
                            <span>Total MRP</span>
                            <span>₹${totalMrp}</span>
                        </div>
                        <div class="cart-summary__row">
                            <span>Discount on MRP</span>
                            <span class="text-success">-₹${totalDiscount}</span>
                        </div>
                        <div class="cart-summary__row">
                            <span>Delivery Fee</span>
                            <span class="text-success">FREE</span>
                        </div>

                        <div class="divider"></div>

                        <div class="cart-summary__row cart-summary__total">
                            <span>Total Amount</span>
                            <span id="totalAmount">₹${totalAmount}</span>
                        </div>

                        <a href="<%=request.getContextPath()%>/order/checkout"
                            class="btn-primary btn-block cart-place-btn">
                            Place Order
                        </a>

                        <!-- Trust Badges -->
                        <div class="cart-trust">
                            <div class="cart-trust__item">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--success)"
                                    stroke-width="2">
                                    <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z" />
                                </svg>
                                <span>Secure Checkout</span>
                            </div>
                            <div class="cart-trust__item">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="var(--success)"
                                    stroke-width="2">
                                    <path
                                        d="M4 14a1 1 0 0 1-.78-1.63l9.9-10.2a.5.5 0 0 1 .86.46l-1.92 6.02A1 1 0 0 0 13 10h7a1 1 0 0 1 .78 1.63l-9.9 10.2a.5.5 0 0 1-.86-.46l1.92-6.02A1 1 0 0 0 11 14z" />
                                </svg>
                                <span>Easy Returns</span>
                            </div>
                        </div>
                    </aside>

                </div>
            </div>

            <!-- FOOTER -->
            <jsp:include page="/WEB-INF/views/partials/footer.jsp" />

            <script src="<%=request.getContextPath()%>/assets/js/cart.js"></script>

        </body>

        </html>