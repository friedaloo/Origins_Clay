<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Reports" />
</jsp:include>

<h1 class="page-title"><em>Reports &</em> <strong>Analytics</strong></h1>
<p class="page-subtitle">Sales data, stock levels, and business insights</p>

<!-- ====== REVENUE & ORDER SUMMARY ====== -->
<div class="grid-4" style="margin-bottom: 2rem;">
    <div class="card" style="text-align: center; padding: 1.8rem; border-left: 4px solid #2d6a4f;">
        <div style="font-family: var(--font-serif); font-size: 2rem; font-weight: 600; color: #2d6a4f;">$${totalRevenue}</div>
        <div style="font-size: 0.58rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); margin-top: 0.3rem;">Total Revenue</div>
    </div>
    <div class="card" style="text-align: center; padding: 1.8rem; border-left: 4px solid #8a7040;">
        <div style="font-family: var(--font-serif); font-size: 2rem; font-weight: 600; color: #8a7040;">${totalOrders}</div>
        <div style="font-size: 0.58rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); margin-top: 0.3rem;">Total Orders</div>
    </div>
    <div class="card" style="text-align: center; padding: 1.8rem; border-left: 4px solid var(--clay-olive);">
        <div style="font-family: var(--font-serif); font-size: 2rem; font-weight: 600; color: var(--clay-olive);">${totalProducts}</div>
        <div style="font-size: 0.58rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); margin-top: 0.3rem;">Products</div>
    </div>
    <div class="card" style="text-align: center; padding: 1.8rem; border-left: 4px solid var(--clay-brown);">
        <div style="font-family: var(--font-serif); font-size: 2rem; font-weight: 600; color: var(--clay-brown);">${totalUsers}</div>
        <div style="font-size: 0.58rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); margin-top: 0.3rem;">Customers</div>
    </div>
</div>

<!-- ====== ORDER STATUS BREAKDOWN ====== -->
<div style="display: flex; flex-wrap: wrap; gap: 2rem; margin-bottom: 2rem;">
    <div class="card" style="flex: 1; min-width: 300px;">
        <h3 style="font-size: 0.62rem; font-weight: 600; letter-spacing: 0.18em; text-transform: uppercase; color: var(--clay-muted); margin-bottom: 1.2rem;">
            Order Status Breakdown
        </h3>
        <table>
            <tr>
                <td><span class="status-badge status-pending">Pending</span></td>
                <td style="font-weight: 600; text-align: right;">${pendingOrders}</td>
            </tr>
            <tr>
                <td><span class="status-badge status-processing">Processing</span></td>
                <td style="font-weight: 600; text-align: right;">${processingOrders}</td>
            </tr>
            <tr>
                <td><span class="status-badge status-shipped">Shipped</span></td>
                <td style="font-weight: 600; text-align: right;">${shippedOrders}</td>
            </tr>
            <tr>
                <td><span class="status-badge status-delivered">Delivered</span></td>
                <td style="font-weight: 600; text-align: right;">${deliveredOrders}</td>
            </tr>
            <tr>
                <td><span class="status-badge status-cancelled">Cancelled</span></td>
                <td style="font-weight: 600; text-align: right;">${cancelledOrders}</td>
            </tr>
            <tr>
                <td><span class="status-badge status-returned">Returned</span></td>
                <td style="font-weight: 600; text-align: right;">${returnedOrders}</td>
            </tr>
        </table>
    </div>

    <!-- Stock Availability -->
    <div class="card" style="flex: 2; min-width: 300px;">
        <h3 style="font-size: 0.62rem; font-weight: 600; letter-spacing: 0.18em; text-transform: uppercase; color: var(--clay-muted); margin-bottom: 1.2rem;">
            Product Stock Levels
        </h3>
        <table>
            <thead>
                <tr>
                    <th>Product</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Stock</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${allProducts}">
                    <tr>
                        <td><strong>${product.name}</strong></td>
                        <td>${product.categoryName}</td>
                        <td>$${product.price}</td>
                        <td>
                            <c:choose>
                                <c:when test="${product.stockQuantity <= 5}">
                                    <span style="color: var(--clay-danger); font-weight: 600;">${product.stockQuantity}</span>
                                </c:when>
                                <c:otherwise>${product.stockQuantity}</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${product.stockQuantity == 0}">
                                    <span class="status-badge status-cancelled">Out of Stock</span>
                                </c:when>
                                <c:when test="${product.stockQuantity <= 5}">
                                    <span class="status-badge status-pending">Low Stock</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status-badge status-delivered">In Stock</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
