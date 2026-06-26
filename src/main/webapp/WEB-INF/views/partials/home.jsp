<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FashionStore - Online Shopping for Men, Women & Kids</title>
    <meta name="description" content="Shop the latest trends in fashion. Best deals on clothing, footwear & accessories.">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/home.css">
</head>

<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<!-- HERO BANNER SLIDER -->
<section class="hero-slider" id="heroSlider">
    <div class="hero-slider__track" id="heroTrack">
        <div class="hero-slide" style="background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?auto=format&fit=crop&w=1200&q=80') center/cover no-repeat;">
            <div class="container hero-slide__content">
                <div class="hero-slide__text">
                    <span class="hero-slide__tag">New Season</span>
                    <h1>Flat 50-80% Off</h1>
                    <p>On All Trending Fashion</p>
                    <a href="<%=request.getContextPath()%>/products" class="btn-primary">Shop Now</a>
                </div>
            </div>
        </div>
        <div class="hero-slide" style="background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://images.unsplash.com/photo-1483985988355-763728e1935b?auto=format&fit=crop&w=1200&q=80') center/cover no-repeat;">
            <div class="container hero-slide__content">
                <div class="hero-slide__text">
                    <span class="hero-slide__tag">Limited Time</span>
                    <h1>End of Season Sale</h1>
                    <p>Extra 10% Off on Prepaid Orders</p>
                    <a href="<%=request.getContextPath()%>/products" class="btn-primary">Explore Deals</a>
                </div>
            </div>
        </div>
        <div class="hero-slide" style="background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)), url('https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?auto=format&fit=crop&w=1200&q=80') center/cover no-repeat;">
            <div class="container hero-slide__content">
                <div class="hero-slide__text">
                    <span class="hero-slide__tag">🔥 Flash Sale</span>
                    <h1>Top Brands at Min 60% Off</h1>
                    <p>Free Shipping on Orders Above ₹499</p>
                    <a href="<%=request.getContextPath()%>/products" class="btn-primary">Grab Now</a>
                </div>
            </div>
        </div>
    </div>
    <button class="hero-slider__btn hero-slider__btn--prev" id="heroPrev">&#10094;</button>
    <button class="hero-slider__btn hero-slider__btn--next" id="heroNext">&#10095;</button>
    <div class="hero-slider__dots" id="heroDots"></div>
</section>

<!-- OFFER BANNERS STRIP -->
<section class="offer-strip">
    <div class="container">
        <div class="offer-strip__cards">
            <div class="offer-strip__card" style="background: linear-gradient(135deg, #FF3F6C, #ff6b8a);">
                <span class="offer-strip__icon">💳</span>
                <div>
                    <strong>10% Instant Off</strong>
                    <p>On SBI Credit Cards</p>
                </div>
            </div>
            <div class="offer-strip__card" style="background: linear-gradient(135deg, #2874F0, #5a9cf0);">
                <span class="offer-strip__icon">🚚</span>
                <div>
                    <strong>Free Delivery</strong>
                    <p>On Orders Above ₹499</p>
                </div>
            </div>
            <div class="offer-strip__card" style="background: linear-gradient(135deg, #03A685, #2ec4a0);">
                <span class="offer-strip__icon">🔄</span>
                <div>
                    <strong>Easy Returns</strong>
                    <p>30 Day Return Policy</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- FEATURED PRODUCTS -->
<section class="products-home">
    <div class="container">
        <div class="flex-between mb-lg">
            <h2 class="section-title">Top Picks for You</h2>
            <a href="<%=request.getContextPath()%>/products" class="btn-ghost">View All →</a>
        </div>
        <div class="product-grid-home">
            <c:forEach var="p" items="${featuredProducts}">
                <div class="product-card-home">
                    <a href="<%=request.getContextPath()%>/productdetails?id=${p.id}" style="text-decoration: none; color: inherit;">
                        <div class="product-card-home__img-wrap">
                            <div class="product-card-home__img">
                                <c:choose>
                                    <c:when test="${p.imageUrl.startsWith('http')}">
                                        <img src="${p.imageUrl}" alt="${p.name}">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="<%=request.getContextPath()%>${p.imageUrl}" alt="${p.name}">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="product-card__actions">
                                <c:set var="isInWishlist" value="false" />
                                <c:forEach var="wid" items="${wishlistIds}">
                                    <c:if test="${wid == p.id}">
                                        <c:set var="isInWishlist" value="true" />
                                    </c:if>
                                </c:forEach>
                                
                                <a href="<%=request.getContextPath()%>/wishlist?action=toggle&id=${p.id}" 
                                   class="action-btn wishlist-btn" 
                                   title="Add to Wishlist" 
                                   style="color: ${isInWishlist ? '#ff3f6c' : 'inherit'};">
                                    <svg width="18" height="18" viewBox="0 0 24 24" fill="${isInWishlist ? '#ff3f6c' : 'none'}" stroke="currentColor" stroke-width="2">
                                        <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/>
                                    </svg>
                                </a>
                            </div>
                            <c:if test="${p.discount >= 50}">
                                <span class="badge-tag product-card-home__badge">Bestseller</span>
                            </c:if>
                        </div>
                        <div class="product-card-home__info">
                            <h3 class="product-card-home__brand">${p.brand}</h3>
                            <p class="product-card-home__name">${p.name}</p>
                            <div class="product-card-home__price">
                                <span class="price-current">₹${p.price}</span>
                                <c:if test="${p.mrp > p.price}">
                                    <span class="price-original">₹${p.mrp}</span>
                                    <span class="price-discount">(${p.discount}% OFF)</span>
                                </c:if>
                            </div>
                            <div class="product-card-home__rating">
                                <span class="badge-rating">${p.rating} ★</span>
                                <span class="text-muted">| ${p.reviewCount}</span>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</section>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

<!-- JS -->
<script src="<%=request.getContextPath()%>/assets/js/home.js"></script>

</body>
</html>