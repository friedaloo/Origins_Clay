<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%-- DIRECTIVE STYLE INCLUDE --%>
<%@ include file="/WEB-INF/components/header.jsp" %>

<style>
    /* NEW DESIGN STYLES */
    .contact-body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f3f3f3;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-bottom: 60px;
    }

    .contact-container {
        display: flex;
        justify-content: center;
        padding: 60px;
        gap: 60px;
        width: 100%;
        max-width: 1200px;
    }

    .form-part {
        background-color: #ebe8e4;
        padding: 40px;
        width: 100%;
        max-width: 500px;
        border-radius: 8px;
    }

    /* Success Message styling from old code */
    .alert-success {
        background-color: #d4edda;
        color: #155724;
        padding: 15px;
        margin-top: 40px;
        border-radius: 4px;
        text-align: center;
        font-size: 14px;
        width: 90%;
        max-width: 600px;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        font-size: 12px;
        font-weight: bold;
        margin-bottom: 8px;
    }

    input, textarea {
        margin-bottom: 25px;
        padding: 14px;
        border: 1px solid #c8c3bd;
        font-size: 14px;
        font-family: inherit;
    }

    textarea {
        height: 120px;
        resize: none;
    }

    button.btn-submit {
        background-color: #7a5a2f;
        color: white;
        padding: 14px;
        width: 100%;
        max-width: 180px;
        border-radius: 6px;
        font-size: 14px;
        border: none;
        cursor: pointer;
        transition: 0.3s;
    }

    button.btn-submit:hover {
        background-color: #6ac038;
    }

    .information {
        width: 100%;
        max-width: 300px;
        color: #2e2e2e;
    }

    .topic {
        font-style: italic;
        font-size: 26px;
        margin-bottom: 10px;
        margin-top: 0;
    }

    .information h3 {
        font-style: italic;
        margin-top: 30px;
        margin-bottom: 10px;
        font-size: 1.17em;
    }

    .information p {
        margin: 4px 0px 4px 0px;
        font-size: 14px;
        color: #555;
    }

    @media (max-width: 768px) {
        .contact-container {
            flex-direction: column;
            align-items: center;
            padding: 30px 20px;
            gap: 30px;
        }

        .form-part {
            padding: 25px;
        }

        .information {
            text-align: center;
        }
    }
</style>

<div class="contact-body">
    
    <%-- SUCCESS MESSAGE CONNECTION --%>
    <c:if test="${not empty successMessage}">
        <div class="alert-success">${successMessage}</div>
    </c:if>

    <div class="contact-container">

        <div class="form-part">
            <%-- CONNECTION: Action and Method match your Servlet --%>
            <form action="${pageContext.request.contextPath}/contact" method="post">
                
                <label for="name">NAME</label>
                <input type="text" id="name" name="name" placeholder="Your Full Name" required>

                <label for="email">EMAIL ADDRESS</label>
                <input type="email" id="email" name="email" placeholder="hello@example.com" required>

                <%-- CONNECTION: Subject field restored to prevent backend errors --%>
                <label for="subject">SUBJECT</label>
                <input type="text" id="subject" name="subject" placeholder="How can we help?" required>

                <label for="message">MESSAGE</label>
                <textarea id="message" name="message" placeholder="How can we help you?" required></textarea>

                <button type="submit" class="btn-submit">Send Message</button>
            </form>
        </div>

        <div class="information">
            <h2 class="topic">The Studio</h2>
            <p>422 Kinky Lane</p>
            <p>Yo Mom District, NP 90210</p>

            <h3>Gallery Hours</h3>
            <p>Tuesday - Saturday: 10:00 - 18:00</p>
            <p>Sunday & Monday</p>

            <h3>Direct</h3>
            <p>inquiries@tactileeditorial.com</p>
            <p>+1 (555) 234-5678</p>
            
            <%-- CONNECTION: Restored social links --%>
            <div style="margin-top: 20px;">
                <a href="#" style="color: #7a5a2f; margin-right: 15px; text-decoration: none;"><i class="fab fa-instagram"></i></a>
                <a href="#" style="color: #7a5a2f; margin-right: 15px; text-decoration: none;"><i class="fab fa-facebook"></i></a>
                <a href="#" style="color: #7a5a2f; text-decoration: none;"><i class="fab fa-pinterest"></i></a>
            </div>
        </div>

    </div>
</div>

<%-- DIRECTIVE STYLE INCLUDE --%>
<%@ include file="/WEB-INF/components/footer.jsp" %>