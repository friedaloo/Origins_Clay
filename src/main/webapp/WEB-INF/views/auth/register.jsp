<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account — Origins Clay</title>
    <style>
        
        * { 
            box-sizing: border-box; 
            margin: 0; 
            padding: 0; 
        }
        
       
        body {
            font-family: Arial, sans-serif; 
            background-color: #3e3730;     
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;             
            margin: 0;                     
            padding: 20px;                 
            box-sizing: border-box;
        }
        
   
        .card {
            background: #ffffff;
            width: 100%;
            max-width: 500px;
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
        
        .field input {
            font-size: 0.95rem;
            padding: 10px;
            border: 1px solid #999999;
            background-color: #f9f9f9;
            width: 100%;
        }
        
        .field input:focus {
            outline: 2px solid #51643E;
        }
        
        .hint {
            font-size: 0.7rem;
            color: #777777;
            margin-top: -5px;
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
        
        .signin-footer { 
            margin-top: 20px; 
            text-align: center; 
            font-size: 0.85rem;
        }
        
        .signin-footer a {
            color: #8a7040;
            text-decoration: none;
            font-weight: bold;
        }
        
        .signin-footer a:hover { 
            text-decoration: underline; 
        }

        .home-link {
            display: block;
            margin-top: 15px;
            font-family: 'Times New Roman', Times, serif;
            font-style: italic;
            font-size: 1rem;
            text-align: center;
            color: #8a7040;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="card">
    <h1 class="heading">Join the Legacy</h1>
    <p class="subheading">Create your account to start collecting.</p>

    <c:if test="${not empty error}">
        <div class="error-msg">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
        
        <div class="field">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" placeholder="Choose a username" required>
        </div>
        
        <div style="display: flex; gap: 10px;">
            <div class="field" style="flex: 1;">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" placeholder="First name" required>
            </div>
            
            <div class="field" style="flex: 1;">
                <label for="lastName">Last Name</label>
                <input type="text" id="lastName" name="lastName" placeholder="Last name" required>
            </div>
        </div>

        <div class="field">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="curator@editorial.com" required>
        </div>

        <div class="field">
            <label for="phone">Phone Number</label>
            <input type="text" id="phone" name="phone" placeholder="+977-98XXXXXXXX">
        </div>

        <div class="field">
            <label for="address">Address</label>
            <input type="text" id="address" name="address" placeholder="City, Country">
        </div>

        <div class="field">
            <label for="image">Profile Image</label>
            <input type="file" id="image" name="image" accept="image/*">
        </div>

        <div class="field">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="••••••••" required>
            <p class="hint">Min 8 chars: uppercase, lowercase, digit & special character</p>
        </div>

        <div class="field">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="••••••••" required>
        </div>

        <button class="submit-btn" type="submit">Create Account</button>
    </form>

    <div class="signin-footer">
        <p>Already part of us? <a href="${pageContext.request.contextPath}/login">Sign In</a></p>
        <a href="${pageContext.request.contextPath}/home" class="home-link">← Back to Home</a>
    </div>
</div>
</body>
</html>
