<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Admin Dashboard" />
</jsp:include>

<h1 class="page-title"><em>Admin</em> <strong>Dashboard</strong></h1>
<p class="page-subtitle">Overview of your pottery shop</p>

<!-- ====== STATS CARDS ====== -->
<div class="grid-4" style="margin-bottom: 2rem;">
    <div class="card" style="text-align: center; padding: 2rem; border-left: 4px solid var(--clay-olive);">
        <div style="font-family: var(--font-serif); font-size: 2.4rem; font-weight: 600; color: var(--clay-olive);">${totalProducts}</div>
        <div style="font-size: 0.6rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); margin-top: 0.3rem;">Products</div>
    </div>
    <div class="card" style="text-align: center; padding: 2rem; border-left: 4px solid #8a7040;">
        <div style="font-family: var(--font-serif); font-size: 2.4rem; font-weight: 600; color: #8a7040;">${totalOrders}</div>
        <div style="font-size: 0.6rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); margin-top: 0.3rem;">Orders</div>
    </div>
    <div class="card" style="text-align: center; padding: 2rem; border-left: 4px solid #2d6a4f;">
        <div style="font-family: var(--font-serif); font-size: 2.4rem; font-weight: 600; color: #2d6a4f;">$${totalRevenue}</div>
        <div style="font-size: 0.6rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); margin-top: 0.3rem;">Revenue</div>
    </div>
    <div class="card" style="text-align: center; padding: 2rem; border-left: 4px solid var(--clay-brown);">
        <div style="font-family: var(--font-serif); font-size: 2.4rem; font-weight: 600; color: var(--clay-brown);">${totalUsers}</div>
        <div style="font-size: 0.6rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); margin-top: 0.3rem;">Users</div>
    </div>
</div>

<!-- ====== QUICK LINKS ====== -->
<div class="grid-3">
    <div class="card" style="text-align: center; padding: 2.5rem;">
        <i class="fa-solid fa-boxes-stacked" style="font-size: 2rem; color: var(--clay-olive); margin-bottom: 1rem;"></i>
        <h3 style="font-family: var(--font-serif); font-size: 1.2rem; margin-bottom: 0.5rem;">Manage Products</h3>
        <p style="font-size: 0.78rem; color: var(--clay-muted); margin-bottom: 1.2rem;">Add, edit, or remove products from the catalogue.</p>
        <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-primary btn-sm">Manage</a>
    </div>
    <div class="card" style="text-align: center; padding: 2.5rem;">
        <i class="fa-solid fa-truck" style="font-size: 2rem; color: #8a7040; margin-bottom: 1rem;"></i>
        <h3 style="font-family: var(--font-serif); font-size: 1.2rem; margin-bottom: 0.5rem;">Manage Orders</h3>
        <p style="font-size: 0.78rem; color: var(--clay-muted); margin-bottom: 1.2rem;">
            View and update order statuses.
            <c:if test="${pendingOrders > 0}">
                <br><strong style="color: var(--clay-danger);">${pendingOrders} pending</strong>
            </c:if>
        </p>
        <a href="${pageContext.request.contextPath}/admin/orders" class="btn btn-primary btn-sm">Manage</a>
    </div>
    <div class="card" style="text-align: center; padding: 2.5rem;">
        <i class="fa-solid fa-users" style="font-size: 2rem; color: var(--clay-brown); margin-bottom: 1rem;"></i>
        <h3 style="font-family: var(--font-serif); font-size: 1.2rem; margin-bottom: 0.5rem;">Manage Users</h3>
        <p style="font-size: 0.78rem; color: var(--clay-muted); margin-bottom: 1.2rem;">Approve or manage customer accounts.</p>
        <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-primary btn-sm">Manage</a>
    </div>
</div>

<div style="margin-top: 1.5rem;">
    <div class="card" style="text-align: center; padding: 2.5rem;">
        <i class="fa-solid fa-chart-line" style="font-size: 2rem; color: #2d6a4f; margin-bottom: 1rem;"></i>
        <h3 style="font-family: var(--font-serif); font-size: 1.2rem; margin-bottom: 0.5rem;">Reports & Analytics</h3>
        <p style="font-size: 0.78rem; color: var(--clay-muted); margin-bottom: 1.2rem;">View sales data, stock levels, and business insights.</p>
        <a href="${pageContext.request.contextPath}/admin/reports" class="btn btn-primary btn-sm">View Reports</a>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
