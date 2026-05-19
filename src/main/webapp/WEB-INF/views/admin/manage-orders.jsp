<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Manage Orders" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Orders - Origins Clay</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminstle/admin_styles.css">
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <div class="sidebar-header">
        <h1>Origins Clay</h1>
        <small>Studio Admin</small>
    </div>
    
    <ul class="sidebar-menu">
        <li><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/orders" class="active">Manage Orders</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/users">Manage Users</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/products">Manage Products</a></li>
    </ul>
</div>

<!-- Main Content -->
<div class="content-wrapper">
    
    <div class="page-header">
        <h2>Inventory Management</h2>
        <a href="#" class="btn">Add Product</a>
    </div>

    <table>
        <thead>
            <tr>
                <th>Image</th>
                <th>Product Name</th>
                <th>Category</th>
                <th>Price</th>
                <th>Stock</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty orders}">
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td><img src="https://via.placeholder.com/40" alt="Product" class="img-thumb"></td>
                            <td>${order.customerName}</td>
                            <td>$${order.totalAmount}</td>
                            <td><span class="status-badge status-${order.status}">${order.status}</span></td>
                            <td>${order.createdAt}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/admin/order/update-status" method="post">
                                    <input type="hidden" name="orderId" value="${order.id}">
                                    <select name="status">
                                        <option value="pending" ${order.status == 'pending' ? 'selected' : ''}>Pending</option>
                                        <option value="processing" ${order.status == 'processing' ? 'selected' : ''}>Processing</option>
                                        <option value="shipped" ${order.status == 'shipped' ? 'selected' : ''}>Shipped</option>
                                        <option value="delivered" ${order.status == 'delivered' ? 'selected' : ''}>Delivered</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr><td colspan="6" style="text-align:center; color:var(--clay-muted); padding:1rem;">No orders found.</td></tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

</div>

</body>
</html>

<jsp:include page="/WEB-INF/components/footer.jsp" />
