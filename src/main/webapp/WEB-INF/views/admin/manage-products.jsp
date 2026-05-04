<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Manage Products" />
</jsp:include>

<div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 1rem; margin-bottom: 1.5rem;">
    <div>
        <h1 class="page-title"><em>Manage</em> <strong>Products</strong></h1>
        <p class="page-subtitle" style="margin-bottom: 0;">Add, edit, or remove products</p>
    </div>
    <a href="${pageContext.request.contextPath}/admin/product/add" class="btn btn-primary">
        <i class="fa-solid fa-plus"></i> Add Product
    </a>
</div>

<div class="card">
    <c:choose>
        <c:when test="${not empty products}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>SKU</th>
                        <th>Category</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.productId}</td>
                            <td>
                                <img src="${pageContext.request.contextPath}/${product.imageUrl}"
                                     alt="${product.name}"
                                     style="width: 45px; height: 45px; object-fit: cover; background: var(--clay-input);"
                                     onerror="this.style.background='#E5E2E0'; this.src='';">
                            </td>
                            <td><strong>${product.name}</strong></td>
                            <td>${product.sku}</td>
                            <td>${product.categoryName}</td>
                            <td>$${product.price}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${product.stockQuantity <= 5}">
                                        <span style="color: var(--clay-danger); font-weight: 600;">${product.stockQuantity}</span>
                                    </c:when>
                                    <c:otherwise>${product.stockQuantity}</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <span class="status-badge status-${product.status}">${product.status}</span>
                            </td>
                            <td>
                                <div style="display: flex; gap: 0.4rem;">
                                    <a href="${pageContext.request.contextPath}/admin/product/edit?id=${product.productId}" class="btn btn-secondary btn-sm">
                                        <i class="fa-solid fa-pen"></i>
                                    </a>
                                    <form action="${pageContext.request.contextPath}/admin/product/delete" method="post"
                                          onsubmit="return confirm('Delete this product?');">
                                        <input type="hidden" name="id" value="${product.productId}">
                                        <button type="submit" class="btn btn-danger btn-sm">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p style="text-align: center; color: var(--clay-muted); padding: 3rem;">No products found.</p>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
