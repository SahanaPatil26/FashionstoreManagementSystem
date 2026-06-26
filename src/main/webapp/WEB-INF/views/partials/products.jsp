<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="com.fashionstore.model.Product" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products - FashionStore</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/products.css">
</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<div class="breadcrumb">
    <div class="container">
        <a href="<%=request.getContextPath()%>/home">Home</a>
        <span>/</span>
        <span class="breadcrumb__active">All Products</span>
    </div>
</div>

<div class="products-layout">
    <div class="container products-layout__inner">

        <!-- LEFT: FILTERS SIDEBAR -->
        <aside class="filters-sidebar" id="filtersSidebar">
            <form action="<%=request.getContextPath()%>/products" method="get" id="filterForm">
                <div class="filters-sidebar__header">
                    <h3>Filters</h3>
                    <button type="reset" class="btn-ghost" onclick="window.location.href='<%=request.getContextPath()%>/products'">Clear All</button>
                </div>

                <!-- Category Filter -->
                <div class="filter-group">
                    <h4 class="filter-group__title">Category</h4>
                    <div class="filter-group__options">
                        <label class="filter-checkbox"><input type="checkbox" name="category" value="1" ${categoryId == '1' ? 'checked' : ''}> <span>Men</span></label>
                        <label class="filter-checkbox"><input type="checkbox" name="category" value="2" ${categoryId == '2' ? 'checked' : ''}> <span>Women</span></label>
                        <label class="filter-checkbox"><input type="checkbox" name="category" value="3" ${categoryId == '3' ? 'checked' : ''}> <span>Kids</span></label>
                        <label class="filter-checkbox"><input type="checkbox" name="category" value="4" ${categoryId == '4' ? 'checked' : ''}> <span>Accessories</span></label>
                    </div>
                </div>

                <!-- Price Filter -->
                <div class="filter-group">
                    <h4 class="filter-group__title">Price Range</h4>
                    <div class="filter-group__options">
                        <label class="filter-radio"><input type="radio" name="price" value="0-500"> <span>Under ₹500</span></label>
                        <label class="filter-radio"><input type="radio" name="price" value="500-1000"> <span>₹500 - ₹1,000</span></label>
                        <label class="filter-radio"><input type="radio" name="price" value="1000-2000"> <span>₹1,000 - ₹2,000</span></label>
                        <label class="filter-radio"><input type="radio" name="price" value="2000-5000"> <span>₹2,000 - ₹5,000</span></label>
                    </div>
                </div>

                <!-- Rating Filter -->
                <div class="filter-group">
                    <h4 class="filter-group__title">Customer Rating</h4>
                    <div class="filter-group__options">
                        <label class="filter-radio"><input type="radio" name="minRating" value="4"> <span>4 ★ & above</span></label>
                        <label class="filter-radio"><input type="radio" name="minRating" value="3"> <span>3 ★ & above</span></label>
                        <label class="filter-radio"><input type="radio" name="minRating" value="2"> <span>2 ★ & above</span></label>
                    </div>
                </div>
                
                <button type="submit" class="btn-primary" style="width: 100%; margin-top: 20px;">Apply Filters</button>
            </form>
        </aside>

        <main class="products-main">
            <div class="sort-bar">
                <div class="sort-bar__info">
                    <span class="sort-bar__title">Products</span>
                    <span class="sort-bar__count text-muted">- ${productList.size()} items</span>
                </div>
                <div class="sort-bar__actions">
                    <div class="sort-bar__sort">
                        <span class="text-muted">Sort by:</span>
                        <form action="<%=request.getContextPath()%>/products" method="get" style="display:inline;">
                            <select name="sort" class="sort-select" onchange="this.form.submit()">
                                <option value="recommended" ${selectedSort == 'recommended' ? 'selected' : ''}>Recommended</option>
                                <option value="price-low" ${selectedSort == 'price-low' ? 'selected' : ''}>Price: Low to High</option>
                                <option value="price-high" ${selectedSort == 'price-high' ? 'selected' : ''}>Price: High to Low</option>
                                <option value="rating" ${selectedSort == 'rating' ? 'selected' : ''}>Customer Rating</option>
                                <option value="newest" ${selectedSort == 'newest' ? 'selected' : ''}>What's New</option>
                            </select>
                        </form>
                    </div>
                </div>
            </div>

            <div class="product-grid" id="productGrid">
                <c:forEach var="p" items="${productList}">
                    <div class="product-card">
                        <a href="<%=request.getContextPath()%>/productdetails?id=${p.id}" class="product-card__link">
                            <div class="product-card__img-wrap">
                                <div class="product-card__img">
                                    <c:choose>
                                        <c:when test="${p.imageUrl.startsWith('http')}">
                                            <img src="${p.imageUrl}" alt="${p.name}">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="<%=request.getContextPath()%>${p.imageUrl}" alt="${p.name}">
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </a>
                        
                        <c:set var="isInWishlist" value="false" />
                        <c:forEach var="wid" items="${wishlistIds}">
                            <c:if test="${wid == p.id}">
                                <c:set var="isInWishlist" value="true" />
                            </c:if>
                        </c:forEach>
                        
                        <a href="<%=request.getContextPath()%>/wishlist?action=toggle&id=${p.id}" 
                           class="product-card__wishlist" 
                           style="top: 15px; right: 15px; text-decoration: none; color: ${isInWishlist ? '#ff3f6c' : '#333'};">
                            ${isInWishlist ? '❤' : '♡'}
                        </a>

                        <div class="product-card__info" style="padding: 10px;">
                            <a href="<%=request.getContextPath()%>/productdetails?id=${p.id}" style="text-decoration:none; color:inherit;">
                                <h3 class="product-card__brand">${p.brand}</h3>
                                <p class="product-card__name">${p.name}</p>
                                <div class="product-card__price">
                                    <span class="price-current">₹${p.price}</span>
                                    <c:if test="${p.mrp > p.price}">
                                        <span class="price-original">₹${p.mrp}</span>
                                    </c:if>
                                </div>
                            </a>
                            
                            <div class="product-card__actions" style="margin-top: 10px;">
                                <form action="<%=request.getContextPath()%>/addtocart" method="post">
                                    <input type="hidden" name="productId" value="${p.id}">
                                    <input type="hidden" name="quantity" value="1">
                                    <input type="hidden" name="size" value="M">
                                    <button type="submit" class="btn-primary btn-block">Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </main>
    </div>
</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>
</html>