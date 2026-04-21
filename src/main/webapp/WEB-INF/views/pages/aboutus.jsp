<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="About Us" />
</jsp:include>

<section style="text-align: center; padding: 3rem 1rem 2rem;">
    <h1 class="page-title"><em>About</em> <strong>Origins Clay</strong></h1>
    <p class="page-subtitle">The Story Behind Every Piece</p>
</section>

<div style="display: flex; flex-wrap: wrap; gap: 2.5rem; margin-bottom: 3rem;">
    <div style="flex: 1; min-width: 300px;">
        <div class="card" style="padding: 2.5rem;">
            <h2 style="font-family: var(--font-serif); font-size: 1.6rem; margin-bottom: 1rem;"><em>Our</em> <strong>Story</strong></h2>
            <p style="font-size: 0.88rem; color: var(--clay-muted); line-height: 1.8; margin-bottom: 1rem;">
                Origins Clay was born from a deep love for the ancient art of pottery. Founded in the heart of Nepal, our workshop brings together traditional techniques passed down through generations with contemporary design sensibilities.
            </p>
            <p style="font-size: 0.88rem; color: var(--clay-muted); line-height: 1.8; margin-bottom: 1rem;">
                Every piece that leaves our studio is shaped by hand on the potter's wheel, carefully glazed, and fired in our kiln. We believe that everyday objects should be beautiful, functional, and tell a story.
            </p>
            <p style="font-size: 0.88rem; color: var(--clay-muted); line-height: 1.8;">
                From our hands to your home — each creation carries the warmth of human touch and the spirit of craftsmanship.
            </p>
        </div>
    </div>

    <div style="flex: 1; min-width: 300px;">
        <div class="card" style="padding: 2.5rem;">
            <h2 style="font-family: var(--font-serif); font-size: 1.6rem; margin-bottom: 1rem;"><em>Our</em> <strong>Values</strong></h2>

            <div style="margin-bottom: 1.5rem;">
                <h3 style="font-size: 0.88rem; font-weight: 600; margin-bottom: 0.4rem;">
                    <i class="fa-solid fa-gem" style="color: var(--clay-olive); margin-right: 0.5rem;"></i>Quality First
                </h3>
                <p style="font-size: 0.82rem; color: var(--clay-muted); line-height: 1.6;">
                    We never compromise on materials or process. Each piece undergoes careful inspection before it reaches you.
                </p>
            </div>

            <div style="margin-bottom: 1.5rem;">
                <h3 style="font-size: 0.88rem; font-weight: 600; margin-bottom: 0.4rem;">
                    <i class="fa-solid fa-seedling" style="color: var(--clay-olive); margin-right: 0.5rem;"></i>Sustainability
                </h3>
                <p style="font-size: 0.82rem; color: var(--clay-muted); line-height: 1.6;">
                    We source our clay locally and use non-toxic, food-safe glazes. Our packaging is made from recycled materials.
                </p>
            </div>

            <div>
                <h3 style="font-size: 0.88rem; font-weight: 600; margin-bottom: 0.4rem;">
                    <i class="fa-solid fa-people-group" style="color: var(--clay-olive); margin-right: 0.5rem;"></i>Community
                </h3>
                <p style="font-size: 0.82rem; color: var(--clay-muted); line-height: 1.6;">
                    We work closely with local artisans, providing fair wages and supporting traditional craft communities.
                </p>
            </div>
        </div>
    </div>
</div>

<!-- ====== STATS ====== -->
<div class="grid-4" style="margin-bottom: 3rem;">
    <div class="card" style="text-align: center; padding: 2rem;">
        <div style="font-family: var(--font-serif); font-size: 2.4rem; font-weight: 600; color: var(--clay-olive);">500+</div>
        <div style="font-size: 0.6rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); margin-top: 0.3rem;">Pieces Crafted</div>
    </div>
    <div class="card" style="text-align: center; padding: 2rem;">
        <div style="font-family: var(--font-serif); font-size: 2.4rem; font-weight: 600; color: var(--clay-olive);">12</div>
        <div style="font-size: 0.6rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); margin-top: 0.3rem;">Artisans</div>
    </div>
    <div class="card" style="text-align: center; padding: 2rem;">
        <div style="font-family: var(--font-serif); font-size: 2.4rem; font-weight: 600; color: var(--clay-olive);">5</div>
        <div style="font-size: 0.6rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); margin-top: 0.3rem;">Years Running</div>
    </div>
    <div class="card" style="text-align: center; padding: 2rem;">
        <div style="font-family: var(--font-serif); font-size: 2.4rem; font-weight: 600; color: var(--clay-olive);">100%</div>
        <div style="font-size: 0.6rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); margin-top: 0.3rem;">Handmade</div>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
