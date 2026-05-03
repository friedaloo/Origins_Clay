<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    
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
            padding: 1rem; /* Reduced outer padding */
            color: #0f172a;
        }

        .layout {
            display: flex;
            width: 100%;
            max-width: 950px; /* Narrowed width slightly */
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 20px 40px -10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            max-height: 95vh; /* Prevents overflow of the container itself */
        }

        .left-panel {
            flex: 1;
            background: linear-gradient(145deg, #0f172a 0%, #1e293b 100%);
            color: #ffffff;
            padding: 2.5rem; /* Reduced padding */
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .title {
            font-size: 2.5rem; /* Smaller title */
            font-weight: 700;
            line-height: 1.1;
            margin-bottom: 1rem;
        }

        .title span { color: #6366f1; }

        .tagline {
            font-size: 1rem;
            color: #94a3b8;
            line-height: 1.5;
        }

        .right-panel {
            flex: 1.5;
            padding: 2rem 2.5rem; /* Reduced padding from 4rem */
            background: #ffffff;
        }

        .form-card h2 {
            font-size: 1.5rem; /* Smaller heading */
            margin-bottom: 0.25rem;
        }

        .subtitle {
            color: #64748b;
            font-size: 0.875rem;
            margin-bottom: 1.5rem; /* Reduced margin */
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 0.85rem; /* Significantly reduced gap between rows */
        }

        .row {
            display: flex;
            gap: 1rem;
        }

        .row > .field { flex: 1; }

        .field label {
            display: block;
            font-size: 0.75rem; /* Smaller labels */
            font-weight: 600;
            color: #475569;
            margin-bottom: 0.3rem;
        }

        .input-wrap {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-wrap i {
            position: absolute;
            left: 1rem;
            color: #94a3b8;
            font-size: 0.9rem;
        }

        .input-wrap input,
        .input-wrap select {
            width: 100%;
            padding: 0.65rem 1rem 0.65rem 2.5rem; /* Slimmer inputs */
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            font-size: 0.85rem;
            background: #f8fafc;
        }

        .submit-btn {
            margin-top: 0.5rem;
            background: #6366f1;
            color: #ffffff;
            padding: 0.85rem; /* Slimmer button */
            border: none;
            border-radius: 10px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        @media (max-width: 800px) {
            .layout { flex-direction: column; max-height: none; }
            .left-panel { display: none; } /* Hide panel on mobile to save space */
            .right-panel { padding: 1.5rem; }
        }
    </style>
</head>
<body>

<div class="layout">
    <div class="left-panel">
        <div class="left-inner">
            <h1 class="title">Sign <span>Up</span></h1>
            <p class="tagline">Join our creative learning space.</p>
        </div>
    </div>

    <div class="right-panel">
        <div class="form-card">
            <h2>Create Your Account</h2>
            <p class="subtitle">Enter your details to get started</p>

            <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="field">
                        <label>First Name</label>
                        <div class="input-wrap">
                            <i class="fa fa-user"></i>
                            <input type="text" name="first_name" placeholder="John" required>
                        </div>
                    </div>
                    <div class="field">
                        <label>Last Name</label>
                        <div class="input-wrap">
                            <i class="fa fa-user"></i>
                            <input type="text" name="last_name" placeholder="Doe" required>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="field">
                        <label>Username</label>
                        <div class="input-wrap">
                            <i class="fa fa-user-circle"></i>
                            <input type="text" name="username" placeholder="johndoe" required>
                        </div>
                    </div>
                    <div class="field">
                        <label>Email</label>
                        <div class="input-wrap">
                            <i class="fa fa-envelope"></i>
                            <input type="email" name="email" placeholder="name@example.com" required>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="field">
                        <label>Birthday</label>
                        <div class="input-wrap">
                            <i class="fa fa-calendar-days"></i>
                            <input type="date" name="dob" required>
                        </div>
                    </div>
                    <div class="field">
                        <label>Gender</label>
                        <div class="input-wrap">
                            <i class="fa fa-venus-mars"></i>
                            <select name="gender" required>
                                <option disabled selected>Select</option>
                                <option>Male</option>
                                <option>Female</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="field">
                        <label>Phone Number</label>
                        <div class="input-wrap">
                            <i class="fa fa-phone"></i>
                            <input type="tel" name="number" placeholder="+977..." required>
                        </div>
                    </div>
                    <div class="field">
                        <label>Program</label>
                        <div class="input-wrap">
                            <i class="fa fa-book-open"></i>
                            <select name="program" required>
                                <option disabled selected>Select Program</option>
                                <option value="2">Computing</option>
                                <option value="5">Multimedia</option>
                                <option value="6">Networking</option>
                            </select>
                        </div>
                    </div>
                </div>
                
                <div class="field">
                    <label>Image</label>
                    <div class="input-wrap">
                        <i class="fa fa-image"></i>
                        <input type="file" name="image" accept="image/*" required>
                    </div>
                </div>

                <div class="field">
                    <label>Password</label>
                    <div class="input-wrap">
                        <i class="fa fa-lock"></i>
                        <input type="password" name="password" placeholder="••••••••" required>
                    </div>
                </div>

                <button class="submit-btn" type="submit">
                    Create Account <i class="fa fa-arrow-right"></i>
                </button>
            </form>
        </div>
    </div>
</div>

</body>
</html>