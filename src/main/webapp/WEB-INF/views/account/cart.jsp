<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Shopping Cart" />
</jsp:include>

<h1 class="page-title"><em>Your</em> <strong>Cart</strong></h1>
<p class="page-subtitle">Review your items before checkout</p>

<c:if test="${not empty error}">
    <div class="alert alert-error">${error}</div>
</c:if>
<c:if test="${not empty success}">
    <div class="alert alert-success">${success}</div>
</c:if>

<c:choose>
    <c:when test="${not empty sessionScope.cart}">
        <div style="display: flex; flex-wrap: wrap; gap: 2rem;">
            <!-- Cart Items -->
            <div style="flex: 2; min-width: 300px;">
                <div class="card">
                    <table>
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="cartTotal" value="0" />
                            <c:forEach var="item" items="${sessionScope.cart}">
                                <tr>
                                    <td>
                                        <div style="display: flex; align-items: center; gap: 0.8rem;">
                                            <img src="${pageContext.request.contextPath}/${item.imageUrl}"
                                                 alt="${item.productName}"
                                                 style="width: 50px; height: 50px; object-fit: cover; background: var(--clay-input);"
                                                 onerror="this.style.background='#E5E2E0'; this.src='';">
                                            <span>${item.productName}</span>
                                        </div>
                                    </td>
                                    <td>$${item.price}</td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/cart/update" method="post" style="display: flex; align-items: center; gap: 0.4rem;">
                                            <input type="hidden" name="productId" value="${item.productId}">
                                            <input type="number" name="quantity" value="${item.quantity}" min="1" max="99"
                                                   style="width: 60px; padding: 0.4rem; font-size: 0.85rem; background: var(--clay-input); border: none; text-align: center;">
                                            <button type="submit" class="btn btn-secondary btn-sm" style="padding: 0.4rem 0.6rem;">
                                                <i class="fa-solid fa-arrows-rotate"></i>
                                            </button>
                                        </form>
                                    </td>
                                    <td>$${item.subtotal}</td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/cart/remove" method="post">
                                            <input type="hidden" name="productId" value="${item.productId}">
                                            <button type="submit" class="btn btn-danger btn-sm" style="padding: 0.4rem 0.6rem;">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Checkout -->
            <div style="flex: 1; min-width: 260px;">
                <div class="card">
                    <h3 style="font-size: 0.62rem; font-weight: 600; letter-spacing: 0.18em; text-transform: uppercase; color: var(--clay-muted); margin-bottom: 1.2rem;">Checkout</h3>

                    <form action="${pageContext.request.contextPath}/cart/checkout" method="post">
                        <div class="field">
                            <label for="shippingName">Full Name</label>
                            <input type="text" id="shippingName" name="shippingName"
                                   value="${sessionScope.loggedInUser.fullName}" placeholder="Full name for shipping">
                        </div>
                        <div class="field">
                            <label for="shippingPhone">Phone</label>
                            <input type="text" id="shippingPhone" name="shippingPhone"
                                   value="${sessionScope.loggedInUser.phone}" placeholder="Contact phone number">
                        </div>
                        <div class="field">
                            <label for="shippingAddress">Shipping Address</label>
                            <textarea id="shippingAddress" name="shippingAddress" placeholder="Enter your shipping address"
                                      style="min-height: 80px;">${sessionScope.loggedInUser.address}</textarea>
                        </div>
                        <div class="field">
                            <label for="shippingCity">City</label>
                            <input type="text" id="shippingCity" name="shippingCity" placeholder="City">
                        </div>
                        <button type="submit" class="btn btn-primary" style="width: 100%;">
                            <i class="fa-solid fa-bag-shopping"></i> Place Order
                        </button>
                    </form>
                </div>

                <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary" style="width: 100%; text-align: center;">
                    <i class="fa-solid fa-arrow-left"></i> Continue Shopping
                </a>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <div class="card" style="text-align: center; padding: 4rem;">
            <i class="fa-solid fa-cart-shopping" style="font-size: 2.5rem; color: var(--clay-muted); margin-bottom: 1rem;"></i>
            <p style="color: var(--clay-muted); margin-bottom: 1.5rem;">Your cart is empty</p>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Start Shopping</a>
        </div>
    </c:otherwise>
</c:choose>

<jsp:include page="/WEB-INF/components/footer.jsp" />
