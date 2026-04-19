<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,600;1,400&family=Jost:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Jost', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;

            /* 
                Background: replace the URL below with your actual pottery image path.
                Example: background-image: url('${pageContext.request.contextPath}/images/pottery-bg.jpg');
            */
            background-color: #3a3530;
            background-image:
                radial-gradient(ellipse at 20% 50%, rgba(90,80,65,0.6) 0%, transparent 60%),
                radial-gradient(ellipse at 80% 30%, rgba(50,45,38,0.8) 0%, transparent 55%),
                repeating-linear-gradient(
                    105deg,
                    transparent,
                    transparent 2px,
                    rgba(255,255,255,0.012) 2px,
                    rgba(255,255,255,0.012) 4px
                );
            background-size: cover;
            background-position: center;
            padding: 1rem;
        }

        /* ── Card ── */
        .card {
            background: #ffffff;
            border-radius: 0;           /* pointy / sharp edges */
            padding: 3rem 3rem 2.5rem;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 8px 40px rgba(0, 0, 0, 0.35);
        }

        /* ── Error banner ── */
        .error-msg {
            color: #b91c1c;
            font-size: 0.78rem;
            letter-spacing: 0.04em;
            margin-bottom: 1.2rem;
            text-transform: uppercase;
        }

        /* ── Field labels ── */
        .field-label {
            display: block;
            font-size: 0.68rem;
            font-weight: 600;
            letter-spacing: 0.12em;
            color: #3a3530;
            text-transform: uppercase;
            margin-bottom: 0.45rem;
        }

        /* ── Inputs ── */
        .field {
            margin-bottom: 1.25rem;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            background: #E5E2E0;
            border: none;
            border-radius: 0;           /* pointy edges */
            padding: 0.85rem 1rem;
            font-family: 'Jost', sans-serif;
            font-size: 0.9rem;
            color: #3a3530;
            outline: none;
            box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.10),
                        inset 0 1px 2px rgba(0, 0, 0, 0.08);
            transition: box-shadow 0.2s ease;
        }

        input[type="text"]::placeholder,
        input[type="email"]::placeholder,
        input[type="password"]::placeholder {
            color: #a09890;
            font-size: 0.88rem;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.13),
                        inset 0 1px 2px rgba(0, 0, 0, 0.10),
                        0 0 0 1px #51643E44;
        }

        /* ── Checkbox row ── */
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
            width: 14px;
            height: 14px;
            border: 1.5px solid #888;
            border-radius: 0;
            appearance: none;
            -webkit-appearance: none;
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
            left: 3px;
            top: 0px;
            width: 5px;
            height: 9px;
            border: 2px solid #fff;
            border-top: none;
            border-left: none;
            transform: rotate(45deg);
        }

        .keep-signed span {
            font-size: 0.68rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: #5a5248;
        }

        .forgot-link {
            font-size: 0.68rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: #51643E;
            text-decoration: none;
        }

        .forgot-link:hover {
            text-decoration: underline;
        }

        /* ── Submit button ── */
        .submit-btn {
            display: block;
            width: 100%;
            background: #51643E;
            color: #ffffff;
            border: none;
            border-radius: 0;           /* pointy edges */
            padding: 1rem;
            font-family: 'Jost', sans-serif;
            font-size: 0.78rem;
            font-weight: 600;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            cursor: pointer;
            transition: background 0.2s ease, opacity 0.2s ease;
        }

        .submit-btn:hover {
            background: #3f4f2f;
        }

        /* ── Divider ── */
        .divider {
            border: none;
            border-top: 1px solid #ddd;
            margin: 1.8rem 0 1.4rem;
        }

        /* ── Bottom register link ── */
        .register-row {
            text-align: center;
            font-size: 0.68rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: #7a7268;
        }

        .register-row a {
            color: #7a7268;
            text-decoration: none;
        }

        .register-row a:hover {
            color: #51643E;
        }
    </style>
</head>
<body>

<div class="card">

    <!-- ERROR MESSAGE (kept from original backend integration) -->
    <c:if test="${not empty error}">
        <div class="error-msg">${error}</div>
    </c:if>

    <form action="<%= request.getContextPath() %>/login" method="post">

        <!-- EMAIL field (name="username" kept for backend compatibility) -->
        <div class="field">
            <label class="field-label" for="username">Email</label>
            <input
                type="text"
                id="username"
                name="username"
                placeholder="curator@editorial.com"
                autocomplete="username"
            >
        </div>

        <!-- PASSWORD field -->
        <div class="field">
            <label class="field-label" for="password">Password</label>
            <input
                type="password"
                id="password"
                name="password"
                placeholder="••••••••"
                autocomplete="current-password"
            >
        </div>

        <!-- Keep signed in + Forgot password -->
        <div class="options-row">
            <label class="keep-signed">
                <input type="checkbox" name="rememberMe">
                <span>Keep me signed in</span>
            </label>
            <a class="forgot-link" href="${pageContext.request.contextPath}/forgot-password">Forgot password?</a>
        </div>

        <!-- Submit -->
        <button class="submit-btn" type="submit">Confirm</button>

    </form>

    <hr class="divider">

    <div class="register-row">
        <a href="${pageContext.request.contextPath}/register">New to our collection?</a>
    </div>

</div>

</body>
</html>