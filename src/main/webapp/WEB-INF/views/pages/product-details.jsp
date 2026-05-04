<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="${product.name}" />
</jsp:include>

<div style="display: flex; flex-wrap: wrap; gap: 2.5rem; margin-top: 1rem;">

    <!-- Product Image -->
    <div style="flex: 1; min-width: 300px;">
        <img src="${pageContext.request.contextPath}/${product.imageUrl}" 
             alt="${product.name}"
             style="width: 100%; height: 420px; object-fit: cover; background: var(--clay-input);"
             onerror="this.style.background='#E5E2E0'; this.src='';">
    </div>

    <!-- Product Info -->
    <div style="flex: 1; min-width: 300px;">
        <span class="page-subtitle" style="margin-bottom: 0.5rem;">${product.categoryName}</span>
        <h1 class="page-title" style="margin-bottom: 0.5rem;">${product.name}</h1>
        <div style="font-size: 1.6rem; font-weight: 500; color: var(--clay-olive); margin-bottom: 1.2rem;">
            $${product.price}
        </div>

        <p style="font-size: 0.88rem; color: var(--clay-muted); line-height: 1.8; margin-bottom: 1.5rem;">
            ${product.description}
        </p>

        <div style="margin-bottom: 1.5rem;">
            <c:choose>
                <c:when test="${product.stockQuantity > 0}">
                    <span style="font-size: 0.68rem; letter-spacing: 0.1em; text-transform: uppercase; color: var(--clay-success);">
                        <i class="fa-solid fa-circle-check"></i> In Stock (${product.stockQuantity} available)
                    </span>
                </c:when>
                <c:otherwise>
                    <span style="font-size: 0.68rem; letter-spacing: 0.1em; text-transform: uppercase; color: var(--clay-danger);">
                        <i class="fa-solid fa-circle-xmark"></i> Out of Stock
                    </span>
                </c:otherwise>
            </c:choose>
        </div>

        <c:if test="${product.stockQuantity > 0}">
            <form action="${pageContext.request.contextPath}/cart/add" method="post" style="display: flex; gap: 0.8rem; align-items: center; margin-bottom: 1rem;">
                <input type="hidden" name="productId" value="${product.productId}">
                <div class="field" style="margin-bottom: 0; width: 80px;">
                    <label for="quantity">Qty</label>
                    <input type="number" id="quantity" name="quantity" value="1" min="1" max="${product.stockQuantity}">
                </div>
                <button type="submit" class="btn btn-primary" style="margin-top: 1.2rem;">
                    <i class="fa-solid fa-bag-shopping"></i> Add to Cart
                </button>
            </form>
        </c:if>

        <form action="${pageContext.request.contextPath}/wishlist/add" method="post" style="display: inline;">
            <input type="hidden" name="productId" value="${product.productId}">
            <button type="submit" class="btn btn-secondary">
                <i class="fa-regular fa-heart"></i> Add to Wishlist
            </button>
        </form>

        <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary" style="margin-left: 0.5rem;">
            <i class="fa-solid fa-arrow-left"></i> Back to Shop
        </a>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
