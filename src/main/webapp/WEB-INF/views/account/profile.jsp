<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="My Profile" />
</jsp:include>

<h1 class="page-title"><em>My</em> <strong>Profile</strong></h1>
<p class="page-subtitle">Your account details</p>

<c:if test="${not empty success}">
    <div class="alert alert-success">${success}</div>
</c:if>
<c:if test="${not empty error}">
    <div class="alert alert-error">${error}</div>
</c:if>

<div style="display: flex; flex-wrap: wrap; gap: 2rem;">
    <!-- Profile Info -->
    <div style="flex: 2; min-width: 300px;">
        <div class="card">
            <div style="display: flex; align-items: center; gap: 1.5rem; margin-bottom: 2rem;">
                <div style="width: 100px; height: 100px; overflow: hidden; border: 1px solid var(--clay-border);">
                    <img src="${pageContext.request.contextPath}/account/profile-image" 
                         alt="Profile Picture" 
                         style="width: 100%; height: 100%; object-fit: cover;">
                </div>
                <div>
                    <h2 style="font-family: var(--font-serif); font-size: 1.5rem;">${user.fullName}</h2>
                    <div style="font-size: 0.8rem; color: var(--clay-muted); margin-bottom: 4px;">@${user.username}</div>
                    <span style="font-size: 0.62rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted);">${user.role} · ${user.status ? 'Active' : 'Pending'}</span>
                </div>
            </div>

            <table>
                <tr><th style="width: 140px;">Email</th><td>${user.email}</td></tr>
                <tr><th>Phone</th><td>${not empty user.phone ? user.phone : '—'}</td></tr>
                <tr><th>Address</th><td>${not empty user.address ? user.address : '—'}</td></tr>
            </table>
        </div>
    </div>

    <!-- Quick Actions -->
    <div style="flex: 1; min-width: 220px;">
        <div class="card">
            <h3 style="font-size: 0.62rem; font-weight: 600; letter-spacing: 0.18em; text-transform: uppercase; color: var(--clay-muted); margin-bottom: 1.2rem;">Quick Actions</h3>
            <div style="display: flex; flex-direction: column; gap: 0.6rem;">
                <a href="${pageContext.request.contextPath}/account/edit-profile" class="btn btn-secondary" style="text-align: center;">
                    <i class="fa-solid fa-pen"></i> Edit Profile
                </a>
                <a href="${pageContext.request.contextPath}/account/change-password" class="btn btn-secondary" style="text-align: center;">
                    <i class="fa-solid fa-lock"></i> Change Password
                </a>
                <a href="${pageContext.request.contextPath}/account/orders" class="btn btn-secondary" style="text-align: center;">
                    <i class="fa-solid fa-box"></i> My Orders
                </a>
                <a href="${pageContext.request.contextPath}/wishlist" class="btn btn-secondary" style="text-align: center;">
                    <i class="fa-regular fa-heart"></i> Wishlist
                </a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
