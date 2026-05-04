<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="My Orders" />
</jsp:include>

<h1 class="page-title"><em>My</em> <strong>Orders</strong></h1>
<p class="page-subtitle">Track your purchases</p>

<c:if test="${not empty success}">
    <div class="alert alert-success">${success}</div>
</c:if>

<div class="card">
    <c:choose>
        <c:when test="${not empty orders}">
            <table>
                <thead>
                    <tr>
                        <th>Order #</th>
                        <th>Date</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td><strong>#${order.orderId}</strong></td>
                            <td>${order.orderDate}</td>
                            <td>$${order.totalAmount}</td>
                            <td>
                                <span class="status-badge status-${order.orderStatus}">${order.orderStatus}</span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/account/order-details?id=${order.orderId}" class="btn btn-secondary btn-sm">View</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p style="text-align: center; color: var(--clay-muted); padding: 3rem;">
                <i class="fa-solid fa-box-open" style="font-size: 2rem; display: block; margin-bottom: 1rem;"></i>
                You haven't placed any orders yet.
                <br><br>
                <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Start Shopping</a>
            </p>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
