<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - FashionStore</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/login.css">
</head>

<body>

<div class="auth-page">
    <!-- Left: Illustration -->
    <div class="auth-left">
        <div class="auth-left__content">
            <h1>Fashion<span>Store</span></h1>
            <p>India's Favourite Fashion Destination</p>
            <div class="auth-left__features">
                <div class="auth-feature">✨ Trending Styles</div>
                <div class="auth-feature">🚚 Free Delivery</div>
                <div class="auth-feature">🔄 Easy Returns</div>
                <div class="auth-feature">💯 Genuine Products</div>
            </div>
        </div>
    </div>

    <!-- Right: Form -->
    <div class="auth-right">
        <div class="auth-box">
            <h2>Login</h2>
            <p class="auth-box__subtitle text-muted">Welcome back! Please login to continue.</p>

            <form action="${pageContext.request.contextPath}/login" method="post" class="auth-form">
                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <input type="email" name="email" class="form-input" placeholder="you@example.com" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-input" placeholder="Enter password" required>
                </div>
                <div class="auth-form__options">
                    <label class="auth-remember"><input type="checkbox"> Remember me</label>
                    <a href="#" class="text-accent">Forgot Password?</a>
                </div>
                <button type="submit" class="btn-primary btn-block">Login</button>
            </form>

            <% if (request.getParameter("error") != null) { %>
                <p class="auth-error">❌ Invalid email or password!</p>
            <% } %>

            <div class="auth-divider"><span>OR</span></div>

            <p class="auth-switch">
                New to FashionStore?
                <a href="<%=request.getContextPath()%>/register" class="text-accent text-bold">Create Account</a>
            </p>
        </div>
    </div>
</div>

</body>
</html>
