<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
    body 
        {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            flex-wrap: wrap;
        }

        .container 
        {
            display: flex;
            justify-content: center;
            padding: 60px;
            gap: 60px;
        }

        .form-part 
        {
            background-color: #ebe8e4;
            padding: 40px;
            width: 100%;
            max-width: 500px;
            border-radius: 8px;
        }

        form 
        {
            display: flex;
            flex-direction: column;
        }

        label 
        {
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input
        {
            margin-bottom: 25px;
            padding: 14px;
            border: 1px solid #c8c3bd;
            font-size: 14px;
        }
        textarea 
        {
            margin-bottom: 25px;
            padding: 14px;
            border: 1px solid #c8c3bd;
            font-size: 14px;
        }

        textarea 
        {
            height: 120px;
            resize: none;
        }

        button 
        {
            background-color: #7a5a2f;
            color: white;
            padding: 14px;
            width: 100%;
            max-width: 180px;
            border-radius: 6px;
            font-size: 14px;
            transition: 0.3s;
        }

        button:hover 
        {
            background-color: #6ac038;
        }

        .information 
        {
            width: 100%;
            max-width: 300px;
            color: #2e2e2e;
        }

        .topic 
        {
            font-style: italic;
            font-size: 26px;
            margin-bottom: 10px;
        }

        h3 
        {
            font-style: italic;
            margin-top: 30px;
            margin-bottom: 10px;
        }

        p 
        {
            margin: 4px 0px 4px 0px;
            font-size: 14px;
            color: #555;
        }
        @media (max-width: 768px)
        {
            .container
            {
                flex-direction: column;
                align-items: center;
                padding: 30px 20px;
                gap: 30px;
            }

            .form-part
            {
                padding: 25px;
            }

            .information
            {
                text-align: center;
            }
        }
    </style>
</head>
<body>

<div class="container">

    <div class="form-part">
        <form>
            <label>NAME</label>
            <input type="text" placeholder="Your Full Name">

            <label>EMAIL ADDRESS</label>
            <input type="email" placeholder="hello@example.com">

            <label>MESSAGE</label>
            <textarea placeholder="How can we help you?"></textarea>

            <button type="submit">Send Message</button>
        </form>
    </div>
    <div class="information">
        <h2 class="topic">The Studio</h2>
        <p>422 Kinky Lane</p>
        <p>Yo Mom District, NP 90210</p>

        <h3>Gallery Hours</h3>
        <p>Tuesday - Saturday: 10:00 - 18:00</p>
        <p>Sunday & Monday</p>

        <h3>Direct</h3>
        <p>inquiries@tactileeditorial.com</p>
        <p>+1 (555) 234-5678</p>
    </div>

</div>

</body>
</html>
