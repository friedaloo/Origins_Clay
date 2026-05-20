<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In — Origins Clay</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,600;1,400&family=Jost:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Jost', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #3a3530;
            background-image:
                radial-gradient(ellipse at 20% 50%, rgba(90,80,65,0.6) 0%, transparent 60%),
                radial-gradient(ellipse at 80% 30%, rgba(50,45,38,0.8) 0%, transparent 55%),
                repeating-linear-gradient(105deg, transparent, transparent 2px, rgba(255,255,255,0.012) 2px, rgba(255,255,255,0.012) 4px);
            padding: 1rem;
        }
        .card {
            background: #ffffff;
            padding: 3rem 3rem 2.5rem;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 8px 40px rgba(0,0,0,0.35);
        }
        .error-msg {
            color: #b91c1c;
            font-size: 0.78rem;
            letter-spacing: 0.04em;
            margin-bottom: 1.2rem;
            text-transform: uppercase;
        }
        .success-msg {
            color: #2d6a4f;
            font-size: 0.78rem;
            letter-spacing: 0.04em;
            margin-bottom: 1.2rem;
            text-transform: uppercase;
        }
        .field-label {
            display: block;
            font-size: 0.68rem;
            font-weight: 600;
            letter-spacing: 0.12em;
            color: #3a3530;
            text-transform: uppercase;
            margin-bottom: 0.45rem;
        }
        .field { margin-bottom: 1.25rem; }
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            background: #E5E2E0;
            border: none;
            padding: 0.85rem 1rem;
            font-family: 'Jost', sans-serif;
            font-size: 0.9rem;
            color: #3a3530;
            outline: none;
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.10), inset 0 1px 2px rgba(0,0,0,0.08);
            transition: box-shadow 0.2s ease;
        }
        input::placeholder { color: #a09890; font-size: 0.88rem; }
        input:focus {
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.13), inset 0 1px 2px rgba(0,0,0,0.10), 0 0 0 1px #51643E44;
        }
        .options-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.6rem;
        }
        .keep-signed {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
        }
        .keep-signed input[type="checkbox"] {
            width: 14px; height: 14px;
            border: 1.5px solid #888;
            appearance: none; -webkit-appearance: none;
            background: #fff;
            cursor: pointer;
            position: relative;
            flex-shrink: 0;
            box-shadow: none;
            padding: 0;
        }
        .keep-signed input[type="checkbox"]:checked {
            background: #51643E;
            border-color: #51643E;
        }
        .keep-signed input[type="checkbox"]:checked::after {
            content: '';
            position: absolute;
            left: 3px; top: 0px;
            width: 5px; height: 9px;
            border: 2px solid #fff;
            border-top: none; border-left: none;
            transform: rotate(45deg);
        }
        .keep-signed span {
            font-size: 0.68rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: #5a5248;
        }
        .submit-btn {
            display: block;
            width: 100%;
            background: #51643E;
            color: #ffffff;
            border: none;
            padding: 1rem;
            font-family: 'Jost', sans-serif;
            font-size: 0.78rem;
            font-weight: 600;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            cursor: pointer;
            transition: background 0.2s ease;
        }
        .submit-btn:hover { background: #3f4f2f; }
        .divider { border: none; border-top: 1px solid #ddd; margin: 1.8rem 0 1.4rem; }
        .register-row {
            text-align: center;
            font-size: 0.68rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: #7a7268;
        }
        .register-row a { color: #7a7268; text-decoration: none; }
        .register-row a:hover { color: #51643E; }
        .home-link {
            display: block;
            text-align: center;
            margin-top: 1.2rem;
            font-family: 'Cormorant Garamond', serif;
            font-style: italic;
            font-size: 0.95rem;
            color: #8a7040;
            text-decoration: none;
        }
        .home-link:hover { color: #51643E; }
        @media (max-width: 500px) { .card { padding: 2rem 1.5rem; } }
    </style>
</head>
<body>
<div class="card">
    <h2 class="heading" style="text-align:center; font-family: 'Cormorant Garamond', serif; margin-bottom: 0.5rem;">Welcome</h2>
    <p class="subheading" style="text-align:center; font-size: 0.75rem; color: #7a7268; margin-bottom: 2rem;">Sign in to your account</p>

    <c:if test="${not empty error}">
        <div class="error-msg">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
        <div class="success-msg">${success}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="field">
            <label class="field-label" for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="curator@editorial.com"
                   value="${rememberedEmail}" autocomplete="username">
        </div>
        <div class="field">
            <label class="field-label" for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="••••••••" autocomplete="current-password">
        </div>
        <div class="options-row">
            <label class="keep-signed">
                <input type="checkbox" name="remember">
                <span>Keep me signed in</span>
            </label>
        </div>
        <button class="submit-btn" type="submit">Confirm</button>
    </form>

    <hr class="divider">
    <div class="register-row">
        <a href="${pageContext.request.contextPath}/register">New to our collection?</a>
    </div>
    <a href="${pageContext.request.contextPath}/home" class="home-link">← Back to Home</a>
</div>
</body>
</html>
