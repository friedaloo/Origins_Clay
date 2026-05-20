<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Reports & Analytics" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - Origins Clay</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminstle/admin_styles.css">
</head>
<body>

    <jsp:include page="/WEB-INF/components/admin-sidebar.jsp" />

    <div class="content-wrapper">
        
        <div class="page-header">
            <h2>Sales & Inventory Reports</h2>
            <form action="${pageContext.request.contextPath}/admin/reports" method="post" style="display:inline;">
                <input type="hidden" name="action" value="generateCsvReport">
                <button type="submit" class="btn">Download CSV Report</button>
            </form>
        </div>

        <div class="cards">
            <div class="card">
                <small>Total Revenue</small>
                <h2>$${totalRevenue}</h2>
            </div>
            <div class="card">
                <small>Total Orders</small>
                <h2>${totalOrders}</h2>
            </div>
            <div class="card">
                <small>Total Products</small>
                <h2>${totalProducts}</h2>
            </div>
            <div class="card">
                <small>Total Users</small>
                <h2>${totalUsers}</h2>
            </div>
        </div>

        <div class="section-title">Order Status Distribution</div>
        <div class="activity">
            <div class="activity-item"><span>Pending:</span> <span>${pendingOrders}</span></div>
            <div class="activity-item"><span>Processing:</span> <span>${processingOrders}</span></div>
            <div class="activity-item"><span>Shipped:</span> <span>${shippedOrders}</span></div>
            <div class="activity-item"><span>Delivered:</span> <span>${deliveredOrders}</span></div>
        </div>

        <div class="section-title">Inventory Health</div>
        <table>
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Stock</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${allProducts}">
                    <tr>
                        <td>${p.name}</td>
                        <td>${p.stockQuantity}</td>
                        <td>
                            <c:choose>
                                <c:when test="${p.stockQuantity <= 0}"><span class="status-badge status-cancelled">Out of Stock</span></c:when>
                                <c:when test="${p.stockQuantity < 10}"><span class="status-badge status-pending">Low Stock</span></c:when>
                                <c:otherwise><span class="status-badge status-delivered">In Stock</span></c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </div>

</body>
</html>

<jsp:include page="/WEB-INF/components/footer.jsp" />
