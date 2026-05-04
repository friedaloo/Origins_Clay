<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        body 
        {
            font-family: Arial, sans-serif;
            background: #f3f3f3;
            color: #222;
            margin: 0;
            padding: 0;
        }

        .container 
        {
            max-width: 1171px;
            width: 90%;
            margin: auto;
        }

        .outer-section 
        {
            display: flex;
            justify-content: space-between;
            padding: 80px 0;
            gap: 90px;
        }

        .text-part 
        {
            width: 100%;
            max-width: 521px;
        }

        .desc 
        {
            font-size: 18px;
            color: black;
            margin-bottom: 25px;
            line-height: 1.6;
        }

        .explore 
        {
            background: #5ebe5e;
            color: white;
            border: none;
            padding: 10px 20px;
        }

        .explore:hover 
        {
            background: brown;
            cursor: pointer;
        }

        .overlapping-images 
        {
            position: relative;
            max-width: 600px;
            width: 100%;
        }

        .big-image 
        {
            width: 95%;
            aspect-ratio: 8.7/10;
            background: #ddd;
            border: 2px solid #aaa;
        }

        .small-image 
        {
            width: 25%;
            aspect-ratio: 1/1;
            background: #ddd;
            border: 2px solid #aaa;
            position: absolute;
            top: -60px;
            right: -20px;
        }
        .middle-section 
        {
            display: flex;
            justify-content: space-between;

        }
        #right-text 
        {
            text-decoration: underline;
            font-size: 18px;
        }
        #right-image 
        {
            width: 100%;
            max-width: 630px;
            aspect-ratio: 11/10;
            background: #ddd;
            border: 2px solid #aaa;
        }
        .three-image 
        {
            display: flex;
            justify-content: space-between;
        }
        #left-image 
        {
            max-width: 420px;
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        #top-image
        {
            max-width: 420px;
            width: 100%;
            aspect-ratio: 31/19;
            background: #ddd;
            border: 2px solid #aaa;
        }
        #bottom-image 
        {
            max-width: 420px;
            width: 100%;
            aspect-ratio: 31/19;
            background: #ddd;
            border: 2px solid #aaa;
        }
        @media (max-width: 768px)
        {
            .outer-section
            {
                flex-direction: column;
                gap: 40px;
            }
            .overlapping-images
            {
                margin-top: 30px;
            }
            .middle-section
            {
                flex-direction: row;
                justify-content: space-between;
            }

            .three-image
            {
                flex-wrap: wrap;
                gap: 20px;
            }

            #right-image
            {
                flex: 2;
                width: 100%;
            }

            #left-image
            {
                flex: 1;
                width: 100%;
            }
            #top-image
            {
                aspect-ratio: 31/25;
            }
            #bottom-image
            {
                aspect-ratio: 31/25;
            }
            .small-image
            {
                top: -40px;
                right: -5px;
                width: 30%;
            }
        }

    </style>
</head>

<body>

<div class="container">
    <section class="outer-section">
        <div class="text-part">
            <h1>Object for Slow Living</h1>

            <p class="desc">
                Every piece is hand-thrown in our coastal studio, 
                celebrating the raw texture of stonewarwe and the 
                quiet rhythm of daily rituals.
            </p>

                <button class="explore">Explore</button>
            </div>

        <div class="overlapping-images">
            <div class="big-image"></div>
            <div class="small-image"></div>
        </div>
    </section>
    <p>CURRENT SITUATION</p>
    <section class="middle-section">
        <div id="left-text">
            <h1>FEATURED SERIES</h1>
        </div>
        <div id="right-text">
            <p>View All</p>
        </div>
    </section>
    <section class="three-image">
        <div id="right-image">
        </div>
        <div id="left-image">
            <div id="top-image"></div>
            <div id="bottom-image"></div>
        </div>
    </section>
    
</div>

</body>
</html>
