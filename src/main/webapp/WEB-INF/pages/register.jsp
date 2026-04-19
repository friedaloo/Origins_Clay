<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,400;0,600;1,400;1,600&family=Jost:wght@300;400;500&display=swap" rel="stylesheet">
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
            background-color: #b0aaa4;

            /* Pottery texture background — CSS-only fallback using radial gradients */
            background-image:
                radial-gradient(ellipse at 15% 30%, rgba(80,65,55,0.55) 0%, transparent 50%),
                radial-gradient(ellipse at 85% 20%, rgba(60,55,50,0.45) 0%, transparent 45%),
                radial-gradient(ellipse at 50% 80%, rgba(90,80,70,0.4) 0%, transparent 55%),
                radial-gradient(ellipse at 80% 75%, rgba(70,60,55,0.5) 0%, transparent 40%),
                linear-gradient(160deg, #8a8078 0%, #6e665f 30%, #9a918a 60%, #7a7268 100%);
            background-size: cover;
            background-attachment: fixed;
        }

        /* Card */
        .card {
            background: #ffffff;
            width: 100%;
            max-width: 555px;
            padding: 52px 56px 48px;
            position: relative;
        }

        /* Heading */
        .heading {
            font-family: 'Cormorant Garamond', serif;
            font-size: 2.6rem;
            font-weight: 400;
            line-height: 1.15;
            color: #1a1a1a;
            margin-bottom: 10px;
            letter-spacing: -0.01em;
        }

        .heading em {
            font-style: italic;
            font-weight: 400;
        }

        .heading strong {
            font-style: normal;
            font-weight: 600;
        }

        /* Subheading */
        .subheading {
            font-family: 'Jost', sans-serif;
            font-size: 0.62rem;
            font-weight: 400;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            color: #6b6560;
            margin-bottom: 36px;
        }

        /* Form */
        form {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .field {
            display: flex;
            flex-direction: column;
            gap: 7px;
        }

        .field label {
            font-family: 'Jost', sans-serif;
            font-size: 0.6rem;
            font-weight: 500;
            letter-spacing: 0.2em;
            text-transform: uppercase;
            color: #4a4540;
        }

        .field input {
            font-family: 'Jost', sans-serif;
            font-size: 0.92rem;
            font-weight: 300;
            color: #2a2520;
            background: #E5E2E0;
            border: none;
            outline: none;
            padding: 14px 16px;
            width: 100%;
            border-radius: 0;                       /* pointy edges */
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.08), 0 1px 3px rgba(0,0,0,0.06);
            transition: box-shadow 0.2s ease;
            -webkit-appearance: none;
        }

        .field input::placeholder {
            color: #a09890;
            font-weight: 300;
        }

        .field input:focus {
            box-shadow: inset 0 2px 5px rgba(0,0,0,0.1), 0 0 0 1.5px rgba(81,100,62,0.4);
        }

        /* Password dots */
        .field input[type="password"] {
            letter-spacing: 0.2em;
        }

        /* Submit button */
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
            border-radius: 0;                       /* pointy edges */
            transition: background 0.25s ease;
            width: 100%;
        }

        .submit-btn:hover {
            background: #3f4f2f;
        }

        /* Sign in footer */
        .signin-footer {
            margin-top: 22px;
            text-align: center;
        }

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
            letter-spacing: 0.02em;
        }

        .signin-footer a:hover {
            color: #51643E;
        }

        @media (max-width: 600px) {
            .card {
                padding: 36px 28px 36px;
            }
        }
        .profile-upload-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 10px;
        gap: 15px;
    }

    .image-preview {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        background: #E5E2E0;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        border: 2px dashed #a09890;
        cursor: pointer;
        transition: border-color 0.3s;
    }

    .image-preview:hover {
        border-color: #51643E;
    }

    .image-preview img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .image-preview i {
        font-size: 2rem;
        color: #a09890;
    }

    /* Hide the actual file input but keep it functional */
    #profileImg {
        display: none;
    }

    .upload-label {
        font-family: 'Jost', sans-serif;
        font-size: 0.65rem;
        font-weight: 500;
        letter-spacing: 0.1em;
        text-transform: uppercase;
        color: #8a7040;
        cursor: pointer;
        text-decoration: underline;
    }
    </style>
</head>
<body>

<div class="card">
    <h1 class="heading"><em>Join the</em> <strong>Legacy</strong></h1>
    <p class="subheading">Enter the curated world of handcrafted stoneware</p>

    <form action="${pageContext.request.contextPath}/register" method="post">

        <div class="field">
            <label for="full_name">Full Name</label>
            <input type="text" id="full_name" name="full_name" placeholder="Artisan Name" required>
        </div>

        <div class="field">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email" placeholder="curator@editorial.com" required>
        </div>

        <div class="field">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="••••••••" required>
        </div>
        
        <div class="profile-upload-container">
    <label class="field"><span style="letter-spacing: 0.2em; font-size: 0.6rem;">Your Portrait</span></label>
    <div class="image-preview" onclick="document.getElementById('profileImg').click()">
        <img id="preview-el" src="" alt="" style="display:none;">
        <i id="icon-el" class="fa-solid fa-camera"></i>
    </div>
    <input type="file" id="profileImg" name="profileImg" accept="image/*" onchange="previewImage(this)">
    <label for="profileImg" class="upload-label">Upload your artisan photo</label>
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