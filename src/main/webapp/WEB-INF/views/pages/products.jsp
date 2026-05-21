<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Shop" />
</jsp:include>

<style>
    body {
        background-color: #FDFCEB;
        color: #333;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 40px 20px;
    }

    /* Search & Filter Bar */
    .filter-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 40px;
        flex-wrap: wrap;
        gap: 20px;
        border-bottom: 1px solid #333;
        padding-bottom: 20px;
    }

    .search-box {
        position: relative;
        flex: 1;
        max-width: 600px;
    }

    .search-box input {
        width: 100%;
        padding: 12px 12px 12px 40px;
        border: 1px solid #E0E0E0;
        background-color: #fff;
        font-size: 16px;
        color: #666;
    }

    .search-box i {
        position: absolute;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        color: #999;
    }

    .category-filters {
        display: flex;
        gap: 10px;
    }

    .filter-btn {
        padding: 8px 20px;
        border: 1px solid #E0E0E0;
        background-color: #fff;
        color: #666;
        text-decoration: none;
        font-size: 14px;
        transition: all 0.2s;
    }

    .filter-btn:hover, .filter-btn.active {
        border-color: #333;
        color: #333;
    }

    /* Product Grid */
    .product-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 40px;
    }

    .product-card {
        display: flex;
        flex-direction: column;
    }

    .product-image {
        width: 100%;
        aspect-ratio: 4 / 5;
        object-fit: cover;
        background-color: #eee;
        margin-bottom: 15px;
    }

    .product-info {
        display: flex;
        justify-content: space-between;
        align-items: baseline;
    }

    .product-name {
        font-size: 14px;
        font-weight: bold;
        text-transform: uppercase;
        margin: 0;
        color: #333;
        text-decoration: none;
    }

    .product-category {
        font-size: 11px;
        color: #999;
        text-transform: uppercase;
        margin: 0;
    }

    /* Mobile Responsive */
    @media (max-width: 992px) {
        .product-grid {
            grid-template-columns: repeat(2, 1fr);
        }
    }

    @media (max-width: 600px) {
        .product-grid {
            grid-template-columns: 1fr;
        }
        .filter-bar {
            flex-direction: column;
            align-items: stretch;
        }
        .search-box {
            max-width: 100%;
        }
    }
</style>

<div class="container">
    <!-- ====== SEARCH & FILTER BAR ====== -->
    <div class="filter-bar">
        <form action="${pageContext.request.contextPath}/products" method="get" class="search-box">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" name="search" placeholder="Find a piece..." value="${searchKeyword}">
            <c:if test="${not empty selectedCategory}">
                <input type="hidden" name="category" value="${selectedCategory}">
            </c:if>
        </form>

        <div class="category-filters">
            <a href="${pageContext.request.contextPath}/products" 
               class="filter-btn ${empty selectedCategory ? 'active' : ''}">All Works</a>
            <c:forEach var="cat" items="${categories}">
                <a href="${pageContext.request.contextPath}/products?category=${cat.id}" 
                   class="filter-btn ${selectedCategory == cat.id ? 'active' : ''}">${cat.name}</a>
            </c:forEach>
        </div>
    </div>

    <!-- ====== PRODUCT GRID ====== -->
    <div class="product-grid">
        <c:forEach var="product" items="${products}">
            <div class="product-card">
                <a href="${pageContext.request.contextPath}/product-details?id=${product.id}">
                    <img src="${pageContext.request.contextPath}/${product.imageUrl}" 
                         alt="${product.name}" 
                         class="product-image"
                         onerror="this.style.display='none';">
                </a>
                <div class="product-info">
                    <a href="${pageContext.request.contextPath}/product-details?id=${product.id}" class="product-name">${product.name}</a>
                    <p class="product-category">${product.categoryName}</p>
                </div>
            </div>
        </c:forEach>
    </div>

    <c:if test="${empty products}">
        <p style="text-align: center; color: #999; padding: 60px 0; grid-column: 1/-1;">
            No pieces found matching your criteria.
        </p>
    </c:if>
</div>

<div style="margin-bottom: 80px;"></div> <!-- Spacer for fixed footer -->

<jsp:include page="/WEB-INF/components/footer.jsp" />
