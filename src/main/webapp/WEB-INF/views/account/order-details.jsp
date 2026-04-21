<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Order Details" />
</jsp:include>

<h1 class="page-title"><em>Order</em> <strong>#${order.id}</strong></h1>
<p class="page-subtitle">Placed on ${order.createdAt}</p>

<div style="display: flex; flex-wrap: wrap; gap: 2rem;">
    <!-- Order Items -->
    <div style="flex: 2; min-width: 300px;">
        <div class="card">
            <h3 style="font-size: 0.62rem; font-weight: 600; letter-spacing: 0.18em; text-transform: uppercase; color: var(--clay-muted); margin-bottom: 1rem;">Items Ordered</h3>
            <table>
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${order.items}">
                        <tr>
                            <td>${item.productName}</td>
                            <td>$${item.unitPrice}</td>
                            <td>${item.quantity}</td>
                            <td>$${item.subtotal}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Order Summary -->
    <div style="flex: 1; min-width: 250px;">
        <div class="card">
            <h3 style="font-size: 0.62rem; font-weight: 600; letter-spacing: 0.18em; text-transform: uppercase; color: var(--clay-muted); margin-bottom: 1rem;">Summary</h3>
            <table>
                <tr><th>Status</th><td><span class="status-badge status-${order.status}">${order.status}</span></td></tr>
                <tr><th>Total</th><td style="font-size: 1.2rem; font-weight: 600; color: var(--clay-olive);">$${order.totalAmount}</td></tr>
                <tr><th>Shipping</th><td>${order.shippingAddress}</td></tr>
            </table>
        </div>
        <a href="${pageContext.request.contextPath}/account/orders" class="btn btn-secondary" style="width: 100%; text-align: center;">
            <i class="fa-solid fa-arrow-left"></i> Back to Orders
        </a>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
