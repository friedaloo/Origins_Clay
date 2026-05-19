<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="${formAction == 'edit' ? 'Edit Product' : 'Add Product'}" />
</jsp:include>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${formAction == 'edit' ? 'Edit Product' : 'Add Product'} - Origins Clay</title>
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
            <li><a href="${pageContext.request.contextPath}/admin/products">Manage Products</a></li>
        </ul>
    </aside>

    <main class="content-wrapper">
        <div class="page-header">
            <h2>${formAction == 'edit' ? 'Edit Product' : 'Add Product'}</h2>
        </div>

        <div class="card" style="max-width: 750px;">
            <form action="${pageContext.request.contextPath}/admin/product/${formAction}" method="post">
                <c:if test="${formAction == 'edit'}">
                    <input type="hidden" name="id" value="${product.id}">
                </c:if>

                <div class="field">
                    <label for="name">Product Name</label>
                    <input type="text" id="name" name="name" value="${product.name}" placeholder="e.g. Terracotta Vase" required>
                </div>

                <div class="field">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" placeholder="Describe the product...">${product.description}</textarea>
                </div>

                <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
                    <div class="field" style="flex: 1; min-width: 150px;">
                        <label for="price">Price ($)</label>
                        <input type="number" id="price" name="price" value="${product.price}" step="0.01" min="0" required>
                    </div>
                    <div class="field" style="flex: 1; min-width: 150px;">
                        <label for="stockQuantity">Stock Quantity</label>
                        <input type="number" id="stockQuantity" name="stockQuantity" value="${product.stockQuantity}" min="0" required>
                    </div>
                </div>

                <div class="field">
                    <label for="categoryId">Category</label>
                    <select id="categoryId" name="categoryId" required>
                        <option value="">— Select Category —</option>
                        <c:forEach var="cat" items="${categories}">
                            <option value="${cat.id}" ${product.categoryId == cat.id ? 'selected' : ''}>${cat.name}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="field">
                    <label for="imageUrl">Image URL / Path</label>
                    <input type="text" id="imageUrl" name="imageUrl" value="${product.imageUrl}" placeholder="images/products/item.jpg">
                </div>

                <div style="margin-bottom: 1.2rem;">
                    <label style="display: flex; align-items: center; gap: 0.6rem; cursor: pointer; font-size: 0.75rem; color: var(--clay-brown);">
                        <input type="checkbox" name="featured" ${product.featured ? 'checked' : ''} style="width: 16px; height: 16px;">
                        Mark as Featured Product
                    </label>
                </div>

                <div style="display: flex; gap: 0.8rem;">
                    <button type="submit" class="btn btn-primary">${formAction == 'edit' ? 'Update Product' : 'Add Product'}</button>
                    <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </main>

</body>
</html>

<jsp:include page="/WEB-INF/components/footer.jsp" />
