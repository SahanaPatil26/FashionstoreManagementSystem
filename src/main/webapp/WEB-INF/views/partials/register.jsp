<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - FashionStore</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/register.css">
</head>

<body>

<div class="auth-page">
    <!-- Left: Illustration -->
    <div class="auth-left">
        <div class="auth-left__content">
            <h1>Fashion<span>Store</span></h1>
            <p>Join India's #1 Fashion Community</p>
            <div class="auth-left__features">
                <div class="auth-feature">🎁 Get ₹200 Off on First Order</div>
                <div class="auth-feature">📦 Track Your Orders</div>
                <div class="auth-feature">❤️ Save to Wishlist</div>
                <div class="auth-feature">⭐ Write Reviews</div>
            </div>
        </div>
    </div>

    <!-- Right: Form -->
    <div class="auth-right">
        <div class="auth-box">
            <h2>Create Account</h2>
            <p class="auth-box__subtitle text-muted">Sign up to start shopping!</p>

            <form action="${pageContext.request.contextPath}/register" method="post" class="auth-form">
                <div class="form-group">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="name" class="form-input" placeholder="Enter your name" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <input type="email" name="email" class="form-input" placeholder="you@example.com" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-input" placeholder="Min 6 characters" required minlength="6">
                </div>
                <div class="form-group">
                    <label class="form-label">Mobile (Optional)</label>
                    <input type="tel" name="mobile" class="form-input" placeholder="10-digit mobile" maxlength="10">
                </div>
                <p class="auth-terms text-muted">
                    By signing up, you agree to our <a href="#" class="text-accent">Terms</a> & <a href="#" class="text-accent">Privacy Policy</a>
                </p>
                <button type="submit" class="btn-primary btn-block">Create Account</button>
            </form>

            <% if (request.getParameter("error") != null) { %>
                <p class="auth-error">❌ Please fill all fields correctly!</p>
            <% } %>
            <% if (request.getParameter("success") != null) { %>
                <p class="auth-success">✅ Registration successful! Please login.</p>
            <% } %>

            <div class="auth-divider"><span>OR</span></div>

            <p class="auth-switch">
                Already have an account?
                <a href="<%=request.getContextPath()%>/login" class="text-accent text-bold">Login</a>
            </p>
        </div>
    </div>
</div>

</body>
</html>