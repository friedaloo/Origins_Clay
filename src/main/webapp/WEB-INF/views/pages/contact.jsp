<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="Contact" />
</jsp:include>

<h1 class="page-title" style="text-align: center;"><em>Get in</em> <strong>Touch</strong></h1>
<p class="page-subtitle" style="text-align: center;">We'd love to hear from you</p>

<c:if test="${not empty successMessage}">
    <div class="alert alert-success">${successMessage}</div>
</c:if>

<div style="display: flex; flex-wrap: wrap; gap: 2.5rem; margin-top: 1rem;">

    <!-- Contact Form -->
    <div style="flex: 2; min-width: 300px;">
        <div class="card" style="padding: 2.5rem;">
            <h2 style="font-family: var(--font-serif); font-size: 1.4rem; margin-bottom: 1.2rem;"><em>Send us a</em> <strong>Message</strong></h2>
            <form action="${pageContext.request.contextPath}/contact" method="post">
                <div style="display: flex; gap: 1rem; flex-wrap: wrap;">
                    <div class="field" style="flex: 1; min-width: 200px;">
                        <label for="name">Your Name</label>
                        <input type="text" id="name" name="name" placeholder="Full name" required>
                    </div>
                    <div class="field" style="flex: 1; min-width: 200px;">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" placeholder="you@example.com" required>
                    </div>
                </div>
                <div class="field">
                    <label for="subject">Subject</label>
                    <input type="text" id="subject" name="subject" placeholder="How can we help?" required>
                </div>
                <div class="field">
                    <label for="message">Message</label>
                    <textarea id="message" name="message" placeholder="Tell us more..." required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send Message</button>
            </form>
        </div>
    </div>

    <!-- Contact Info -->
    <div style="flex: 1; min-width: 260px;">
        <div class="card" style="padding: 2.5rem; margin-bottom: 1.5rem;">
            <h3 style="font-size: 0.62rem; font-weight: 600; letter-spacing: 0.18em; text-transform: uppercase; color: var(--clay-muted); margin-bottom: 1.2rem;">Visit Our Workshop</h3>
            <p style="font-size: 0.88rem; line-height: 1.8; margin-bottom: 1.5rem;">
                <i class="fa-solid fa-location-dot" style="color: var(--clay-olive); margin-right: 0.5rem;"></i>
                Patan, Lalitpur<br>
                <span style="margin-left: 1.3rem;">Kathmandu Valley, Nepal</span>
            </p>
            <p style="font-size: 0.88rem; line-height: 1.8; margin-bottom: 1.5rem;">
                <i class="fa-solid fa-phone" style="color: var(--clay-olive); margin-right: 0.5rem;"></i>
                +977-1-5555678
            </p>
            <p style="font-size: 0.88rem; line-height: 1.8; margin-bottom: 1.5rem;">
                <i class="fa-solid fa-envelope" style="color: var(--clay-olive); margin-right: 0.5rem;"></i>
                hello@originsclay.com
            </p>
            <p style="font-size: 0.88rem; line-height: 1.8;">
                <i class="fa-solid fa-clock" style="color: var(--clay-olive); margin-right: 0.5rem;"></i>
                Sun–Fri: 10 AM – 6 PM
            </p>
        </div>

        <div class="card" style="padding: 2.5rem; text-align: center;">
            <h3 style="font-size: 0.62rem; font-weight: 600; letter-spacing: 0.18em; text-transform: uppercase; color: var(--clay-muted); margin-bottom: 1rem;">Follow Us</h3>
            <div style="display: flex; justify-content: center; gap: 1.5rem; font-size: 1.3rem;">
                <a href="#" style="color: var(--clay-muted);"><i class="fa-brands fa-instagram"></i></a>
                <a href="#" style="color: var(--clay-muted);"><i class="fa-brands fa-facebook"></i></a>
                <a href="#" style="color: var(--clay-muted);"><i class="fa-brands fa-pinterest"></i></a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/components/footer.jsp" />
