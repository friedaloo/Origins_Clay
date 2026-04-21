<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account — Origins Clay</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,600;1,400;1,600&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Jost', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #b0aaa4;
            background-image:
                radial-gradient(ellipse at 15% 30%, rgba(80,65,55,0.55) 0%, transparent 50%),
                radial-gradient(ellipse at 85% 20%, rgba(60,55,50,0.45) 0%, transparent 45%),
                radial-gradient(ellipse at 50% 80%, rgba(90,80,70,0.4) 0%, transparent 55%),
                linear-gradient(160deg, #8a8078 0%, #6e665f 30%, #9a918a 60%, #7a7268 100%);
            background-attachment: fixed;
            padding: 1rem;
        }
        .card {
            background: #ffffff;
            width: 100%;
            max-width: 555px;
            padding: 52px 56px 48px;
        }
        .heading {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2.6rem;
            font-weight: 400;
            line-height: 1.15;
            color: #1a1a1a;
            margin-bottom: 10px;
        }
        .heading em { font-weight: 400; }
        .heading strong { font-weight: 600; }
        .subheading {
            font-size: 0.62rem;
            font-weight: 400;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            color: #6b6560;
            margin-bottom: 36px;
        }
        .error-msg {
            color: #b91c1c;
            font-size: 0.78rem;
            letter-spacing: 0.04em;
            margin-bottom: 1rem;
            text-transform: uppercase;
        }
        form { display: flex; flex-direction: column; gap: 18px; }
        .row { display: flex; gap: 16px; }
        .row > .field { flex: 1; }
        .field { display: flex; flex-direction: column; gap: 7px; }
        .field label {
            font-size: 0.6rem;
            font-weight: 500;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            color: #4a4540;
        }
        .field input, .field textarea {
            font-family: 'Jost', sans-serif;
            font-size: 0.92rem;
            font-weight: 300;
            color: #2a2520;
            background: #E5E2E0;
            border: none;
            outline: none;
            padding: 14px 16px;
            width: 100%;
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.08), 0 1px 3px rgba(0,0,0,0.06);
            transition: box-shadow 0.2s ease;
            -webkit-appearance: none;
        }
        .field input::placeholder, .field textarea::placeholder { color: #a09890; font-weight: 300; }
        .field input:focus, .field textarea:focus {
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.1), 0 0 0 1.5px rgba(81,100,62,0.4);
        }
        .field input[type="password"] { letter-spacing: 0.2em; }
        .field textarea { resize: vertical; min-height: 60px; }
        .submit-btn {
            margin-top: 6px;
            background: #51643E;
            color: #ffffff;
            border: none;
            padding: 16px;
            font-family: 'Jost', sans-serif;
            font-size: 0.7rem;
            font-weight: 500;
            letter-spacing: 0.22em;
            text-transform: uppercase;
            cursor: pointer;
            transition: background 0.25s ease;
            width: 100%;
        }
        .submit-btn:hover { background: #3f4f2f; }
        .signin-footer { margin-top: 22px; text-align: center; }
        .signin-footer p {
            font-size: 0.6rem;
            letter-spacing: 0.18em;
            text-transform: uppercase;
            color: #7a726c;
            margin-bottom: 5px;
        }
        .signin-footer a {
            font-family: 'Cormorant Garamond', serif;
            font-style: italic;
            font-size: 1.05rem;
            color: #8a7040;
            text-decoration: none;
        }
        .signin-footer a:hover { color: #51643E; }
        .hint {
            font-size: 0.6rem;
            color: #a09890;
            margin-top: -10px;
            letter-spacing: 0.05em;
        }
        @media (max-width: 600px) {
            .card { padding: 36px 28px; }
            .row { flex-direction: column; gap: 18px; }
        }
    </style>
</head>
<body>
<div class="card">
    <h1 class="heading"><em>Join the</em> <strong>Legacy</strong></h1>
    <p class="subheading">Enter the curated world of handcrafted stoneware</p>

    <c:if test="${not empty error}">
        <div class="error-msg">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/register" method="post">
        <div class="row">
            <div class="field">
                <label for="firstName">First Name</label>
                <input type="text" id="firstName" name="firstName" placeholder="First name" required>
            </div>
            <div class="field">
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
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="••••••••" required>
        </div>
        <p class="hint">Min 8 chars — uppercase, lowercase, digit & special character required</p>

        <div class="field">
            <label for="confirmPassword">Confirm Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="••••••••" required>
        </div>

        <button class="submit-btn" type="submit">Create Account</button>
    </form>

    <div class="signin-footer">
        <p>Already part of the atelier?</p>
        <a href="${pageContext.request.contextPath}/login">Sign In</a>
    </div>
</div>
</body>
</html>
