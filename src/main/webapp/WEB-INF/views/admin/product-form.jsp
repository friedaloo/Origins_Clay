<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="${formAction == 'edit' ? 'Edit Product' : 'Add Product'}" />
</jsp:include>

<h1 class="page-title">
    <c:choose>
        <c:when test="${formAction == 'edit'}"><em>Edit</em> <strong>Product</strong></c:when>
        <c:otherwise><em>Add</em> <strong>Product</strong></c:otherwise>
    </c:choose>
</h1>
<p class="page-subtitle">${formAction == 'edit' ? 'Update product details' : 'Add a new item to the catalogue'}</p>

<c:if test="${not empty error}">
    <div class="alert alert-error">${error}</div>
</c:if>

<div class="card" style="max-width: 650px;">
    <form action="${pageContext.request.contextPath}/admin/product/${formAction}" method="post">
        <c:if test="${formAction == 'edit'}">
            <input type="hidden" name="id" value="${product.productId}">
        </c:if>

        <div class="field">
            <label for="name">Product Name</label>
            <input type="text" id="name" name="name" value="${product.name}" placeholder="e.g. Terracotta Vase" required>
        </div>

        <div class="field">
            <label for="sku">SKU</label>
            <input type="text" id="sku" name="sku" value="${product.sku}" placeholder="e.g. TC-VASE-001">
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
                    <option value="${cat.categoryId}" ${product.categoryId == cat.categoryId ? 'selected' : ''}>${cat.categoryName}</option>
                </c:forEach>
            </select>
        </div>

        <div class="field">
            <label for="imageUrl">Image URL / Path</label>
            <input type="text" id="imageUrl" name="imageUrl" value="${product.imageUrl}" placeholder="images/products/item.jpg">
        </div>

        <div class="field">
            <label for="status">Status</label>
            <select id="status" name="status">
                <option value="active" ${product.status == 'active' ? 'selected' : ''}>Active</option>
                <option value="inactive" ${product.status == 'inactive' ? 'selected' : ''}>Inactive</option>
            </select>
        </div>

        <div style="display: flex; gap: 0.8rem;">
            <button type="submit" class="btn btn-primary">
                ${formAction == 'edit' ? 'Update Product' : 'Add Product'}
            </button>
            <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
