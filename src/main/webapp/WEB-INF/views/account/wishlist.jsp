<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Wishlist" />
</jsp:include>

<h1 class="page-title"><em>My</em> <strong>Wishlist</strong></h1>
<p class="page-subtitle">Items you love — saved for later</p>

<c:choose>
    <c:when test="${not empty sessionScope.wishlist}">
        <div class="grid-3">
            <c:forEach var="item" items="${sessionScope.wishlist}">
                <div class="product-card">
                    <img src="${pageContext.request.contextPath}/${item.imageUrl}"
                         alt="${item.productName}"
                         onerror="this.style.background='#E5E2E0'; this.src='';">
                    <div class="info">
                        <h3>${item.productName}</h3>
                        <div class="price">$${item.price}</div>
                        <c:choose>
                            <c:when test="${item.inStock}">
                                <span style="font-size: 0.6rem; color: var(--clay-success);">IN STOCK</span>
                            </c:when>
                            <c:otherwise>
                                <span style="font-size: 0.6rem; color: var(--clay-danger);">OUT OF STOCK</span>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="actions">
                        <c:if test="${item.inStock}">
                            <form action="${pageContext.request.contextPath}/cart/add" method="post" style="display:inline;">
                                <input type="hidden" name="productId" value="${item.productId}">
                                <button type="submit" class="btn btn-primary btn-sm">Add to Cart</button>
                            </form>
                        </c:if>
                        <form action="${pageContext.request.contextPath}/wishlist/remove" method="post" style="display:inline;">
                            <input type="hidden" name="productId" value="${item.productId}">
                            <button type="submit" class="btn btn-danger btn-sm">
                                <i class="fa-solid fa-trash"></i> Remove
                            </button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:when>
    <c:otherwise>
        <div class="card" style="text-align: center; padding: 4rem;">
            <i class="fa-regular fa-heart" style="font-size: 2.5rem; color: var(--clay-muted); margin-bottom: 1rem;"></i>
            <p style="color: var(--clay-muted); margin-bottom: 1.5rem;">Your wishlist is empty</p>
            <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Explore Collection</a>
        </div>
    </c:otherwise>
</c:choose>

<jsp:include page="/WEB-INF/components/footer.jsp" />
