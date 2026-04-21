<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Home" />
</jsp:include>

<!-- ====== HERO ====== -->
<section style="text-align: center; padding: 4rem 1rem 3rem;">
    <p style="font-size: 0.6rem; font-weight: 500; letter-spacing: 0.3em; text-transform: uppercase; color: var(--clay-muted); margin-bottom: 0.8rem;">Handcrafted With Purpose</p>
    <h1 style="font-family: var(--font-serif); font-size: 3.2rem; font-weight: 400; line-height: 1.15; margin-bottom: 1rem;">
        <em>Timeless</em> <strong>Clay</strong>,<br>Modern <em>Living</em>
    </h1>
    <p style="font-size: 0.88rem; color: var(--clay-muted); max-width: 480px; margin: 0 auto 2rem; line-height: 1.7;">
        Every piece in our collection tells a story — shaped by hand, fired with intention, and designed to bring warmth to your everyday rituals.
    </p>
    <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Explore the Collection</a>
</section>

<!-- ====== FEATURED PRODUCTS ====== -->
<section style="padding: 2rem 0 3rem;">
    <h2 class="page-title" style="text-align: center;"><em>Featured</em> <strong>Pieces</strong></h2>
    <p class="page-subtitle" style="text-align: center;">Curated selections from our artisan workshop</p>

    <div class="grid-3">
        <c:forEach var="product" items="${featuredProducts}">
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/${product.imageUrl}" 
                     alt="${product.name}"
                     onerror="this.style.background='#E5E2E0'; this.src='';">
                <div class="info">
                    <span class="category-label">${product.categoryName}</span>
                    <h3>${product.name}</h3>
                    <div class="price">$${product.price}</div>
                </div>
                <div class="actions">
                    <a href="${pageContext.request.contextPath}/product-details?id=${product.id}" class="btn btn-secondary btn-sm">View</a>
                    <form action="${pageContext.request.contextPath}/cart/add" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="${product.id}">
                        <button type="submit" class="btn btn-primary btn-sm">Add to Cart</button>
                    </form>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty featuredProducts}">
            <p style="grid-column: 1/-1; text-align: center; color: var(--clay-muted); padding: 3rem;">
                No featured products yet. Check back soon!
            </p>
        </c:if>
    </div>
</section>

<!-- ====== VALUES SECTION ====== -->
<section style="padding: 2rem 0 3rem;">
    <div class="grid-3">
        <div class="card" style="text-align: center; padding: 2.5rem;">
            <i class="fa-solid fa-hands" style="font-size: 1.8rem; color: var(--clay-olive); margin-bottom: 1rem;"></i>
            <h3 style="font-family: var(--font-serif); font-size: 1.2rem; margin-bottom: 0.5rem;">Handcrafted</h3>
            <p style="font-size: 0.82rem; color: var(--clay-muted); line-height: 1.6;">Every piece is shaped by hand, making each one uniquely yours.</p>
        </div>
        <div class="card" style="text-align: center; padding: 2.5rem;">
            <i class="fa-solid fa-leaf" style="font-size: 1.8rem; color: var(--clay-olive); margin-bottom: 1rem;"></i>
            <h3 style="font-family: var(--font-serif); font-size: 1.2rem; margin-bottom: 0.5rem;">Sustainable</h3>
            <p style="font-size: 0.82rem; color: var(--clay-muted); line-height: 1.6;">We use locally sourced clay and eco-friendly glazes.</p>
        </div>
        <div class="card" style="text-align: center; padding: 2.5rem;">
            <i class="fa-solid fa-truck-fast" style="font-size: 1.8rem; color: var(--clay-olive); margin-bottom: 1rem;"></i>
            <h3 style="font-family: var(--font-serif); font-size: 1.2rem; margin-bottom: 0.5rem;">Carefully Shipped</h3>
            <p style="font-size: 0.82rem; color: var(--clay-muted); line-height: 1.6;">Each order is wrapped with care and delivered to your doorstep.</p>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/components/footer.jsp" />
