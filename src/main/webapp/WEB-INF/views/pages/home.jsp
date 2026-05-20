<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%@ include file="/WEB-INF/components/header.jsp" %>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f3f3f3;
        color: #222;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 1171px;
        width: 90%;
        margin: auto;
    }

    /* --- HERO SECTION --- */
    .outer-section {
        display: flex;
        justify-content: space-between;
        padding: 80px 0;
        gap: 90px;
    }

    .text-part {
        width: 100%;
        max-width: 521px;
    }

    .desc {
        font-size: 18px;
        color: black;
        margin-bottom: 25px;
        line-height: 1.6;
    }

    .explore {
        background: #5ebe5e;
        color: white;
        border: none;
        padding: 10px 20px;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        cursor: pointer;
    }

    .explore:hover {
        background: brown;
    }

    .overlapping-images {
        position: relative;
        max-width: 600px;
        width: 100%;
    }

    .big-image {
        width: 95%;
        aspect-ratio: 8.7/10;
        background: #ddd;
        border: 2px solid #aaa;
    }

    .small-image {
        width: 25%;
        aspect-ratio: 1/1;
        background: #ddd;
        border: 2px solid #aaa;
        position: absolute;
        top: -60px;
        right: -20px;
    }

    /* --- FEATURED SECTION HEADER --- */
    .middle-section {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 40px;
        margin-bottom: 20px;
    }

    #right-text a {
        text-decoration: underline;
        font-size: 18px;
        color: inherit;
    }

    /* --- FEATURED PRODUCTS MOSAIC GRID --- */
    .three-image-grid {
        display: grid;
        grid-template-columns: 1.5fr 1fr;
        gap: 20px;
        margin-bottom: 60px;
    }

    .product-card {
        background: #ddd;
        border: 2px solid #aaa;
        display: flex;
        flex-direction: column;
        justify-content: flex-end;
        padding: 20px;
        background-size: cover;
        background-position: center;
    }

    /* Card 1: Large left image */
    .product-card:nth-child(1) {
        grid-row: span 2;
        aspect-ratio: 11/10;
    }

    /* Cards 2 & 3: Stacked right images */
    .product-card:nth-child(2),
    .product-card:nth-child(3) {
        aspect-ratio: 31/19;
    }

    .product-info {
        background: rgba(255, 255, 255, 0.95);
        padding: 15px;
        border: 1px solid #aaa;
    }

    .product-info h3 {
        margin: 5px 0;
        font-size: 1.1rem;
    }

    .product-info .price {
        font-weight: bold;
        margin-bottom: 15px;
    }

    /* --- VALUES SECTION --- */
    .values-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 30px;
        padding: 40px 0 80px 0;
        border-top: 1px solid #ddd;
    }

    .value-card {
        text-align: center;
        padding: 2.5rem;
    }

    /* --- RESPONSIVE --- */
    @media (max-width: 768px) {
        .outer-section {
            flex-direction: column;
            gap: 40px;
        }
        .overlapping-images {
            margin-top: 30px;
        }
        .small-image {
            top: -40px;
            right: -5px;
            width: 30%;
        }
        .three-image-grid {
            grid-template-columns: 1fr;
        }
        .product-card:nth-child(1),
        .product-card:nth-child(2),
        .product-card:nth-child(3) {
            aspect-ratio: 31/25;
            grid-row: span 1;
        }
        .values-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<div class="container">
    
    <section class="outer-section">
        <div class="text-part">
            <h1>Object for Slow Living</h1>
            <p class="desc">
                Every piece is hand-thrown in our coastal studio, 
                celebrating the raw texture of stoneware and the 
                quiet rhythm of daily rituals.
            </p>
            <a href="/products" class="explore">Explore</a>
        </div>
        <div class="overlapping-images">
            <div class="big-image"></div>
            <div class="small-image"></div>
        </div>
    </section>

    <p style="margin-bottom: -20px; font-size: 14px; color: #555;">CURRENT SITUATION</p>
    <section class="middle-section">
        <div id="left-text">
            <h1 style="margin: 0;">FEATURED SERIES</h1>
        </div>
        <div id="right-text">
            <a href="/products">View All</a>
        </div>
    </section>

    <section class="three-image-grid">
        
        <div class="product-card" style="background-image: url('images/placeholder1.jpg');">
            <div class="product-info">
                <span style="font-size: 12px; color: #666;">Ceramics</span>
                <h3>Large Minimalist Bowl</h3>
                <div class="price">$45.00</div>
                <div>
                    <a href="/product-details?id=1" class="explore" style="padding: 6px 12px; margin-right: 5px;">View</a>
                    <form action="/cart/add" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="1">
                        <button type="submit" class="explore" style="padding: 6px 12px;">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="product-card" style="background-image: url('images/placeholder2.jpg');">
            <div class="product-info">
                <span style="font-size: 12px; color: #666;">Vases</span>
                <h3>Textured Clay Vase</h3>
                <div class="price">$65.00</div>
                <div>
                    <a href="/product-details?id=2" class="explore" style="padding: 6px 12px; margin-right: 5px;">View</a>
                    <form action="/cart/add" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="2">
                        <button type="submit" class="explore" style="padding: 6px 12px;">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="product-card" style="background-image: url('images/placeholder3.jpg');">
            <div class="product-info">
                <span style="font-size: 12px; color: #666;">Mugs</span>
                <h3>Speckled Coffee Mug</h3>
                <div class="price">$28.00</div>
                <div>
                    <a href="/product-details?id=3" class="explore" style="padding: 6px 12px; margin-right: 5px;">View</a>
                    <form action="/cart/add" method="post" style="display:inline;">
                        <input type="hidden" name="productId" value="3">
                        <button type="submit" class="explore" style="padding: 6px 12px;">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>

    </section>
    
    <section class="values-grid">
        <div class="value-card">
            <i class="fa-solid fa-hands" style="font-size: 1.8rem; color: #5ebe5e; margin-bottom: 1rem;"></i>
            <h3 style="font-size: 1.2rem; margin-bottom: 0.5rem;">Handcrafted</h3>
            <p style="font-size: 0.82rem; color: #666; line-height: 1.6;">Every piece is shaped by hand, making each one uniquely yours.</p>
        </div>
        <div class="value-card">
            <i class="fa-solid fa-leaf" style="font-size: 1.8rem; color: #5ebe5e; margin-bottom: 1rem;"></i>
            <h3 style="font-size: 1.2rem; margin-bottom: 0.5rem;">Sustainable</h3>
            <p style="font-size: 0.82rem; color: #666; line-height: 1.6;">We use locally sourced clay and eco-friendly glazes.</p>
        </div>
        <div class="value-card">
            <i class="fa-solid fa-truck-fast" style="font-size: 1.8rem; color: #5ebe5e; margin-bottom: 1rem;"></i>
            <h3 style="font-size: 1.2rem; margin-bottom: 0.5rem;">Carefully Shipped</h3>
            <p style="font-size: 0.82rem; color: #666; line-height: 1.6;">Each order is wrapped with care and delivered to your doorstep.</p>
        </div>
    </section>

</div>

<%@ include file="/WEB-INF/components/footer.jsp" %>