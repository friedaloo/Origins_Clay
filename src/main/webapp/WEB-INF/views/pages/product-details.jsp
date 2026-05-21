<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="${product.name}" />
</jsp:include>

<style>
    body {
        background-color: #FDFCEB;
        color: #333;
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    .product-container {
        max-width: 1200px;
        margin: 60px auto;
        padding: 0 40px;
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 80px;
    }

    /* Left Column: Images */
    .image-section {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    .main-image {
        width: 100%;
        aspect-ratio: 1/1.1;
        object-fit: cover;
        background-color: #fff;
    }

    .thumbnails {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
    }

    .thumbnail {
        width: 100%;
        aspect-ratio: 1/1;
        object-fit: cover;
        background-color: #fff;
        cursor: pointer;
        border: 1px solid transparent;
        transition: border 0.2s;
    }

    .thumbnail:hover {
        border-color: #333;
    }

    /* Right Column: Details */
    .details-section {
        display: flex;
        flex-direction: column;
        gap: 30px;
    }

    .edition-tag {
        font-size: 11px;
        letter-spacing: 2px;
        color: #999;
        text-transform: uppercase;
        margin-bottom: -20px;
    }

    .product-name {
        font-size: 42px;
        color: #333;
        margin: 0;
        font-weight: 400;
    }

    .product-price {
        font-size: 24px;
        color: #8B735B;
        margin: 0;
    }

    .product-description {
        font-size: 15px;
        line-height: 1.8;
        color: #666;
        margin: 20px 0;
    }

    .action-buttons {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .btn-add-cart {
        background-color: #445434;
        color: white;
        padding: 18px;
        border: none;
        font-size: 14px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 10px;
        transition: background-color 0.2s;
    }

    .btn-add-cart:hover {
        background-color: #364229;
    }

    .btn-wishlist {
        background-color: transparent;
        color: #333;
        padding: 18px;
        border: 1px solid #E0E0E0;
        font-size: 14px;
        cursor: pointer;
        text-align: center;
        text-decoration: none;
        transition: all 0.2s;
    }

    .btn-wishlist:hover {
        border-color: #333;
    }

    /* Dimensions Section */
    .info-card {
        background-color: #F9F7F2;
        padding: 25px;
        margin-top: 20px;
    }

    .info-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-size: 14px;
        font-weight: bold;
        margin-bottom: 20px;
        cursor: pointer;
    }

    .info-table {
        width: 100%;
        border-collapse: collapse;
    }

    .info-table td {
        padding: 10px 0;
        font-size: 12px;
        border-bottom: 1px solid #E0E0E0;
    }

    .info-table td:first-child {
        color: #999;
        width: 40%;
    }

    .info-table td:last-child {
        color: #333;
        text-align: right;
    }

    /* Shipping Info */
    .shipping-info {
        display: flex;
        gap: 15px;
        padding: 20px;
        border: 1px solid #F0EDE4;
        margin-top: 20px;
    }

    .shipping-icon {
        color: #445434;
        font-size: 18px;
    }

    .shipping-text h4 {
        font-size: 13px;
        margin: 0 0 5px 0;
        color: #333;
    }

    .shipping-text p {
        font-size: 12px;
        color: #666;
        margin: 0;
        line-height: 1.5;
    }

    /* Responsive */
    @media (max-width: 992px) {
        .product-container {
            grid-template-columns: 1fr;
            gap: 40px;
            margin: 40px auto;
        }
    }
</style>

<main class="product-container">
    <!-- Image Section -->
    <section class="image-section">
        <img src="${pageContext.request.contextPath}/${product.imageUrl}" 
             alt="${product.name}" 
             class="main-image"
             onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.jpg';">
        
        <div class="thumbnails">
            <img src="${pageContext.request.contextPath}/${product.imageUrl}" class="thumbnail" alt="Thumb 1">
            <img src="${pageContext.request.contextPath}/assets/images/Meadows_Plant.png" class="thumbnail" alt="Thumb 2">
            <img src="${pageContext.request.contextPath}/assets/images/Container.png" class="thumbnail" alt="Thumb 3">
        </div>
    </section>

    <!-- Details Section -->
    <section class="details-section">
        <span class="edition-tag">Limited Edition</span>
        <h1 class="product-name">${product.name}</h1>
        <p class="product-price">$${product.price}</p>

        <p class="product-description">
            ${product.description}
            A handcrafted piece from our collection, each item is uniquely thrown and glazed, 
            capturing the essence of artisan pottery.
        </p>

        <div class="action-buttons">
            <c:if test="${product.stockQuantity > 0}">
                <form action="${pageContext.request.contextPath}/cart/add" method="post">
                    <input type="hidden" name="productId" value="${product.id}">
                    <input type="hidden" name="quantity" value="1">
                    <button type="submit" class="btn-add-cart">
                        <i class="fa-solid fa-bag-shopping"></i> Add to Cart
                    </button>
                </form>
            </c:if>

            <form action="${pageContext.request.contextPath}/wishlist/add" method="post">
                <input type="hidden" name="productId" value="${product.id}">
                <button type="submit" class="btn-wishlist">Save to Collection</button>
            </form>
        </div>

        <!-- Dimensions Card -->
        <div class="info-card">
            <div class="info-header">
                <span>Dimensions</span>
                <i class="fa-solid fa-chevron-down"></i>
            </div>
            <table class="info-table">
                <tr>
                    <td>Height</td>
                    <td>9.5 inches</td>
                </tr>
                <tr>
                    <td>Diameter</td>
                    <td>6.2 inches</td>
                </tr>
                <tr>
                    <td>Material</td>
                    <td>Textured Stoneware</td>
                </tr>
            </table>
        </div>

        <!-- Shipping Info -->
        <div class="shipping-info">
            <div class="shipping-icon">
                <i class="fa-solid fa-truck-fast"></i>
            </div>
            <div class="shipping-text">
                <h4>Artisanal Shipping</h4>
                <p>Each piece is hand-packed in eco-friendly, biodegradable materials. Arrives within 7-10 business days.</p>
            </div>
        </div>

        <c:if test="${sessionScope.userRole == 'admin'}">
            <div style="margin-top: 20px; padding-top: 20px; border-top: 1px solid #E0E0E0;">
                <a href="${pageContext.request.contextPath}/admin/product/edit?id=${product.id}" class="btn-wishlist" style="display: block; margin-bottom: 10px;">Edit Product</a>
                <form action="${pageContext.request.contextPath}/admin/product/delete" method="post" onsubmit="return confirm('Are you sure?');">
                    <input type="hidden" name="id" value="${product.id}">
                    <button type="submit" class="btn-wishlist" style="width: 100%; color: #a94442; border-color: #ebccd1;">Delete Piece</button>
                </form>
            </div>
        </c:if>

        <a href="${pageContext.request.contextPath}/products" style="margin-top: 20px; color: #999; font-size: 13px; text-decoration: none;">
            <i class="fa-solid fa-arrow-left"></i> Back to Collection
        </a>
    </section>
</main>

<div style="margin-bottom: 100px;"></div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
