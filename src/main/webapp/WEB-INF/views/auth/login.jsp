<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In — Origins Clay</title>
    <style>
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

       
        body {
            font-family: Arial, sans-serif;
            background-color: #3a3530;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh; /* Forces body to take full window height */
            padding: 20px;
        }

        
        .card {
            background: #ffffff;
            width: 100%;
            max-width: 420px;
            padding: 40px;
            border: 1px solid #ccc;
        }

      
        .heading {
            font-family: 'Times New Roman', Times, serif;
            font-size: 2.2rem;
            margin-bottom: 5px;
            color: #1a1a1a;
            text-align: center;
        }
        
        .subheading {
            font-size: 0.85rem;
            color: #666666;
            margin-bottom: 25px;
            text-align: center;
        }

        .error-msg {
            color: #b91c1c;
            font-size: 0.8rem;
            margin-bottom: 15px;
            font-weight: bold;
            text-align: center;
        }

        .success-msg {
            color: #51643E;
            font-size: 0.8rem;
            margin-bottom: 15px;
            font-weight: bold;
            text-align: center;
        }

     
        form { 
            display: flex; 
            flex-direction: column; 
            gap: 15px; 
        }

        .field { 
            display: flex; 
            flex-direction: column; 
            gap: 5px; 
        }

        .field label {
            font-size: 0.75rem;
            font-weight: bold;
            color: #333333;
            text-transform: uppercase;
        }

       
        .field input[type="email"],
        .field input[type="password"] {
            font-size: 0.95rem;
            padding: 10px;
            border: 1px solid #999999;
            background-color: #f9f9f9;
            width: 100%;
        }

        .field input:focus {
            outline: 2px solid #51643E;
        }

        
        .options-row {
            margin-top: 5px;
            margin-bottom: 5px;
        }

        .keep-signed {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.8rem;
            color: #333333;
            cursor: pointer;
        }

       
        .submit-btn {
            background-color: #51643E;
            color: #ffffff;
            border: none;
            padding: 12px;
            font-size: 0.9rem;
            font-weight: bold;
            cursor: pointer;
            text-transform: uppercase;
            width: 100%;
            margin-top: 10px;
        }

        .submit-btn:hover { 
            background-color: #3f4f2f; 
        }

        
        .divider {
            border: none;
            border-top: 1px solid #cccccc;
            margin: 25px 0 15px;
        }

       
        .footer-links {
            text-align: center;
            font-size: 0.85rem;
        }

        .footer-links p {
            color: #666666;
            margin-bottom: 10px;
        }

        .footer-links a {
            color: #8a7040;
            text-decoration: none;
            font-weight: bold;
        }

        .footer-links a:hover { 
            text-decoration: underline; 
        }

        .home-link {
            display: block;
            margin-top: 15px;
            font-family: 'Times New Roman', Times, serif;
            font-style: italic;
            font-size: 1rem;
        }
    </style>
</head>
<body>
<div class="card">
    <h2 class="heading">Welcome </h2>
    <p class="subheading"> </p>

    <c:if test="${not empty error}">
        <div class="error-msg">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
        <div class="success-msg">${success}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="field">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="create@gmail.com"
                   value="${rememberedEmail}" autocomplete="username" required>
        </div>
        
        <div class="field">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="••••••••" autocomplete="current-password" required>
        </div>
        
        <div class="options-row">
            <label class="keep-signed">
                <input type="checkbox" name="remember"> Keep me signed in
            </label>
        </div>
        
        <button class="submit-btn" type="submit">Confirm</button>
    </form>

    <hr class="divider">
    
    <div class="footer-links">
        <p>New to the legacy? <a href="${pageContext.request.contextPath}/register">Register Here</a></p>
        <a href="${pageContext.request.contextPath}/home" class="home-link">← Back to Home</a>
    </div>
</div>
</body>
</html>