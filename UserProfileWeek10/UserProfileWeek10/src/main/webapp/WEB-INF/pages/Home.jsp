<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
	* {
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	}
	
	body {
	    font-family: 'Poppins', sans-serif;
	    background: linear-gradient(135deg, #667eea, #764ba2);
	    min-height: 100vh;
	    color: #fff;
	}
	
	/* NAVBAR */
	.navbar {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding: 15px 40px;
	    background: rgba(0,0,0,0.2);
	    backdrop-filter: blur(10px);
	}
	
	.logo {
	    font-size: 20px;
	    font-weight: 600;
	}
	
	.menu {
	    display: flex;
	    gap: 15px;
	}
	
	.menu a {
	    text-decoration: none;
	    color: white;
	    font-size: 14px;
	    padding: 8px 14px;
	    border-radius: 8px;
	    transition: 0.3s;
	}
	
	.menu a:hover {
	    background: rgba(255,255,255,0.2);
	}
	
	/* Special buttons */
	.logout {
	    background: #ef4444;
	}
	
	.login {
	    background: #22c55e;
	}
	
	.register {
	    background: #6366f1;
	}

	.logout:hover { background: #dc2626; }
	.login:hover { background: #16a34a; }
	.register:hover { background: #4f46e5; }

	/* CONTENT */
	.container {
	    text-align: center;
	    margin-top: 100px;
	}
	
	h1 {
	    font-size: 32px;
	    margin-bottom: 10px;
	}
	
	p {
	    opacity: 0.8;
	}
</style>

</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">
        <i class="fa fa-graduation-cap"></i> Student System
    </div>

    <div class="menu">

       
        <a href="${pageContext.request.contextPath}/home">
            <i class="fa fa-home"></i> Home
        </a>

        <!-- if user is logged in-->
        <c:if test="${not empty sessionScope.username}">
            <a href="${pageContext.request.contextPath}/students">
                <i class="fa fa-users"></i> Students
            </a>
            <a href="${pageContext.request.contextPath}/userProfile">
                <i class="fa fa-user"></i> Profile
            </a>

            <a href="${pageContext.request.contextPath}/logout" class="logout">
                <i class="fa fa-right-from-bracket"></i> Logout
            </a>
        </c:if>

        <!--  IF user not logged in -->
        <c:if test="${empty sessionScope.username}">
            <a href="${pageContext.request.contextPath}/login" class="login">
                <i class="fa fa-right-to-bracket"></i> Login
            </a>

            <a href="${pageContext.request.contextPath}/register" class="register">
                <i class="fa fa-user-plus"></i> Register
            </a>
        </c:if>

    </div>
</div>

<!-- CONTENT -->
<div class="container">
    <h1>Welcome </h1>

    <c:if test="${not empty sessionScope.username}">
        <p>Welcome, ${sessionScope.username}</p>
    </c:if>

    <c:if test="${empty sessionScope.username}">
        <p>Please login or register to continue</p>
    </c:if>
</div>

</body>
</html>