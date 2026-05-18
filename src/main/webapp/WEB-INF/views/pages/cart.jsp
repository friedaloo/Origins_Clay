<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Your Collection" />
    <jsp:param name="extraCSS" value="
        <link rel='preconnect' href='https://fonts.googleapis.com'>
        <link rel='preconnect' href='https://fonts.gstatic.com' crossorigin>
        <link href='https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,600;1,400;1,600&family=Jost:wght@300;400;500&display=swap' rel='stylesheet'>
        <style>
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
            }

            .collection-container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 80px 20px;
            }

            .collection-title {
                font-family: var(--font-serif);
                font-size: 56px;
                font-weight: 400;
                margin-bottom: 60px;
                color: var(--text-dark);
            }

            .cart-layout {
                display: flex;
                gap: 60px;
                align-items: flex-start;
            }

            .cart-items-list {
                flex: 1.5;
            }

            .cart-item-card {
                display: flex;
                gap: 30px;
                padding-bottom: 40px;
                margin-bottom: 40px;
                border-bottom: 1px solid var(--border-color);
            }

            .cart-item-img-wrap {
                width: 240px;
                height: 240px;
                flex-shrink: 0;
            }

            .cart-item-img-wrap img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                background-color: #f0f0f0;
            }

            .cart-item-info {
                flex: 1;
                display: flex;
                flex-direction: column;
            }

            .cart-item-header {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                margin-bottom: 10px;
            }

            .cart-item-name {
                font-family: var(--font-serif);
                font-size: 32px;
                font-weight: 400;
                margin: 0;
            }

            .cart-item-price {
                font-size: 24px;
                font-weight: 400;
                white-space: nowrap;
            }

            .cart-item-tag {
                font-size: 11px;
                letter-spacing: 1.5px;
                text-transform: uppercase;
                color: var(--text-muted);
                border: 1px solid var(--border-color);
                padding: 4px 12px;
                border-radius: 20px;
                display: inline-block;
                margin-bottom: 20px;
                align-self: flex-start;
            }

            .cart-item-desc {
                font-size: 14px;
                color: var(--text-muted);
                line-height: 1.6;
                margin-bottom: 30px;
                max-width: 450px;
            }

            .cart-item-actions {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: auto;
            }

            .qty-control {
                display: flex;
                align-items: center;
                border: 1px solid var(--border-color);
                padding: 4px;
                background: white;
            }

            .qty-btn {
                background: none;
                border: none;
                padding: 5px 15px;
                cursor: pointer;
                font-size: 18px;
                color: var(--text-muted);
                transition: color 0.2s;
            }

            .qty-btn:hover {
                color: var(--text-dark);
            }

            .qty-val {
                padding: 0 10px;
                font-size: 14px;
                min-width: 30px;
                text-align: center;
            }

            .remove-link {
                background: none;
                border: none;
                text-transform: uppercase;
                font-size: 12px;
                letter-spacing: 1px;
                color: var(--text-muted);
                cursor: pointer;
                padding: 0;
                transition: color 0.2s;
                text-decoration: none;
            }

            .remove-link:hover {
                color: var(--text-dark);
            }

            /* Sidebar Styles */
            .cart-sidebar {
                flex: 1;
                min-width: 350px;
                display: flex;
                flex-direction: column;
                gap: 30px;
            }

            .summary-box {
                border: 1px solid var(--border-color);
                padding: 40px;
                background: white;
            }

            .summary-heading {
                font-family: var(--font-serif);
                font-size: 32px;
                font-weight: 400;
                margin-bottom: 30px;
                border-bottom: 1px solid var(--border-color);
                padding-bottom: 20px;
            }

            .summary-line {
                display: flex;
                justify-content: space-between;
                margin-bottom: 15px;
                font-size: 14px;
            }

            .summary-line.total-line {
                margin-top: 25px;
                padding-top: 25px;
                border-top: 1px solid var(--border-color);
                font-weight: 500;
                font-size: 18px;
            }

            .checkout-action-btn {
                width: 100%;
                background-color: var(--olive-green);
                color: white;
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

            .checkout-action-btn:hover {
                opacity: 0.9;
            }

            .shipping-info-text {
                font-size: 12px;
                color: var(--text-muted);
                text-align: center;
                margin-top: 20px;
            }

            .brand-promise-box {
                border: 1px solid var(--border-color);
                padding: 30px;
                background: white;
            }

            .promise-header {
                font-size: 12px;
                letter-spacing: 2.5px;
                text-transform: uppercase;
                font-weight: 500;
                margin-bottom: 20px;
            }

            .promise-desc {
                font-size: 14px;
                color: var(--text-muted);
                line-height: 1.6;
            }

            /* Mobile adjustments */
            @media (max-width: 992px) {
                .cart-layout {
                    flex-direction: column;
                }
                .cart-sidebar {
                    width: 100%;
                }
            }

            @media (max-width: 600px) {
                .cart-item-card {
                    flex-direction: column;
                }
                .cart-item-img-wrap {
                    width: 100%;
                    height: auto;
                    aspect-ratio: 1/1;
                }
                .collection-title {
                    font-size: 40px;
                }
            }
        </style>
    " />
</jsp:include>

<div class="collection-container">
    <h1 class="collection-title">Your Collection</h1>

    <div class="cart-layout">
        <!-- List of Items -->
        <div class="cart-items-list">
            <c:set var="cartSubtotal" value="0" />
            <c:choose>
                <c:when test="${not empty sessionScope.cart}">
                    <c:forEach var="item" items="${sessionScope.cart}">
                        <c:set var="cartSubtotal" value="${cartSubtotal + item.subtotal}" />
                        <div class="cart-item-card" id="item-${item.productId}">
                            <div class="cart-item-img-wrap">
                                <img src="${pageContext.request.contextPath}/${item.imageUrl}" 
                                     alt="${item.productName}" 
                                     onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.jpg'">
                            </div>
                            
                            <div class="cart-item-info">
                                <div class="cart-item-header">
                                    <h2 class="cart-item-name">${item.productName}</h2>
                                    <div class="cart-item-price">$ <fmt:formatNumber value="${item.price}" pattern="#,##0.00" /></div>
                                </div>
                                
                                <span class="cart-item-tag">${not empty item.categoryName ? item.categoryName : 'HANDCRAFTED'}</span>
                                
                                <p class="cart-item-desc">
                                    ${item.description}
                                </p>
                                
                                <div class="cart-item-actions">
                                    <div class="qty-control">
                                        <button type="button" class="qty-btn" onclick="updateQty(${item.productId}, ${item.quantity - 1})">−</button>
                                        <span class="qty-val"><fmt:formatNumber value="${item.quantity}" pattern="00" /></span>
                                        <button type="button" class="qty-btn" onclick="updateQty(${item.productId}, ${item.quantity + 1})">+</button>
                                    </div>
                                    
                                    <button type="button" class="remove-link" onclick="removeItem(${item.productId})">REMOVE</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div style="text-align: center; padding: 60px 0; color: var(--text-muted);">
                        <p style="font-size: 18px; margin-bottom: 20px;">Your collection is empty.</p>
                        <a href="${pageContext.request.contextPath}/products" style="color: var(--text-dark); text-decoration: underline; text-transform: uppercase; font-size: 14px; letter-spacing: 1px;">Shop our pieces</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Sidebar Summary -->
        <div class="cart-sidebar">
            <div class="summary-box">
                <h2 class="summary-heading">Summary</h2>
                
                <div class="summary-line">
                    <span>Subtotal</span>
                    <span>$ <fmt:formatNumber value="${cartSubtotal}" pattern="#,##0.00" /></span>
                </div>
                
                <div class="summary-line">
                    <span>Shipping</span>
                    <span>Calculated at next step</span>
                </div>
                
                <div class="summary-line">
                    <span>Tax (8%)</span>
                    <c:set var="cartTax" value="${cartSubtotal * 0.08}" />
                    <span>$ <fmt:formatNumber value="${cartTax}" pattern="#,##0.00" /></span>
                </div>
                
                <div class="summary-line total-line">
                    <span>Total</span>
                    <span>$ <fmt:formatNumber value="${cartSubtotal + cartTax}" pattern="#,##0.00" /></span>
                </div>
                
                <form action="${pageContext.request.contextPath}/cart/checkout" method="post">
                    <button type="submit" class="checkout-action-btn" ${empty sessionScope.cart ? 'disabled' : ''}>
                        SECURE CHECKOUT <i class="fa-solid fa-lock" style="font-size: 12px;"></i>
                    </button>
                </form>
                
                <p class="shipping-info-text">Complimentary shipping on orders over $300</p>
            </div>

            <div class="brand-promise-box">
                <div class="promise-header">THE PROMISE</div>
                <p class="promise-desc">
                    Every piece is hand-thrown in our coastal studio and packed in 100% plastic-free, recyclable materials.
                </p>
            </div>
        </div>
    </div>
</div>

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
        if (confirm('Remove this item from your collection?')) {
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

<jsp:include page="/WEB-INF/components/header.jsp" />
<jsp:include page="/WEB-INF/components/footer.jsp" />
