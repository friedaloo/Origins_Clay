<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Your Collection" />
</jsp:include>

<!-- Google Fonts & FontAwesome -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,600;1,400;1,600&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    /* CSS internal only, using px as requested */
    :root {
        --bg-color: #fcfaf0;
        --olive-green: #556b3f;
        --text-dark: #1a1a1a;
        --text-muted: #666666;
        --border-color: #dddddd;
        --font-serif: 'Cormorant Garamond', serif;
        --font-sans: 'Jost', sans-serif;
    }

    body {
        background-color: var(--bg-color);
        color: var(--text-dark);
        font-family: var(--font-sans);
        margin: 0px;
        padding: 0px;
    }

    .collection-wrapper {
        max-width: 1200px;
        margin: 0px auto;
        padding: 60px 20px;
    }

    .collection-header {
        font-family: var(--font-serif);
        font-size: 56px;
        font-weight: 400;
        margin-bottom: 60px;
    }

    .main-layout {
        display: flex;
        gap: 80px;
        align-items: flex-start;
    }

    .collection-items {
        flex: 2;
    }

    .cart-item {
        display: flex;
        gap: 40px;
        padding-bottom: 50px;
        margin-bottom: 50px;
        border-bottom: 1px solid var(--border-color);
    }

    .item-image-container {
        width: 280px;
        height: 280px;
        flex-shrink: 0;
    }

    .item-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        background-color: #eeeeee;
    }

    .item-details {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .item-header {
        display: flex;
        justify-content: space-between;
        align-items: baseline;
    }

    .item-name {
        font-family: var(--font-serif);
        font-size: 32px;
        font-weight: 400;
        margin: 0px 0px 10px 0px;
    }

    .item-price {
        font-size: 26px;
        font-weight: 400;
        white-space: nowrap;
    }

    .material-tag {
        font-size: 11px;
        letter-spacing: 1.5px;
        text-transform: uppercase;
        color: var(--text-muted);
        border: 1px solid var(--border-color);
        padding: 4px 12px;
        border-radius: 12px;
        display: inline-block;
        margin-bottom: 25px;
    }

    .item-description {
        font-size: 15px;
        color: var(--text-muted);
        line-height: 1.6;
        margin-bottom: 40px;
        max-width: 500px;
    }

    .item-actions {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: auto;
    }

    .quantity-selector {
        display: flex;
        align-items: center;
        border: 1px solid var(--border-color);
        padding: 2px;
    }

    .quantity-selector button {
        background: none;
        border: none;
        padding: 8px 15px;
        cursor: pointer;
        font-size: 18px;
        color: var(--text-muted);
        transition: color 0.2s;
    }

    .quantity-selector button:hover {
        color: var(--text-dark);
    }

    .quantity-selector span {
        padding: 0px 10px;
        font-size: 14px;
        min-width: 25px;
        text-align: center;
    }

    .remove-btn {
        background: none;
        border: none;
        text-transform: uppercase;
        font-size: 12px;
        letter-spacing: 1px;
        color: var(--text-muted);
        cursor: pointer;
        padding: 0px;
        transition: color 0.2s;
    }

    .remove-btn:hover {
        color: var(--text-dark);
    }

    /* Sidebar */
    .sidebar {
        flex: 1;
        min-width: 350px;
        position: sticky;
        top: 120px;
    }

    .summary-card {
        border: 1px solid var(--border-color);
        padding: 40px;
        background: #ffffff;
        margin-bottom: 30px;
    }

    .summary-title {
        font-family: var(--font-serif);
        font-size: 32px;
        font-weight: 400;
        margin-bottom: 30px;
        border-bottom: 1px solid var(--border-color);
        padding-bottom: 20px;
    }

    .summary-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
        font-size: 14px;
    }

    .summary-row.total {
        margin-top: 25px;
        padding-top: 25px;
        border-top: 1px solid var(--border-color);
        font-weight: 500;
        font-size: 18px;
    }

    .checkout-btn {
        width: 100%;
        background-color: var(--olive-green);
        color: #ffffff;
        border: none;
        padding: 20px;
        font-size: 14px;
        letter-spacing: 2px;
        text-transform: uppercase;
        margin-top: 25px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 12px;
        transition: opacity 0.2s;
    }

    .checkout-btn:hover {
        opacity: 0.9;
    }

    .shipping-notice {
        font-size: 12px;
        color: var(--text-muted);
        text-align: center;
        margin-top: 25px;
    }

    .promise-card {
        border: 1px solid var(--border-color);
        padding: 35px;
        background: #ffffff;
    }

    .promise-title {
        font-size: 12px;
        letter-spacing: 2.5px;
        text-transform: uppercase;
        font-weight: 500;
        margin-bottom: 25px;
    }

    .promise-text {
        font-size: 14px;
        color: var(--text-muted);
        line-height: 1.6;
    }

    /* Complete the Set */
    .complete-set-section {
        margin-top: 120px;
        text-align: center;
    }

    .section-divider {
        height: 1px;
        background-color: var(--border-color);
        margin-bottom: 120px;
    }

    .complete-set-title {
        font-family: var(--font-serif);
        font-size: 48px;
        font-weight: 400;
        margin-bottom: 60px;
    }

    .recommendations-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 40px;
    }

    .recommendation-item {
        text-align: center;
    }

    .recommendation-image-container {
        width: 100%;
        aspect-ratio: 1/1;
        margin-bottom: 25px;
        overflow: hidden;
    }

    .recommendation-image {
        width: 100%;
        height: 100%;
        object-fit: cover;
        background-color: #eeeeee;
        transition: transform 0.3s;
    }

    .recommendation-item:hover .recommendation-image {
        transform: scale(1.05);
    }

    .recommendation-name {
        font-size: 18px;
        font-weight: 400;
        margin-bottom: 8px;
    }

    .recommendation-price {
        font-size: 16px;
        color: var(--text-muted);
        margin-bottom: 15px;
    }

    .add-to-bag {
        background: none;
        border: none;
        text-transform: uppercase;
        font-size: 12px;
        letter-spacing: 1.5px;
        text-decoration: underline;
        cursor: pointer;
        color: var(--text-dark);
        padding: 5px;
        transition: opacity 0.2s;
    }

    .add-to-bag:hover {
        opacity: 0.7;
    }

    /* Media Queries for Responsive Design */
    @media (max-width: 1100px) {
        .main-layout {
            flex-direction: column;
            gap: 60px;
        }
        .sidebar {
            width: 100%;
            position: static;
        }
        .collection-wrapper {
            padding: 40px 20px;
        }
    }

    @media (max-width: 768px) {
        .collection-header {
            font-size: 40px;
        }
        .cart-item {
            flex-direction: column;
            gap: 25px;
        }
        .item-image-container {
            width: 100%;
            height: auto;
            aspect-ratio: 1/1;
        }
        .recommendations-grid {
            grid-template-columns: 1fr;
            gap: 50px;
        }
        .item-name {
            font-size: 26px;
        }
        .complete-set-title {
            font-size: 36px;
        }
    }
</style>

<div class="collection-wrapper">
    <h1 class="collection-header">Your Collection</h1>

    <div class="main-layout">
        <!-- Collection Items -->
        <div class="collection-items">
            <c:set var="subtotal" value="0" />
            <c:choose>
                <c:when test="${not empty sessionScope.cart}">
                    <c:forEach var="item" items="${sessionScope.cart}">
                        <c:set var="subtotal" value="${subtotal + item.subtotal}" />
                        <div class="cart-item">
                            <div class="item-image-container">
                                <img src="${pageContext.request.contextPath}/${item.imageUrl}" 
                                     alt="${item.productName}" 
                                     class="item-image" 
                                     onerror="this.src='https://placehold.co/400x400?text=${item.productName}'">
                            </div>
                            <div class="item-details">
                                <div>
                                    <div class="item-header">
                                        <h2 class="item-name">${item.productName}</h2>
                                        <div class="item-price">$ <fmt:formatNumber value="${item.price}" pattern="#,##0.00" /></div>
                                    </div>
                                    <c:if test="${not empty item.categoryName}">
                                        <span class="material-tag">${item.categoryName}</span>
                                    </c:if>
                                    <c:if test="${empty item.categoryName}">
                                        <span class="material-tag">HANDCRAFTED</span>
                                    </c:if>
                                    <p class="item-description">
                                        ${item.description}
                                    </p>
                                </div>
                                <div class="item-actions">
                                    <form action="${pageContext.request.contextPath}/cart/update" method="post" class="quantity-selector">
                                        <input type="hidden" name="productId" value="${item.productId}">
                                        <button type="submit" name="quantity" value="${item.quantity - 1}" ${item.quantity <= 1 ? 'disabled' : ''}>−</button>
                                        <span><fmt:formatNumber value="${item.quantity}" pattern="00" /></span>
                                        <button type="submit" name="quantity" value="${item.quantity + 1}">+</button>
                                    </form>
                                    <form action="${pageContext.request.contextPath}/cart/remove" method="post" onsubmit="return confirmRemoval()">
                                        <input type="hidden" name="productId" value="${item.productId}">
                                        <button type="submit" class="remove-btn">REMOVE</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div style="text-align: center; color: var(--text-muted); padding: 100px 0px;">
                        <p style="font-size: 18px; margin-bottom: 20px;">Your collection is currently empty.</p>
                        <a href="${pageContext.request.contextPath}/products" style="color: var(--text-dark); text-decoration: underline; font-size: 14px; letter-spacing: 1px; text-transform: uppercase;">Discover our pieces</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Sidebar -->
        <div class="sidebar">
            <div class="summary-card">
                <h2 class="summary-title">Summary</h2>
                <div class="summary-row">
                    <span>Subtotal</span>
                    <span>$ <fmt:formatNumber value="${subtotal}" pattern="#,##0.00" /></span>
                </div>
                <div class="summary-row">
                    <span>Shipping</span>
                    <span>Calculated at next step</span>
                </div>
                <div class="summary-row">
                    <span>Tax (8%)</span>
                    <c:set var="tax" value="${subtotal * 0.08}" />
                    <span>$ <fmt:formatNumber value="${tax}" pattern="#,##0.00" /></span>
                </div>
                <div class="summary-row total">
                    <span>Total</span>
                    <span>$ <fmt:formatNumber value="${subtotal + tax}" pattern="#,##0.00" /></span>
                </div>
                <form action="${pageContext.request.contextPath}/cart/checkout" method="post">
                    <button type="submit" class="checkout-btn" ${empty sessionScope.cart ? 'disabled' : ''}>
                        SECURE CHECKOUT <i class="fa-solid fa-lock" style="font-size: 12px; margin-left: 5px;"></i>
                    </button>
                </form>
                <p class="shipping-notice">Complimentary shipping on orders over $300</p>
            </div>

            <div class="promise-card">
                <div class="promise-title">THE PROMISE</div>
                <p class="promise-text">
                    Every piece is hand-thrown in our coastal studio and packed in 100% plastic-free, recyclable materials.
                </p>
            </div>
        </div>
    </div>

    <c:if test="${not empty recommendations}">
        <div class="section-divider"></div>

        <!-- Complete the Set -->
        <div class="complete-set-section">
            <h2 class="complete-set-title">Complete the Set</h2>
            <div class="recommendations-grid">
                <c:forEach var="prod" items="${recommendations}" begin="0" end="2">
                    <div class="recommendation-item">
                        <div class="recommendation-image-container">
                            <img src="${pageContext.request.contextPath}/${prod.imageUrl}" 
                                 alt="${prod.name}" 
                                 class="recommendation-image" 
                                 onerror="this.src='https://placehold.co/400x400?text=${prod.name}'">
                        </div>
                        <h3 class="recommendation-name">${prod.name}</h3>
                        <div class="recommendation-price">$ <fmt:formatNumber value="${prod.price}" pattern="#,##0.00" /></div>
                        <form action="${pageContext.request.contextPath}/cart/add" method="post">
                            <input type="hidden" name="productId" value="${prod.id}">
                            <button type="submit" class="add-to-bag">+ ADD TO BAG</button>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:if>
</div>

<script>
    function confirmRemoval() {
        return confirm("Are you sure you want to remove this item from your collection?");
    }
</script>

<jsp:include page="/WEB-INF/components/footer.jsp" />
