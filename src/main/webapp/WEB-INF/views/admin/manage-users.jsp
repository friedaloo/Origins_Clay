<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Manage Users" />
</jsp:include>

<h1 class="page-title"><em>Manage</em> <strong>Users</strong></h1>
<p class="page-subtitle">Approve, reject, or manage user accounts</p>

<div class="card">
    <c:choose>
        <c:when test="${not empty users}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Joined</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${users}">
                        <tr>
                            <td>${u.id}</td>
                            <td><strong>${u.fullName}</strong></td>
                            <td>${u.email}</td>
                            <td>
                                <span style="font-size: 0.62rem; letter-spacing: 0.1em; text-transform: uppercase;
                                    color: ${u.role == 'admin' ? 'var(--clay-olive)' : 'var(--clay-muted)'};">${u.role}</span>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${u.approved}">
                                        <span class="status-badge status-delivered">Approved</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="status-badge status-pending">Pending</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${u.createdAt}</td>
                            <td>
                                <div style="display: flex; gap: 0.3rem; flex-wrap: wrap;">
                                    <c:if test="${!u.approved}">
                                        <form action="${pageContext.request.contextPath}/admin/user/approve" method="post" style="display:inline;">
                                            <input type="hidden" name="id" value="${u.id}">
                                            <button type="submit" class="btn btn-primary btn-sm" title="Approve">
                                                <i class="fa-solid fa-check"></i>
                                            </button>
                                        </form>
                                    </c:if>
                                    <c:if test="${u.approved && u.role != 'admin'}">
                                        <form action="${pageContext.request.contextPath}/admin/user/reject" method="post" style="display:inline;">
                                            <input type="hidden" name="id" value="${u.id}">
                                            <button type="submit" class="btn btn-secondary btn-sm" title="Revoke Approval">
                                                <i class="fa-solid fa-ban"></i>
                                            </button>
                                        </form>
                                    </c:if>
                                    <c:if test="${u.role != 'admin'}">
                                        <form action="${pageContext.request.contextPath}/admin/user/delete" method="post"
                                              onsubmit="return confirm('Delete this user?');" style="display:inline;">
                                            <input type="hidden" name="id" value="${u.id}">
                                            <button type="submit" class="btn btn-danger btn-sm" title="Delete">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>
                                        </form>
                                    </c:if>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p style="text-align: center; color: var(--clay-muted); padding: 3rem;">No users found.</p>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
