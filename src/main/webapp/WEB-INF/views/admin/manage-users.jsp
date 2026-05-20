<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Manage Users" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Origins Clay</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin_styles.css">
</head>
<body>

    <jsp:include page="/WEB-INF/components/admin-sidebar.jsp" />

    <main class="content-wrapper">
        <div class="page-header">
            <h2>User Management</h2>
        </div>

        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty users}">
                            <c:forEach var="u" items="${users}">
                                <tr class="${!u.status ? 'row-pending' : ''}">
                                    <td>${u.id}</td>
                                    <td>${u.username}</td>
                                    <td>${u.fullName}</td>
                                    <td>${u.email}</td>
                                    <td>${u.role}</td>
                                    <td>${u.status ? 'Active' : 'Pending'}</td>
                                    <td>
                                        <c:if test="${!u.status}">
                                            <form action="${pageContext.request.contextPath}/admin/user/approve" method="post" style="display:inline;">
                                                <input type="hidden" name="id" value="${u.id}">
                                                <button type="submit" class="action-btn">Activate</button>
                                            </form>
                                        </c:if>
                                        <c:if test="${u.status}">
                                            <form action="${pageContext.request.contextPath}/admin/user/reject" method="post" style="display:inline;">
                                                <input type="hidden" name="id" value="${u.id}">
                                                <button type="submit" class="action-btn">Deactivate</button>
                                            </form>
                                        </c:if>
                                        <form action="${pageContext.request.contextPath}/admin/user/delete" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this user?')">
                                            <input type="hidden" name="id" value="${u.id}">
                                            <button type="submit" class="action-btn">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr><td colspan="7" style="text-align:center; color:var(--clay-muted); padding:1rem;">No users found.</td></tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </main>

</body>
</html>

<jsp:include page="/WEB-INF/components/footer.jsp" />
