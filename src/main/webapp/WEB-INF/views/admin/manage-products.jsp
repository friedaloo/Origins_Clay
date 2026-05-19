<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Manage Products" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Products - Origins Clay</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/adminstle/admin_styles.css">
</head>
<body>

    <aside class="sidebar">
        <div class="sidebar-header">
            <h1>Origins Clay</h1>
            <span>Studio Admin</span>
        </div>
        <ul class="sidebar-menu">
            <li><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/users">Manage Users</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/products" class="active">Manage Products</a></li>
        </ul>
    </aside>

    <main class="content-wrapper">
        <div class="page-header">
            <h2>Inventory Management</h2>
            <a href="${pageContext.request.contextPath}/admin/product/add" class="btn">Add Product</a>
        </div>

        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty products}">
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <td><img src="${pageContext.request.contextPath}/${product.imageUrl}" alt="Product" class="img-thumb"></td>
                                    <td>${product.name}</td>
                                    <td>${product.categoryName}</td>
                                    <td>$${product.price}</td>
                                    <td>${product.stockQuantity}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/product/edit?id=${product.id}" class="action-btn">Edit</a>
                                        <form action="${pageContext.request.contextPath}/admin/product/delete" method="post" style="display:inline;">
                                            <input type="hidden" name="id" value="${product.id}">
                                            <button type="submit" class="action-btn" onclick="return confirm('Are you sure you want to delete this item?')">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr><td colspan="6" style="text-align:center; color:var(--clay-muted); padding:1rem;">No products found.</td></tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </main>

</body>
</html>

<jsp:include page="/WEB-INF/components/footer.jsp" />
