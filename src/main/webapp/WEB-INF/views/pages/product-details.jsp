<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="${product.name}" />
    <jsp:param name="extraCSS" value="
        <style>
            :root {
                --clay-primary: #3c3833;
                --clay-secondary: #e8e8e8;
                --clay-accent: #a67c52;
                --clay-text: #333;
                --clay-muted: #666;
                --clay-success: #2d5a27;
                --clay-danger: #a94442;
                --clay-bg: #f9f7f5;
                --clay-border: #e0ddd9;
            }

            .product-page {
                max-width: 1200px;
                margin: 60px auto;
                padding: 0 30px;
                font-family: 'Inter', sans-serif;
            }

            .product-layout {
                display: flex;
                flex-wrap: wrap;
                gap: 60px;
                align-items: flex-start;
            }

            .product-media {
                flex: 1.2;
                min-width: 400px;
            }

            .product-media img {
                width: 100%;
                height: 600px;
                object-fit: cover;
                border-radius: 8px;
                box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            }

            .product-details {
                flex: 1;
                min-width: 400px;
                display: flex;
                flex-direction: column;
                gap: 25px;
            }

            .product-meta {
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .category-label {
                font-size: 13px;
                text-transform: uppercase;
                letter-spacing: 2px;
                color: var(--clay-accent);
                font-weight: 700;
            }

            .product-title {
                font-size: 42px;
                color: var(--clay-primary);
                margin: 0;
                line-height: 1.2;
            }

            .product-price-tag {
                font-size: 28px;
                color: var(--clay-primary);
                font-weight: 500;
            }

            .product-desc {
                font-size: 16px;
                line-height: 1.8;
                color: var(--clay-muted);
                border-top: 1px solid var(--clay-border);
                border-bottom: 1px solid var(--clay-border);
                padding: 25px 0;
            }

            .stock-info {
                font-size: 14px;
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .stock-in { color: var(--clay-success); }
            .stock-out { color: var(--clay-danger); }

            .purchase-actions {
                display: flex;
                flex-direction: column;
                gap: 20px;
                margin-top: 10px;
            }

            .qty-selector {
                display: flex;
                align-items: center;
                gap: 15px;
            }

            .qty-selector label {
                font-size: 14px;
                font-weight: 600;
                color: var(--clay-primary);
            }

            .qty-input-field {
                width: 70px;
                padding: 12px;
                border: 1px solid var(--clay-border);
                border-radius: 6px;
                font-size: 16px;
                text-align: center;
            }

            .btn-group {
                display: flex;
                gap: 15px;
            }

            .btn-clay {
                padding: 16px 32px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-size: 16px;
                font-weight: 600;
                transition: all 0.3s ease;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 10px;
                text-decoration: none;
                flex: 1;
            }

            .btn-clay-primary {
                background-color: var(--clay-primary);
                color: white;
            }

            .btn-clay-primary:hover {
                background-color: #2c2823;
                transform: translateY(-2px);
            }

            .btn-clay-outline {
                background-color: transparent;
                border: 2px solid var(--clay-primary);
                color: var(--clay-primary);
            }

            .btn-clay-outline:hover {
                background-color: var(--clay-secondary);
                transform: translateY(-2px);
            }

            .btn-clay-danger {
                background-color: transparent;
                border: 2px solid var(--clay-danger);
                color: var(--clay-danger);
            }

            .btn-clay-danger:hover {
                background-color: #fff5f5;
                transform: translateY(-2px);
            }

            .secondary-actions {
                display: flex;
                gap: 15px;
                margin-top: 10px;
            }

            .nav-back {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                color: var(--clay-muted);
                text-decoration: none;
                font-size: 14px;
                transition: color 0.2s;
            }

            .nav-back:hover {
                color: var(--clay-primary);
            }

            /* Toast Notification */
            #clay-toast {
                position: fixed;
                bottom: 30px;
                right: 30px;
                background: white;
                border-left: 5px solid var(--clay-success);
                padding: 20px 30px;
                box-shadow: 0 15px 40px rgba(0,0,0,0.15);
                border-radius: 8px;
                display: flex;
                align-items: center;
                gap: 15px;
                transform: translateY(150%);
                transition: transform 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                z-index: 9999;
            }

            #clay-toast.show {
                transform: translateY(0);
            }

            #clay-toast i {
                color: var(--clay-success);
                font-size: 24px;
            }

            #clay-toast .toast-content {
                display: flex;
                flex-direction: column;
            }

            #clay-toast .toast-title {
                font-weight: 700;
                color: var(--clay-primary);
                margin-bottom: 4px;
            }

            #clay-toast .toast-msg {
                font-size: 14px;
                color: var(--clay-muted);
            }

            /* Responsive Design */
            @media (max-width: 1024px) {
                .product-media, .product-details {
                    min-width: 100%;
                }
                .product-media img {
                    height: 500px;
                }
            }

            @media (max-width: 768px) {
                .product-page {
                    margin: 30px auto;
                    padding: 0 20px;
                }
                .product-title {
                    font-size: 32px;
                }
                .btn-group {
                    flex-direction: column;
                }
            }
        </style>
    " />
</jsp:include>

<main class="product-page">
    <div class="product-layout">
        <!-- Media Section -->
        <section class="product-media">
            <img src="${pageContext.request.contextPath}/${product.imageUrl}" 
                 alt="${product.name}"
                 onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder.jpg';">
        </section>

        <!-- Details Section -->
        <section class="product-details">
            <div class="product-meta">
                <span class="category-label">${product.categoryName}</span>
                <h1 class="product-title">${product.name}</h1>
                <div class="product-price-tag">$${product.price}</div>
            </div>

            <p class="product-desc">
                ${product.description}
            </p>

            <div class="stock-info">
                <c:choose>
                    <c:when test="${product.stockQuantity > 0}">
                        <span class="stock-in">
                            <i class="fa-solid fa-circle-check"></i> In Stock (${product.stockQuantity} available)
                        </span>
                    </c:when>
                    <c:otherwise>
                        <span class="stock-out">
                            <i class="fa-solid fa-circle-xmark"></i> Out of Stock
                        </span>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="purchase-actions">
                <c:if test="${product.stockQuantity > 0}">
                    <form id="addToCartForm" class="qty-selector">
                        <input type="hidden" name="productId" value="${product.id}">
                        <label for="quantity">Quantity</label>
                        <input type="number" id="quantity" name="quantity" value="1" min="1" max="${product.stockQuantity}" class="qty-input-field">
                        
                        <button type="submit" class="btn-clay btn-clay-primary">
                            <i class="fa-solid fa-bag-shopping"></i> Add to Cart
                        </button>
                    </form>
                </c:if>

                <div class="secondary-actions">
                    <form action="${pageContext.request.contextPath}/wishlist/add" method="post" style="flex: 1;">
                        <input type="hidden" name="productId" value="${product.id}">
                        <button type="submit" class="btn-clay btn-clay-outline">
                            <i class="fa-regular fa-heart"></i> Wishlist
                        </button>
                    </form>

                    <c:if test="${sessionScope.userRole == 'admin'}">
                        <button type="button" class="btn-clay btn-clay-danger" onclick="handleDelete('${product.id}');">
                            <i class="fa-solid fa-trash-can"></i> Delete
                        </button>
                    </c:if>
                </div>
            </div>

            <a href="${pageContext.request.contextPath}/products" class="nav-back">
                <i class="fa-solid fa-arrow-left-long"></i> Back to Shop
            </a>
        </section>
    </div>
</main>

<div id="clay-toast">
    <i class="fa-solid fa-circle-check"></i>
    <div class="toast-content">
        <span class="toast-title">Success</span>
        <span class="toast-msg">Item added to your cart.</span>
    </div>
</div>

<script>
    const cartForm = document.getElementById('addToCartForm');
    if (cartForm) {
        cartForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            const formData = new FormData(this);
            const params = new URLSearchParams(formData);

            fetch('${pageContext.request.contextPath}/cart/add', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                    'X-Requested-With': 'XMLHttpRequest'
                },
                body: params
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    showToast(data.message || 'Added to cart!');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                // Fallback to normal submission if AJAX fails
                this.submit();
            });
        });
    }

    function showToast(message) {
        const toast = document.getElementById('clay-toast');
        const msgSpan = toast.querySelector('.toast-msg');
        msgSpan.textContent = message;
        
        toast.classList.add('show');
        setTimeout(() => {
            toast.classList.remove('show');
        }, 3000);
    }

    function handleDelete(productId) {
        if (confirm('Are you sure you want to permanently delete this product?')) {
            window.location.href = '${pageContext.request.contextPath}/admin/product/delete?id=' + productId;
        }
    }
</script>

<jsp:include page="/WEB-INF/components/footer.jsp" />
