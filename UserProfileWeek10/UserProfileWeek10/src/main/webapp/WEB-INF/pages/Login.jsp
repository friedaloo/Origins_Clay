<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: linear-gradient(135deg, #ffffff 0%, #e2e8f0 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
            color: #0f172a;
        }

        .layout {
            display: flex;
            width: 100%;
            max-width: 950px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 20px 40px -10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-height: 95vh;
        }

        .left-panel {
            flex: 1;
            background: linear-gradient(145deg, #0f172a 0%, #1e293b 100%);
            color: #ffffff;
            padding: 2.5rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .title span { color: #6366f1; }

        .tagline {
            font-size: 1rem;
            color: #94a3b8;
        }

        .right-panel {
            flex: 1.5;
            padding: 2rem 2.5rem;
        }

        .form-card h2 {
            font-size: 1.5rem;
            margin-bottom: 0.25rem;
        }

        .subtitle {
            color: #64748b;
            font-size: 0.875rem;
            margin-bottom: 1.5rem;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 0.85rem;
        }

        .field label {
            font-size: 0.75rem;
            font-weight: 600;
            color: #475569;
            margin-bottom: 0.3rem;
            display: block;
        }

        .input-wrap {
            position: relative;
        }

        .input-wrap i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
        }

        .input-wrap input {
            width: 100%;
            padding: 0.65rem 1rem 0.65rem 2.5rem;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            font-size: 0.85rem;
            background: #f8fafc;
        }

        .submit-btn {
            margin-top: 0.5rem;
            background: #6366f1;
            color: #ffffff;
            padding: 0.85rem;
            border: none;
            border-radius: 10px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
        }

        .error {
            color: red;
            font-size: 0.85rem;
            margin-bottom: 0.5rem;
        }

        .register-link {
            margin-top: 1rem;
            font-size: 0.85rem;
            text-align: center;
        }

        .register-link a {
            color: #6366f1;
            text-decoration: none;
            font-weight: 600;
        }

        @media (max-width: 800px) {
            .layout { flex-direction: column; }
            .left-panel { display: none; }
        }
    </style>
</head>
<body>

<div class="layout">
    <div class="left-panel">
        <h1 class="title">Welcome <span>Back</span></h1>
        <p class="tagline">Login to continue your journey.</p>
    </div>

    <div class="right-panel">
        <div class="form-card">
            <h2>Login</h2>
            <p class="subtitle">Enter your credentials</p>

            <!-- ERROR MESSAGE -->
            <c:if test="${not empty error}">
                <div class="error">${error}</div>
            </c:if>

            <form action="<%= request.getContextPath() %>/login" method="post">

                <div class="field">
                    <label>Username</label>
                    <div class="input-wrap">
                        <i class="fa fa-user"></i>
                        <input type="text" name="username" required>
                    </div>
                </div>

                <div class="field">
                    <label>Password</label>
                    <div class="input-wrap">
                        <i class="fa fa-lock"></i>
                        <input type="password" name="password" required>
                    </div>
                </div>

                <button class="submit-btn" type="submit">
                    Login <i class="fa fa-arrow-right"></i>
                </button>
            </form>

            <div class="register-link">
                Don’t have an account? 
                <a href="${pageContext.request.contextPath}/register">Sign Up</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>