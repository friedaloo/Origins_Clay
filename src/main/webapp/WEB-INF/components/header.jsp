<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.pageTitle} — Origins Clay</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,600;1,400;1,600&family=Jost:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        /* ====== GLOBAL RESET & TOKENS ====== */
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --clay-bg:      #f5f0eb;
            --clay-card:    #ffffff;
            --clay-olive:   #51643E;
            --clay-olive-d: #3f4f2f;
            --clay-brown:   #3a3530;
            --clay-tan:     #b0aaa4;
            --clay-input:   #E5E2E0;
            --clay-muted:   #7a7268;
            --clay-gold:    #8a7040;
            --clay-danger:  #b91c1c;
            --clay-success: #2d6a4f;
            --font-serif:   'Cormorant Garamond', serif;
            --font-sans:    'Jost', sans-serif;
        }

        body {
            font-family: var(--font-sans);
            background: var(--clay-bg);
            color: var(--clay-brown);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        a { color: var(--clay-olive); text-decoration: none; }
        a:hover { color: var(--clay-olive-d); }

        /* ====== NAVBAR ====== */
        .navbar {
            background: var(--clay-brown);
            padding: 0 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 64px;
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .navbar .brand {
            font-family: var(--font-serif);
            font-size: 1.4rem;
            font-weight: 600;
            color: #fff;
            letter-spacing: 0.04em;
        }

        .navbar .brand em { font-weight: 400; opacity: 0.85; }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 1.6rem;
            list-style: none;
        }

        .nav-links a {
            font-size: 0.68rem;
            font-weight: 500;
            letter-spacing: 0.15em;
            text-transform: uppercase;
            color: rgba(255,255,255,0.7);
            transition: color 0.2s;
        }

        .nav-links a:hover,
        .nav-links a.active { color: #fff; }

        .nav-links .badge {
            background: var(--clay-olive);
            color: #fff;
            font-size: 0.55rem;
            padding: 2px 6px;
            margin-left: 4px;
            vertical-align: super;
        }

        /* ====== HAMBURGER (mobile) ====== */
        .hamburger { display: none; background: none; border: none; cursor: pointer; }
        .hamburger span { display: block; width: 22px; height: 2px; background: #fff; margin: 5px 0; transition: 0.3s; }

        @media (max-width: 768px) {
            .hamburger { display: block; }
            .nav-links {
                display: none;
                flex-direction: column;
                position: absolute;
                top: 64px; left: 0; right: 0;
                background: var(--clay-brown);
                padding: 1rem 2rem;
                gap: 1rem;
            }
            .nav-links.open { display: flex; }
        }

        /* ====== MAIN CONTENT ====== */
        .main-content {
            flex: 1;
            padding: 2rem;
            max-width: 1200px;
            width: 100%;
            margin: 0 auto;
        }

        /* ====== COMMON COMPONENTS ====== */
        .page-title {
            font-family: var(--font-serif);
            font-size: 2.2rem;
            font-weight: 400;
            margin-bottom: 0.6rem;
        }
        .page-title em  { font-weight: 400; }
        .page-title strong { font-weight: 600; }

        .page-subtitle {
            font-size: 0.62rem;
            font-weight: 400;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            color: var(--clay-muted);
            margin-bottom: 2rem;
        }

        .btn {
            display: inline-block;
            font-family: var(--font-sans);
            font-size: 0.68rem;
            font-weight: 500;
            letter-spacing: 0.18em;
            text-transform: uppercase;
            padding: 0.75rem 1.6rem;
            border: none;
            cursor: pointer;
            transition: background 0.2s;
        }

        .btn-primary   { background: var(--clay-olive);   color: #fff; }
        .btn-primary:hover { background: var(--clay-olive-d); color: #fff; }
        .btn-secondary { background: var(--clay-input); color: var(--clay-brown); }
        .btn-secondary:hover { background: #d5d0cb; color: var(--clay-brown); }
        .btn-danger    { background: var(--clay-danger);  color: #fff; }
        .btn-danger:hover { background: #991b1b; color: #fff; }
        .btn-sm { padding: 0.5rem 1rem; font-size: 0.6rem; }

        .alert {
            padding: 0.85rem 1.2rem;
            font-size: 0.78rem;
            letter-spacing: 0.04em;
            margin-bottom: 1.4rem;
        }
        .alert-error   { background: #fef2f2; color: var(--clay-danger); border-left: 3px solid var(--clay-danger); }
        .alert-success { background: #f0fdf4; color: var(--clay-success); border-left: 3px solid var(--clay-success); }

        .field { margin-bottom: 1.1rem; }
        .field label {
            display: block;
            font-size: 0.6rem;
            font-weight: 500;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            color: #4a4540;
            margin-bottom: 0.4rem;
        }
        .field input, .field select, .field textarea {
            font-family: var(--font-sans);
            font-size: 0.92rem;
            font-weight: 300;
            color: var(--clay-brown);
            background: var(--clay-input);
            border: none;
            outline: none;
            padding: 0.8rem 1rem;
            width: 100%;
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.08), 0 1px 3px rgba(0,0,0,0.06);
            transition: box-shadow 0.2s;
        }
        .field input:focus, .field select:focus, .field textarea:focus {
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.1), 0 0 0 1.5px rgba(81,100,62,0.4);
        }
        .field textarea { resize: vertical; min-height: 100px; }

        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 0.75rem 1rem; text-align: left; font-size: 0.85rem; }
        th {
            font-size: 0.62rem;
            font-weight: 600;
            letter-spacing: 0.15em;
            text-transform: uppercase;
            color: var(--clay-muted);
            border-bottom: 2px solid var(--clay-input);
        }
        td { border-bottom: 1px solid var(--clay-input); }
        tr:hover td { background: rgba(81,100,62,0.04); }

        .card {
            background: var(--clay-card);
            padding: 2rem;
            box-shadow: 0 2px 12px rgba(0,0,0,0.06);
            margin-bottom: 1.5rem;
        }

        .grid-2 { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 1.5rem; }
        .grid-3 { display: grid; grid-template-columns: repeat(auto-fill, minmax(240px, 1fr)); gap: 1.5rem; }
        .grid-4 { display: grid; grid-template-columns: repeat(4, 1fr); gap: 1.2rem; }
        @media (max-width: 900px) { .grid-4 { grid-template-columns: repeat(2, 1fr); } }
        @media (max-width: 500px) { .grid-4 { grid-template-columns: 1fr; } }

        .status-badge {
            display: inline-block;
            font-size: 0.58rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            padding: 0.3rem 0.7rem;
        }
        .status-pending    { background: #fef9c3; color: #854d0e; }
        .status-processing { background: #dbeafe; color: #1e40af; }
        .status-shipped    { background: #e0e7ff; color: #3730a3; }
        .status-delivered  { background: #dcfce7; color: #166534; }
        .status-cancelled  { background: #fef2f2; color: #991b1b; }
        .status-returned   { background: #fef2f2; color: #991b1b; }

        .product-card {
            background: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.06);
            overflow: hidden;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .product-card:hover { transform: translateY(-3px); box-shadow: 0 6px 20px rgba(0,0,0,0.1); }
        .product-card img { width: 100%; height: 200px; object-fit: cover; background: var(--clay-input); }
        .product-card .info { padding: 1.2rem; }
        .product-card .info h3 { font-family: var(--font-serif); font-size: 1.15rem; font-weight: 600; margin-bottom: 0.3rem; }
        .product-card .info .category-label { font-size: 0.58rem; letter-spacing: 0.15em; text-transform: uppercase; color: var(--clay-muted); }
        .product-card .info .price { font-size: 1rem; font-weight: 500; color: var(--clay-olive); margin-top: 0.5rem; }
        .product-card .actions { padding: 0 1.2rem 1.2rem; display: flex; gap: 0.5rem; }
    </style>
    ${param.extraCSS}
</head>
<body>

<!-- ====== NAVIGATION BAR ====== -->
<nav class="navbar">
    <a href="${pageContext.request.contextPath}/home" class="brand"><em>Origins</em> <strong>Clay</strong></a>

    <button class="hamburger" onclick="document.querySelector('.nav-links').classList.toggle('open')">
        <span></span><span></span><span></span>
    </button>

    <ul class="nav-links">
        <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/products">Shop</a></li>
        <li><a href="${pageContext.request.contextPath}/about">About</a></li>
        <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>

        <c:choose>
            <c:when test="${not empty sessionScope.loggedInUser}">
                <%-- Logged-in links --%>
                <c:if test="${sessionScope.userRole == 'admin'}">
                    <li><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="fa-solid fa-gauge"></i> Dashboard</a></li>
                </c:if>
                <c:if test="${sessionScope.userRole == 'customer'}">
                    <li><a href="${pageContext.request.contextPath}/cart"><i class="fa-solid fa-bag-shopping"></i> Cart</a></li>
                    <li><a href="${pageContext.request.contextPath}/wishlist"><i class="fa-regular fa-heart"></i></a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/account/profile"><i class="fa-regular fa-user"></i> ${sessionScope.loggedInUser.firstName}</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${pageContext.request.contextPath}/login">Sign In</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</nav>

<!-- ====== MAIN CONTENT START ====== -->
<main class="main-content">
