<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Shop" />
</jsp:include>

<h1 class="page-title"><em>Our</em> <strong>Collection</strong></h1>
<p class="page-subtitle">Browse handcrafted pottery for every occasion</p>

<!-- ====== SEARCH & FILTER BAR ====== -->
<div class="card" style="display: flex; flex-wrap: wrap; gap: 1rem; align-items: flex-end; padding: 1.2rem 1.5rem;">
    <form action="${pageContext.request.contextPath}/products" method="get" style="display: flex; flex-wrap: wrap; gap: 1rem; flex: 1; align-items: flex-end;">
        <div class="field" style="margin-bottom: 0; flex: 1; min-width: 200px;">
            <label for="search">Search</label>
            <input type="text" id="search" name="search" placeholder="Search pottery..." value="${searchKeyword}">
        </div>
        <div class="field" style="margin-bottom: 0; min-width: 160px;">
            <label for="category">Category</label>
            <select id="category" name="category">
                <option value="">All Categories</option>
                <c:forEach var="cat" items="${categories}">
                    <option value="${cat.categoryId}" ${selectedCategory == cat.categoryId ? 'selected' : ''}>${cat.categoryName}</option>
                </c:forEach>
            </select>
        </div>
        <button type="submit" class="btn btn-primary btn-sm"><i class="fa-solid fa-magnifying-glass"></i> Search</button>
    </form>
</div>

<!-- ====== PRODUCT GRID ====== -->
<div class="grid-3" style="margin-top: 1.5rem;">
    <c:forEach var="product" items="${products}">
        <div class="product-card">
            <img src="${pageContext.request.contextPath}/${product.imageUrl}" 
                 alt="${product.name}"
                 onerror="this.style.background='#E5E2E0'; this.src='';">
            <div class="info">
                <span class="category-label">${product.categoryName}</span>
                <h3>${product.name}</h3>
                <p style="font-size: 0.78rem; color: var(--clay-muted); margin: 0.3rem 0; line-height: 1.5;">
                    ${product.description}
                </p>
                <div class="price">$${product.price}</div>
                <c:choose>
                    <c:when test="${product.stockQuantity > 0}">
                        <span style="font-size: 0.6rem; color: var(--clay-success);">IN STOCK (${product.stockQuantity})</span>
                    </c:when>
                    <c:otherwise>
                        <span style="font-size: 0.6rem; color: var(--clay-danger);">OUT OF STOCK</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="actions">
                <a href="${pageContext.request.contextPath}/product-details?id=${product.productId}" class="btn btn-secondary btn-sm">Details</a>
                <c:if test="${product.stockQuantity > 0}">
                    <form action="${pageContext.request.contextPath}/cart/add" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="${product.productId}">
                        <button type="submit" class="btn btn-primary btn-sm">Add to Cart</button>
                    </form>
                </c:if>
                <form action="${pageContext.request.contextPath}/wishlist/add" method="post" style="display:inline;">
                    <input type="hidden" name="productId" value="${product.productId}">
                    <button type="submit" class="btn btn-secondary btn-sm" title="Add to Wishlist"><i class="fa-regular fa-heart"></i></button>
                </form>
            </div>
        </div>
    </c:forEach>

    <c:if test="${empty products}">
        <p style="grid-column: 1/-1; text-align: center; color: var(--clay-muted); padding: 3rem;">
            No products found. Try a different search or category.
        </p>
    </c:if>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
