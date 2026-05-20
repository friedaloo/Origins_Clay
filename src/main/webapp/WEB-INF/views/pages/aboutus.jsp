<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Origins Clay</title>
    <style>
        :root {
            --bg-color: #fcfaf0;
            --text-dark: #1a1a1a;
            --text-muted: #666666;
            --olive-green: #556b3f;
            --border-color: #e0ddd9;
            --font-serif: 'Cormorant Garamond', serif;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-dark);
            margin: 0;
            padding: 0;
        }

        .about-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 100px 40px;
            padding-bottom: 150px; /* Space for fixed footer */
        }

        .about-hero {
            display: flex;
            gap: 80px;
            align-items: center;
            margin-bottom: 120px;
        }

        .about-text {
            flex: 1;
        }

        .about-text h1 {
            font-family: var(--font-serif);
            font-size: 56px;
            font-weight: 400;
            margin-bottom: 30px;
        }

        .about-text p {
            font-size: 18px;
            line-height: 1.8;
            color: var(--text-muted);
            margin-bottom: 25px;
        }

        .about-img {
            flex: 1;
        }

        .about-img img {
            width: 100%;
            aspect-ratio: 4/5;
            object-fit: cover;
            box-shadow: 20px 20px 0 var(--border-color);
        }

        .values-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 40px;
            margin-top: 100px;
        }

        .value-card {
            padding: 40px;
            background: white;
            border: 1px solid var(--border-color);
        }

        .value-card h3 {
            font-family: var(--font-serif);
            font-size: 24px;
            margin-bottom: 20px;
        }

        .value-card p {
            font-size: 15px;
            line-height: 1.6;
            color: var(--text-muted);
        }

        .stats-bar {
            display: flex;
            justify-content: space-around;
            background: var(--text-dark);
            color: white;
            padding: 80px 40px;
            margin-top: 120px;
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-family: var(--font-serif);
            font-size: 48px;
            margin-bottom: 10px;
        }

        .stat-label {
            font-size: 12px;
            letter-spacing: 2px;
            text-transform: uppercase;
            opacity: 0.7;
        }

        @media (max-width: 992px) {
            .about-hero {
                flex-direction: column;
                text-align: center;
            }
            .values-grid {
                grid-template-columns: 1fr;
            }
            .stats-bar {
                flex-wrap: wrap;
                gap: 40px;
            }
        }
    </style>
</head>
<body>

<jsp:include page="/WEB-INF/components/header.jsp" />

<main class="about-container">
    <section class="about-hero">
        <div class="about-text">
            <h1>Our Story</h1>
            <p>
                Origins Clay was born from a deep love for the ancient art of pottery. Founded in the heart of our coastal studio, we bring together traditional techniques passed down through generations with contemporary design sensibilities.
            </p>
            <p>
                Every piece that leaves our studio is shaped by hand on the potter's wheel, carefully glazed, and fired in our kiln. We believe that everyday objects should be beautiful, functional, and tell a story.
            </p>
        </div>
        <div class="about-img">
            <img src="${pageContext.request.contextPath}/assets/images/Picture6.jpg" alt="Pottery Studio" onerror="this.src='https://placehold.co/800x1000?text=Our+Story'">
        </div>
    </section>

    <section class="values-grid">
        <div class="value-card">
            <h3>Quality First</h3>
            <p>We never compromise on materials or process. Each piece undergoes careful inspection before it reaches you.</p>
        </div>
        <div class="value-card">
            <h3>Sustainability</h3>
            <p>We source our clay locally and use non-toxic, food-safe glazes. Our packaging is made from recycled materials.</p>
        </div>
        <div class="value-card">
            <h3>Community</h3>
            <p>We work closely with local artisans, providing fair wages and supporting traditional craft communities.</p>
        </div>
    </section>

    <section class="stats-bar">
        <div class="stat-item">
            <div class="stat-number">500+</div>
            <div class="stat-label">Pieces Crafted</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">12</div>
            <div class="stat-label">Artisans</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">5</div>
            <div class="stat-label">Years Running</div>
        </div>
        <div class="stat-item">
            <div class="stat-number">100%</div>
            <div class="stat-label">Handmade</div>
        </div>
    </section>
</main>

<jsp:include page="/WEB-INF/components/footer.jsp" />

</body>
</html>
