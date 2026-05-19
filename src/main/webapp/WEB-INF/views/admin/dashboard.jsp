<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Admin Dashboard" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Origins Clay</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminstle/admin_styles.css">
</head>
<body>

    <div class="sidebar">
        <div class="sidebar-header">
            <h1>Origins Clay</h1>
            <small>Studio Admin</small>
        </div>
        
        <ul class="sidebar-menu">
            <li><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/orders">Manage Orders</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/users">Manage Users</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/products">Manage Products</a></li>
        </ul>
    </div>

    <div class="content-wrapper">
        
        <div class="page-header">
            <h2>Overview</h2>
            <a href="#" class="btn">Reports</a>
        </div>

        <div class="cards">
            <div class="card">
                <small>Monthly Revenue</small>
                <h2>$14,280</h2>
                <small>+12% from last month</small>
            </div>

            <div class="card">
                <small>Open Orders</small>
                <h2>42</h2>
                <small>8 awaiting glazing</small>
            </div>

            <div class="card dark">
                <small>Kiln Status</small>
                <h2>1240°C</h2>
                <small>Firing · Cone 6</small>
            </div>
        </div>

        <div class="section-title">Recent Activity</div>
        
        <div class="activity">
            <div class="activity-item">
                <span>New order received</span>
                <span>›</span>
            </div>
            <div class="activity-item">
                <span>Kiln reached peak temperature</span>
                <span>›</span>
            </div>
            <div class="activity-item">
                <span>Inventory updated</span>
                <span>›</span>
            </div>
            <div class="activity-item">
                <span>Shipping confirmation</span>
                <span>›</span>
            </div>
        </div>

    </div>

</body>
</html>

<jsp:include page="/WEB-INF/components/footer.jsp" />
