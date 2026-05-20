<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<div class="sidebar">
    <div class="sidebar-header">
        <h1>Origins Clay</h1>
        <small>Studio Admin</small>
    </div>
    
    <ul class="sidebar-menu">
        <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="${requestScope['javax.servlet.forward.servlet_path'] == '/admin/dashboard' ? 'active' : ''}">Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/orders" class="${requestScope['javax.servlet.forward.servlet_path'] == '/admin/orders' ? 'active' : ''}">Manage Orders</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/users" class="${requestScope['javax.servlet.forward.servlet_path'] == '/admin/users' ? 'active' : ''}">Manage Users</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/products" class="${requestScope['javax.servlet.forward.servlet_path'] == '/admin/products' ? 'active' : ''}">Manage Products</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/reports" class="${requestScope['javax.servlet.forward.servlet_path'] == '/admin/reports' ? 'active' : ''}">Reports</a></li>
    </ul>
</div>
