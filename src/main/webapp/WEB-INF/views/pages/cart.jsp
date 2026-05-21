<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Your Cart" />
</jsp:include>

<style>
    body {
        background-color: #FDFCEB;
        color: #333;
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    .cart-container {
        max-width: 1200px;
        margin: 60px auto;
        padding: 0 40px;
    }

    .cart-title {
        font-size: 36px;
        font-weight: 400;
        margin-bottom: 40px;
        border-bottom: 1px solid #333;
        padding-bottom: 20px;
        text-transform: uppercase;
        letter-spacing: 2px;
    }

    .cart-layout {
        display: grid;
        grid-template-columns: 1fr 350px;
        gap: 60px;
    }

    /* Cart Items */
    .cart-items {
        display: flex;
        flex-direction: column;
        gap: 30px;
    }

    .cart-item {
        display: grid;
        grid-template-columns: 150px 1fr auto;
        gap: 30px;
        padding-bottom: 30px;
        border-bottom: 1px solid #E0E0E0;
        align-items: center;
    }

    .cart-item-img {
        width: 150px;
        aspect-ratio: 1/1;
        object-fit: cover;
        background-color: #fff;
    }

    .cart-item-info h3 {
        font-size: 18px;
        margin: 0 0 10px 0;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .cart-item-category {
        font-size: 11px;
        color: #999;
        text-transform: uppercase;
        margin-bottom: 10px;
        display: block;
    }

    .cart-item-price {
        font-size: 16px;
        color: #8B735B;
    }

    .cart-item-controls {
        display: flex;
        flex-direction: column;
        align-items: flex-end;
        gap: 15px;
    }

    .qty-box {
        display: flex;
        align-items: center;
        border: 1px solid #E0E0E0;
        background: white;
    }

    .qty-btn {
        background: none;
        border: none;
        padding: 8px 15px;
        cursor: pointer;
        color: #666;
        font-size: 16px;
    }

    .qty-btn:hover {
        color: #333;
    }

    .qty-val {
        padding: 0 10px;
        font-size: 14px;
        min-width: 30px;
        text-align: center;
    }

    .remove-btn {
        background: none;
        border: none;
        color: #999;
        font-size: 11px;
        text-transform: uppercase;
        letter-spacing: 1px;
        cursor: pointer;
        text-decoration: underline;
    }

    .remove-btn:hover {
        color: #333;
    }

    /* Summary Sidebar */
    .cart-summary {
        background-color: #fff;
        padding: 30px;
        border: 1px solid #E0E0E0;
        height: fit-content;
    }

    .summary-title {
        font-size: 18px;
        text-transform: uppercase;
        letter-spacing: 1px;
        margin-bottom: 25px;
        border-bottom: 1px solid #F0F0F0;
        padding-bottom: 15px;
    }

    .summary-row {
        display: flex;
        justify-content: space-between;
        margin-bottom: 15px;
        font-size: 14px;
        color: #666;
    }

    .summary-row.total {
        margin-top: 20px;
        padding-top: 20px;
        border-top: 1px solid #F0F0F0;
        font-weight: bold;
        color: #333;
        font-size: 18px;
    }

    .checkout-btn {
        width: 100%;
        background-color: #445434;
        color: white;
        border: none;
        padding: 18px;
        font-size: 14px;
        text-transform: uppercase;
        letter-spacing: 1px;
        margin-top: 25px;
        cursor: pointer;
        transition: background-color 0.2s;
    }

    .checkout-btn:hover {
        background-color: #364229;
    }

    .checkout-btn:disabled {
        background-color: #ccc;
        cursor: not-allowed;
    }

    .empty-cart {
        text-align: center;
        padding: 100px 0;
        grid-column: 1 / -1;
    }

    .empty-cart p {
        font-size: 18px;
        color: #999;
        margin-bottom: 30px;
    }

    .continue-link {
        color: #333;
        text-decoration: underline;
        text-transform: uppercase;
        font-size: 13px;
        letter-spacing: 1px;
    }

    /* Mobile */
    @media (max-width: 992px) {
        .cart-layout {
            grid-template-columns: 1fr;
        }
    }

    @media (max-width: 600px) {
        .cart-item {
            grid-template-columns: 100px 1fr;
        }
        .cart-item-controls {
            grid-column: 1 / -1;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
        }
    }
</style>

<div class="cart-container">
    <h1 class="cart-title">Your Collection</h1>

    <div class="cart-layout">
        <div class="cart-items">
            <c:set var="cartSubtotal" value="0" />
            <c:choose>
                <c:when test="${not empty sessionScope.cart}">
                    <c:forEach var="item" items="${sessionScope.cart}">
                        <c:set var="cartSubtotal" value="${cartSubtotal + item.subtotal}" />
                        <div class="cart-item">
                            <img src="${pageContext.request.contextPath}/${item.imageUrl}" 
                                 alt="${item.productName}" 
                                 class="cart-item-img"
                                 onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.jpg'">
                            
                            <div class="cart-item-info">
                                <span class="cart-item-category">${not empty item.categoryName ? item.categoryName : 'Artisan Piece'}</span>
                                <h3>${item.productName}</h3>
                                <div class="cart-item-price">$<fmt:formatNumber value="${item.price}" pattern="#,##0.00" /></div>
                            </div>
                            
                            <div class="cart-item-controls">
                                <div class="qty-box">
                                    <button type="button" class="qty-btn" onclick="updateQty('${item.productId}', '${item.quantity - 1}')">−</button>
                                    <span class="qty-val">${item.quantity}</span>
                                    <button type="button" class="qty-btn" onclick="updateQty('${item.productId}', '${item.quantity + 1}')">+</button>
                                </div>
                                <button type="button" class="remove-btn" onclick="removeItem('${item.productId}')">Remove</button>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="empty-cart">
                        <p>Your collection is currently empty.</p>
                        <a href="${pageContext.request.contextPath}/products" class="continue-link">Continue Browsing</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <c:if test="${not empty sessionScope.cart}">
            <div class="cart-summary">
                <h2 class="summary-title">Summary</h2>
                <div class="summary-row">
                    <span>Subtotal</span>
                    <span>$<fmt:formatNumber value="${cartSubtotal}" pattern="#,##0.00" /></span>
                </div>
                <div class="summary-row">
                    <span>Shipping</span>
                    <span>Calculated at checkout</span>
                </div>
                <div class="summary-row total">
                    <span>Total</span>
                    <span>$<fmt:formatNumber value="${cartSubtotal}" pattern="#,##0.00" /></span>
                </div>
                
                <form action="${pageContext.request.contextPath}/cart/checkout" method="post">
                    <button type="submit" class="checkout-btn">Secure Checkout</button>
                </form>
            </div>
        </c:if>
    </div>
</div>

<div style="margin-bottom: 100px;"></div>

<script>
    function updateQty(productId, newQty) {
        if (newQty < 1) return;
        
        const params = new URLSearchParams();
        params.append('productId', productId);
        params.append('quantity', newQty);

        fetch('${pageContext.request.contextPath}/cart/update', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            body: params
        }).then(() => {
            window.location.reload();
        });
    }

    function removeItem(productId) {
        if (confirm('Remove this piece from your collection?')) {
            const params = new URLSearchParams();
            params.append('productId', productId);

            fetch('${pageContext.request.contextPath}/cart/remove', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: params
            }).then(() => {
                window.location.reload();
            });
        }
    }
</script>

<jsp:include page="/WEB-INF/components/footer.jsp" />
