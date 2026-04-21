<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 — Page Not Found</title>
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
            background-color: #f5f0eb;
            text-align: center;
            padding: 2rem;
        }
        .error-container { max-width: 480px; }
        .error-code {
            font-family: 'Cormorant Garamond', serif;
            font-size: 8rem;
            font-weight: 600;
            color: #51643E;
            line-height: 1;
            margin-bottom: 0.5rem;
        }
        .error-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 1.8rem;
            font-weight: 400;
            color: #3a3530;
            margin-bottom: 1rem;
        }
        .error-desc {
            font-size: 0.88rem;
            color: #7a7268;
            line-height: 1.7;
            margin-bottom: 2rem;
        }
        .btn {
            display: inline-block;
            background: #51643E;
            color: #fff;
            border: none;
            padding: 0.85rem 2rem;
            font-family: 'Jost', sans-serif;
            font-size: 0.68rem;
            font-weight: 500;
            letter-spacing: 0.18em;
            text-transform: uppercase;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.2s;
        }
        .btn:hover { background: #3f4f2f; }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-code">404</div>
        <h1 class="error-title"><em>Lost in the</em> <strong>Kiln</strong></h1>
        <p class="error-desc">
            The page you're looking for seems to have crumbled away.
            It may have been moved, renamed, or doesn't exist.
        </p>
        <a href="${pageContext.request.contextPath}/home" class="btn">Return Home</a>
    </div>
</body>
</html>
