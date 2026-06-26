<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - FashionStore</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
    <style>
        .profile-container { padding: 40px 0; }
        .profile-card { max-width: 600px; margin: 0 auto; background: white; border: 1px solid #ddd; padding: 30px; border-radius: 8px; }
        .profile-header { display: flex; align-items: center; gap: 20px; margin-bottom: 30px; }
        .profile-avatar { width: 80px; height: 80px; background: var(--primary); color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 32px; font-weight: bold; }
        .profile-detail { margin-bottom: 20px; }
        .profile-detail label { display: block; color: #7e818c; font-size: 14px; margin-bottom: 5px; }
        .profile-detail span { font-size: 18px; color: #282c3f; }
        .profile-actions { margin-top: 30px; display: flex; gap: 15px; }
    </style>
</head>

<body>

<jsp:include page="/WEB-INF/views/partials/navbar.jsp" />

<div class="container profile-container">
    <div class="profile-card">
        <div class="profile-header">
            <div class="profile-avatar">${user.name.substring(0,1).toUpperCase()}</div>
            <div>
                <h2>${user.name}</h2>
                <p class="text-muted">Member since April 2026</p>
            </div>
        </div>

        <div class="profile-detail">
            <label>Full Name</label>
            <span>${user.name}</span>
        </div>

        <div class="profile-detail">
            <label>Email Address</label>
            <span>${user.email}</span>
        </div>

        <div class="profile-detail">
            <label>Mobile Number</label>
            <span>${user.phone != null ? user.phone : 'Not provided'}</span>
        </div>

        <div class="profile-actions">
            <button class="btn-primary">Edit Profile</button>
            <a href="<%=request.getContextPath()%>/logout" class="btn-secondary" style="text-decoration: none; text-align: center;">Logout</a>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/partials/footer.jsp" />

</body>
</html>
