<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Edit Profile" />
</jsp:include>

<h1 class="page-title"><em>Edit</em> <strong>Profile</strong></h1>
<p class="page-subtitle">Update your personal information</p>

<c:if test="${not empty error}">
    <div class="alert alert-error">${error}</div>
</c:if>

<div class="card" style="max-width: 600px;">
    <form action="${pageContext.request.contextPath}/account/edit-profile" method="post">
        <div class="field">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" value="${user.username}">
        </div>

        <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
            <div class="field" style="flex: 1; min-width: 200px;">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" value="${user.firstName}" required>
            </div>
            <div class="field" style="flex: 1; min-width: 200px;">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" value="${user.lastName}" required>
            </div>
        </div>

        <div class="field">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="${user.email}" required>
        </div>

        <div class="field">
            <label for="phone">Phone</label>
            <input type="text" id="phone" name="phone" value="${user.phone}">
        </div>

        <div class="field">
            <label for="address">Address</label>
            <input type="text" id="address" name="address" value="${user.address}">
        </div>

        <div style="display: flex; gap: 0.8rem; margin-top: 0.5rem;">
            <button type="submit" class="btn btn-primary">Save Changes</button>
            <a href="${pageContext.request.contextPath}/account/profile" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
