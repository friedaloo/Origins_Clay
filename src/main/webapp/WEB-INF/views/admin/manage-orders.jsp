<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Manage Orders" />
</jsp:include>

<h1 class="page-title"><em>Manage</em> <strong>Orders</strong></h1>
<p class="page-subtitle">View and update order statuses</p>

<div class="card">
    <c:choose>
        <c:when test="${not empty orders}">
            <table>
                <thead>
                    <tr>
                        <th>Order #</th>
                        <th>Customer</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Update Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td><strong>#${order.orderId}</strong></td>
                            <td>${order.shippingName}</td>
                            <td>$${order.totalAmount}</td>
                            <td><span class="status-badge status-${order.orderStatus}">${order.orderStatus}</span></td>
                            <td>${order.orderDate}</td>
                            <td>
                                <form action="${pageContext.request.contextPath}/admin/order/update-status" method="post"
                                      style="display: flex; gap: 0.4rem; align-items: center;">
                                    <input type="hidden" name="orderId" value="${order.orderId}">
                                    <select name="status" style="padding: 0.4rem; font-size: 0.78rem; background: var(--clay-input); border: none;">
                                        <option value="pending"    ${order.orderStatus == 'pending'    ? 'selected' : ''}>Pending</option>
                                        <option value="processing" ${order.orderStatus == 'processing' ? 'selected' : ''}>Processing</option>
                                        <option value="shipped"    ${order.orderStatus == 'shipped'    ? 'selected' : ''}>Shipped</option>
                                        <option value="delivered"  ${order.orderStatus == 'delivered'  ? 'selected' : ''}>Delivered</option>
                                        <option value="cancelled"  ${order.orderStatus == 'cancelled'  ? 'selected' : ''}>Cancelled</option>
                                        <option value="returned"   ${order.orderStatus == 'returned'   ? 'selected' : ''}>Returned</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary btn-sm" style="padding: 0.4rem 0.7rem;">
                                        <i class="fa-solid fa-arrows-rotate"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p style="text-align: center; color: var(--clay-muted); padding: 3rem;">No orders found.</p>
        </c:otherwise>
    </c:choose>
</div>

<!-- ====== SINGLE ORDER VIEW (when ?id= is used) ====== -->
<c:if test="${not empty order}">
    <div class="card" style="margin-top: 1.5rem;">
        <h2 style="font-family: var(--font-serif); font-size: 1.4rem; margin-bottom: 1rem;">
            Order #${order.orderId} — ${order.shippingName}
        </h2>
        <table>
            <thead>
                <tr><th>Product</th><th>Price</th><th>Qty</th><th>Subtotal</th></tr>
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
        <div style="margin-top: 1rem; font-size: 0.88rem;">
            <strong>Total:</strong> $${order.totalAmount} |
            <strong>Status:</strong> <span class="status-badge status-${order.orderStatus}">${order.orderStatus}</span> |
            <strong>Shipping:</strong> ${order.shippingAddress}, ${order.shippingCity}
        </div>
    </div>
</c:if>

<jsp:include page="/WEB-INF/components/footer.jsp" />
