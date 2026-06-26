<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} - FashionStore</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/product-details.css">
</head>

<body>

<!-- NAVBAR -->
<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<!-- BREADCRUMB -->
<div class="breadcrumb">
    <div class="container">
        <a href="<%=request.getContextPath()%>/home">Home</a>
        <span>/</span>
        <a href="<%=request.getContextPath()%>/products">Products</a>
        <span>/</span>
        <span class="breadcrumb__active">${product.name}</span>
    </div>
</div>

<!-- PRODUCT DETAIL -->
<section class="pd-section">
    <div class="container pd-layout">

        <!-- LEFT: IMAGE GALLERY -->
        <div class="pd-gallery">
            <div class="pd-gallery__main" id="mainImageWrap">
                <c:set var="finalImgUrl" value="${product.imageUrl.startsWith('http') ? product.imageUrl : pageContext.request.contextPath.concat(product.imageUrl)}" />
                <div class="pd-gallery__main-img" id="mainImage" style="background-image: url('${finalImgUrl}'); background-size: cover; background-position: center;"></div>
                <a href="<%=request.getContextPath()%>/wishlist?action=toggle&id=${product.id}" class="pd-gallery__wishlist" id="pdWishlist" aria-label="Wishlist" style="text-decoration:none; display:flex; align-items:center; justify-content:center;">
                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
                </a>
            </div>
        </div>

        <!-- RIGHT: PRODUCT INFO -->
        <div class="pd-info">
            <h1 class="pd-info__brand">${product.brand}</h1>
            <p class="pd-info__title">${product.name}</p>

            <div class="pd-info__rating">
                <span class="badge-rating">${product.rating} ★</span>
                <span class="text-muted">| ${product.reviewCount} Ratings</span>
            </div>

            <div class="divider"></div>

            <div class="pd-info__price-block">
                <span class="pd-info__price">₹${product.price}</span>
                <c:if test="${product.mrp > product.price}">
                    <span class="pd-info__mrp">MRP <s>₹${product.mrp}</s></span>
                    <span class="pd-info__discount">(${product.discount}% OFF)</span>
                </c:if>
            </div>

            <div class="divider"></div>

            <!-- Size Selector -->
            <div class="pd-info__sizes">
                <h3>Select Size</h3>
                <div class="pd-info__size-options" id="sizeOptions">
                    <button class="pd-size-btn" data-size="S">S</button>
                    <button class="pd-size-btn selected" data-size="M">M</button>
                    <button class="pd-size-btn" data-size="L">L</button>
                    <button class="pd-size-btn" data-size="XL">XL</button>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="pd-info__actions">
                <form action="<%=request.getContextPath()%>/addtocart" method="post" style="width:100%; display:flex; gap:10px;">
                    <input type="hidden" name="productId" value="${product.id}">
                    <input type="hidden" name="quantity" value="1">
                    <input type="hidden" name="size" value="M" id="selectedSizeInput">
                    <button type="submit" class="btn-primary btn-block">Add to Cart</button>
                </form>
            </div>

            <div class="divider"></div>

            <div class="pd-info__details">
                <h3>Product Description</h3>
                <p>${product.description}</p>
            </div>
        </div>
    </div>
</section>

<!-- REVIEWS SECTION AT THE BOTTOM -->
<section class="reviews-section" style="background: #fff; padding: 50px 0; border-top: 1px solid #eee;">
    <div class="container">
        <h2 style="margin-bottom: 30px;">Customer Reviews (${reviews.size()})</h2>
        
        <div class="reviews-layout" style="display: grid; grid-template-columns: 1fr 2fr; gap: 40px;">
            <!-- Left: Write Review -->
            <div class="write-review-card" style="background: #f9f9f9; padding: 30px; border-radius: 8px; height: fit-content;">
                <h3 style="margin-bottom: 20px;">Rate this product</h3>
                <form action="<%=request.getContextPath()%>/submit-review" method="post">
                    <input type="hidden" name="productId" value="${product.id}">
                    <div style="margin-bottom: 15px;">
                        <label style="display: block; margin-bottom: 5px;">Rating:</label>
                        <select name="rating" required style="width: 100%; padding: 10px; border: 1px solid #ddd;">
                            <option value="5">5 ★ (Excellent)</option>
                            <option value="4">4 ★ (Very Good)</option>
                            <option value="3">3 ★ (Good)</option>
                            <option value="2">2 ★ (Fair)</option>
                            <option value="1">1 ★ (Poor)</option>
                        </select>
                    </div>
                    <div style="margin-bottom: 15px;">
                        <label style="display: block; margin-bottom: 5px;">Comment:</label>
                        <textarea name="comment" rows="4" placeholder="How was the product?" required style="width: 100%; padding: 10px; border: 1px solid #ddd;"></textarea>
                    </div>
                    <button type="submit" class="btn-primary" style="width: 100%;">Post Review</button>
                </form>
            </div>

            <!-- Right: Reviews List -->
            <div class="reviews-list">
                <c:forEach var="r" items="${reviews}">
                    <div class="review-item" style="padding: 20px; border-bottom: 1px solid #eee;">
                        <div style="display: flex; align-items: center; margin-bottom: 10px;">
                            <span class="badge-rating" style="margin-right: 15px;">${r.rating} ★</span>
                            <strong>${r.userName}</strong>
                            <span style="color: #999; font-size: 13px; margin-left: 15px;">${r.createdAt}</span>
                        </div>
                        <p style="color: #666; line-height: 1.6;">${r.comment}</p>
                    </div>
                </c:forEach>
                <c:if test="${empty reviews}">
                    <div style="text-align: center; padding: 40px; color: #999;">
                        <p>No reviews yet. Be the first to share your thoughts!</p>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</section>

<!-- FOOTER -->
<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

<script>
    // Size selection logic
    const sizeBtns = document.querySelectorAll('.pd-size-btn');
    const sizeInput = document.getElementById('selectedSizeInput');
    
    sizeBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            sizeBtns.forEach(b => b.classList.remove('selected'));
            btn.classList.add('selected');
            sizeInput.value = btn.dataset.size;
        });
    });
</script>

</body>
</html>