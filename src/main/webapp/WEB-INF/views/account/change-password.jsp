<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Change Password" />
</jsp:include>

<h1 class="page-title"><em>Change</em> <strong>Password</strong></h1>
<p class="page-subtitle">Keep your account secure</p>

<c:if test="${not empty success}">
    <div class="alert alert-success">${success}</div>
</c:if>
<c:if test="${not empty error}">
    <div class="alert alert-error">${error}</div>
</c:if>

<div class="card" style="max-width: 480px;">
    <form action="${pageContext.request.contextPath}/account/change-password" method="post">
        <div class="field">
            <label for="currentPassword">Current Password</label>
            <input type="password" id="currentPassword" name="currentPassword" placeholder="••••••••" required>
        </div>

        <div class="field">
            <label for="newPassword">New Password</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="••••••••" required>
        </div>
        <p style="font-size: 0.6rem; color: var(--clay-muted); margin-top: -0.6rem; margin-bottom: 1rem;">
            Min 8 chars — uppercase, lowercase, digit & special character required
        </p>

        <div class="field">
            <label for="confirmPassword">Confirm New Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="••••••••" required>
        </div>

        <div style="display: flex; gap: 0.8rem; margin-top: 0.5rem;">
            <button type="submit" class="btn btn-primary">Update Password</button>
            <a href="${pageContext.request.contextPath}/account/profile" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
