<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Wishlist - FashionStore</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/products.css">
    <style>
        .wishlist-header {
            padding: 40px 0 20px;
            border-bottom: 1px solid #eaeaec;
            margin-bottom: 30px;
        }
        .wishlist-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 30px;
            padding-bottom: 60px;
        }
        .wishlist-item {
            position: relative;
            border: 1px solid #eaeaec;
            transition: transform 0.3s ease;
        }
        .wishlist-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .wishlist-remove {
            position: absolute;
            top: 10px;
            right: 10px;
            width: 30px;
            height: 30px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            border: 1px solid #eaeaec;
            z-index: 2;
            text-decoration: none;
            color: #333;
        }
    </style>
</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<div class="container">
    <div class="wishlist-header">
        <h2>My Wishlist <span class="text-muted" style="font-size: 18px;">(${wishlistProducts.size()} Items)</span></h2>
    </div>

    <div class="wishlist-grid">
        <c:forEach var="p" items="${wishlistProducts}">
            <div class="wishlist-item">
                <!-- No more X at the top -->
                <a href="<%=request.getContextPath()%>/productdetails?id=${p.id}" style="text-decoration: none; color: inherit;">
                    <c:set var="finalWImgUrl" value="${p.imageUrl.startsWith('http') ? p.imageUrl : pageContext.request.contextPath.concat(p.imageUrl)}" />
                    <div class="product-card__img" style="background-image: url('${finalWImgUrl}'); background-size: cover; background-position: center; height: 280px;"></div>
                    <div class="product-card__info" style="padding: 15px;">
                        <h3 class="product-card__brand">${p.brand}</h3>
                        <p class="product-card__name">${p.name}</p>
                        <div class="product-card__price">
                            <span class="price-current">₹${p.price}</span>
                            <c:if test="${p.mrp > p.price}">
                                <span class="price-original">₹${p.mrp}</span>
                                <span class="price-discount">${p.discount}% OFF</span>
                            </c:if>
                        </div>
                    </div>
                </a>
                <div style="padding: 0 15px 15px; display: flex; flex-direction: column; gap: 8px;">
                    <form action="<%=request.getContextPath()%>/addtocart" method="post">
                        <input type="hidden" name="productId" value="${p.id}">
                        <input type="hidden" name="quantity" value="1">
                        <input type="hidden" name="size" value="M">
                        <button type="submit" class="btn-primary" style="width: 100%; padding: 10px;">MOVE TO CART</button>
                    </form>
                    <a href="<%=request.getContextPath()%>/wishlist?action=toggle&id=${p.id}" class="btn-ghost" style="text-align: center; color: #ff3f6c; font-size: 12px; font-weight: bold; border: 1px solid #ddd; padding: 5px 10px; text-decoration: none;">REMOVE FROM WISHLIST</a>
                </div>
            </div>
        </c:forEach>
    </div>

    <c:if test="${empty wishlistProducts}">
        <div style="text-align: center; padding: 100px 0;">
            <h3>YOUR WISHLIST IS EMPTY</h3>
            <p class="text-muted">Add items that you like to your wishlist.</p>
            <a href="<%=request.getContextPath()%>/products" class="btn-secondary" style="display: inline-block; margin-top: 20px;">CONTINUE SHOPPING</a>
        </div>
    </c:if>
</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>
</html>
