<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Origins Clay</title>
    <style> 
         * 
         { 
             margin:0; 
             padding:0; 
             box-sizing:border-box; 
         } 
 
         body 
         { 
             font-family: Arial, sans-serif; 
             background:#ecebdc; 
             color:#222; 
         } 
 
         .big-image 
         { 
             width:100%; 
             height:420px; 
             
         } 
         .big-image img 
         { 
             width:100%; 
             height:100%; 
             object-fit:cover; 
         } 
 
         .about-section 
         { 
             width:100%; 
             padding:40px 20px 80px; 
         } 
 
         .title 
         { 
             text-align:center; 
             margin-bottom:50px; 
         } 
 
         .title h1 
         { 
             font-size:55px; 
             color:#4f8a4f; 
             font-weight:normal; 
             margin-bottom:10px; 
         } 
 
         .title p 
         { 
             max-width:700px; 
             margin:auto; 
             font-size:13px; 
             font-weight:bold; 
             line-height:1.5; 
         } 
 
         .team-container 
         { 
             width:100%; 
             max-width:1100px; 
             margin:auto; 
         } 
 
         .member-right 
         { 
             display:flex; 
             align-items:flex-start; 
             gap:35px; 
             margin-bottom:70px; 
         } 
 
 
         .member-left 
         { 
             display:flex; 
             align-items:flex-start; 
             gap:35px; 
             margin-bottom:70px; 
             flex-direction:row-reverse; 
         } 
 
         .image-box 
         { 
             width:230px; 
             height:250px; 
             background:#4f8a4f; 
             flex-shrink:0; 
         } 
         .image-box img 
         { 
             width:100%; 
             height:100%; 
             object-fit:cover; 
         } 
 
         .content 
         { 
             max-width:420px; 
         } 
 
         .content h2 
         { 
             font-size:36px; 
             font-weight:normal; 
             margin-bottom:12px; 
         } 
 
         .content p 
         { 
             font-size:13px; 
             line-height:1.7; 
             color:#555; 
             margin-bottom:20px; 
         } 
 
         .info 
         { 
             font-size:13px; 
             line-height:1.8; 
         } 
 
 
         @media(max-width:768px) 
         { 
 
             .big-image 
             { 
                 height:250px; 
             } 
 
             .title h1 
             { 
                 font-size:42px; 
             } 
 
             .member-left, 
             .member-right 
             { 
                 flex-direction:column; 
                 align-items:center; 
                 text-align:center; 
             } 
 
             .content 
             { 
                 max-width:100%; 
             } 
 
             .image-box 
             { 
                 width:100%; 
                 max-width:300px; 
             } 
 
         } 
     </style>
</head>
<body>

<jsp:include page="/WEB-INF/components/header.jsp" />

     <div class="big-image"> 
         <img src="${pageContext.request.contextPath}/assets/images/Group.png" alt="Origins Clay Team - Group Photo"> 
     </div> 
 
     <section class="about-section"> 
 
         <div class="title"> 
             <h1>About Us</h1> 
 
             <p> 
                 From concept to deployment, our team creates interactive and relevant digital 
                 experiences that empower brands to exist beyond the confines of the classroom. 
             </p> 
         </div> 
 
         <div class="team-container"> 
             <div class="member-left"> 
 
                 <div class="image-box"> 
                     <img src="${pageContext.request.contextPath}/assets/images/Yathechya.png" alt="Group leader and backend developer"> 
                 </div> 
 
                 <div class="content"> 
                     <h2>Team Lead and backend</h2> 
 
                     <p> 
                         The structural backbone of design thing, ensuring every process is 
                         seamless and every line of code serves a higher purpose in the digital 
                         ecosystem. 
                     </p> 
 
                     <div class="info"> 
                         <strong>Name:</strong> Yathechya Shrestha <br> 
                         <strong>LMU ID:</strong> 24046938 <br> 
                         <strong>College ID:</strong> Np01cp4a240061 
                     </div> 
                 </div> 
 
             </div> 
             <div class="member-right"> 
 
                 <div class="image-box"> 
                     <img src="${pageContext.request.contextPath}/assets/images/Unisha.png" alt="Group member and documenter"> 
                 </div> 
 
                 <div class="content"> 
                     <h2>Documenter</h2> 
 
                     <p> 
                         Bringing a unique classroom experience to life, ensuring every part 
                         of our brand remains vibrant and inspiring across all platforms while 
                         also doing the same in the report. 
                     </p> 
 
                     <div class="info"> 
                         <strong>Name:</strong> Unisha Bhattarai <br> 
                         <strong>LMU ID:</strong> 24046935 <br> 
                         <strong>College ID:</strong> Np01cp4a240288 
                     </div> 
                 </div> 
 
             </div> 
             <div class="member-left"> 
 
                 <div class="image-box"> 
                     <img src="${pageContext.request.contextPath}/assets/images/Ishan.png" alt="UI/UX designer"> 
                 </div> 
 
                 <div class="content"> 
                     <h2>UI/UX designer</h2> 
 
                     <p> 
                         Passionate about making a difference through user-centric design that 
                         creates an intuitive and lasting digital experience. 
                     </p> 
 
                     <div class="info"> 
                         <strong>Name:</strong> Ishan Muni Bajracharya <br> 
                         <strong>LMU ID:</strong> 24046763 <br> 
                         <strong>College ID:</strong> Np01cp4a240210 
                     </div> 
                 </div> 
 
             </div> 
             <div class="member-right"> 
 
                 <div class="image-box"> 
                     <img src="${pageContext.request.contextPath}/assets/images/Prakash.png" alt="Front-end developer"> 
                 </div> 
 
                 <div class="content"> 
                     <h2>Front-end</h2> 
 
                     <p> 
                         Crafting the interface with precision and flair. Pushes creative 
                         energy into every visually captivating detail. 
                     </p> 
 
                     <div class="info"> 
                         <strong>Name:</strong> Prakash Bista <br> 
                         <strong>LMU ID:</strong> 24046948 <br> 
                         <strong>College ID:</strong> np01cp4a240019 
                     </div> 
                 </div> 
 
             </div> 
 
             <div class="member-left"> 
 
                 <div class="image-box"> 
                     <img src="${pageContext.request.contextPath}/assets/images/Saurab.png" alt="Back-end developer"> 
                 </div> 
 
                 <div class="content"> 
                     <h2>Back-end & Database</h2> 
 
                     <p> 
                         Monitoring the data structures that keep the project robust. Ensures 
                         the tools behind the scenes operate with innovation. 
                     </p> 
 
                     <div class="info"> 
                         <strong>Name:</strong> Saurab Shakya <br> 
                         <strong>LMU ID:</strong> 24046880 <br> 
                         <strong>College ID:</strong> Np01cp4a240146 
                     </div> 
                 </div> 
 
             </div> 
 
         </div> 
 
     </section> 

<jsp:include page="/WEB-INF/components/footer.jsp" />

 </body> 
 </html> 
