<%@ page contentType="text/html;charset=UTF-8" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Admin Dashboard - FashionStore</title>
            <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
            <style>
                .admin-container {
                    padding: 40px 0;
                }

                .admin-nav {
                    display: flex;
                    gap: 20px;
                    margin-bottom: 30px;
                    border-bottom: 1px solid #ddd;
                }

                .admin-nav a {
                    padding: 10px 20px;
                    text-decoration: none;
                    color: #333;
                }

                .admin-nav a.active {
                    border-bottom: 2px solid var(--primary);
                    font-weight: bold;
                }

                .admin-table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 20px;
                }

                .admin-table th,
                .admin-table td {
                    border: 1px solid #ddd;
                    padding: 12px;
                    text-align: left;
                }

                .admin-table th {
                    background: #f4f4f4;
                }

                .status-badge {
                    padding: 4px 8px;
                    border-radius: 4px;
                    font-size: 12px;
                }

                .status-ordered {
                    background: #e3f2fd;
                    color: #1976d2;
                }

                .status-delivered {
                    background: #e8f5e9;
                    color: #2e7d32;
                }
            </style>
        </head>

        <body>

            <jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

            <div class="container admin-container">
                <h2>Admin Dashboard</h2>

                <div class="admin-nav">
                    <a href="?view=products"
                        class="${param.view == 'products' || empty param.view ? 'active' : ''}">Products</a>
                    <a href="?view=orders" class="${param.view == 'orders' ? 'active' : ''}">Orders</a>
                </div>

                <!-- Products Table -->
                <c:if test="${param.view == 'products' || empty param.view}">
                    <section>
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <h3>Manage Products (${products.size()})</h3>
                            <button class="btn-primary">Add New Product</button>
                        </div>
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Image</th>
                                    <th>Brand</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Stock</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="p" items="${products}">
                                    <tr>
                                        <td>${p.id}</td>
                                        <td><img src="<%=request.getContextPath()%>${p.imageUrl}" width="40"></td>
                                        <td>${p.brand}</td>
                                        <td>${p.name}</td>
                                        <td>₹${p.price}</td>
                                        <td>In Stock</td>
                                        <td>
                                            <a href="#">Edit</a> |
                                            <a href="#" style="color:red;">Delete</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </section>
                </c:if>

                <!-- Orders Table -->
                <c:if test="${param.view == 'orders'}">
                    <section>
                        <h3>Manage Orders (${orders.size()})</h3>
                        <table class="admin-table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Date</th>
                                    <th>Total</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="o" items="${orders}">
                                    <tr>
                                        <td>#${o.id}</td>
                                        <td>${o.orderDate}</td>
                                        <td>₹${o.totalAmount}</td>
                                        <td><span
                                                class="status-badge status-${o.status.toLowerCase()}">${o.status}</span>
                                        </td>
                                        <td>
                                            <a href="<%=request.getContextPath()%>/order/details?id=${o.id}">View</a> |
                                            <a href="#">Update Status</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </section>
                </c:if>

            </div>

            <jsp:include page="/WEB-INF/views/partials/footer.jsp" />

        </body>

        </html>