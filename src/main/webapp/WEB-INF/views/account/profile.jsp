<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<jsp:include page="/WEB-INF/components/header.jsp">
    <jsp:param name="pageTitle" value="My Profile" />
</jsp:include>

<!DOCTYPE html> 
 <html lang="en"> 
     <head> 
     <meta charset="UTF-8"> 
     <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
 
         <style> 
       *{ 
         margin:0; 
         padding:0; 
         box-sizing:border-box; 
         } 
         body 
         { 
             font-family:Arial, sans-serif; 
             background:#efeddd; 
         } 
         .main 
         { 
             width:100%; 
             min-height:100vh; 
             padding:20px 40px; 
             background:#efeddd;
         } 
 
         .title 
         { 
             font-size:18px; 
             margin-bottom:20px; 
             color:black; 
         } 
         .profile-part 
         { 
             display:flex; 
             flex-direction:column; 
             align-items:center; 
             margin-bottom:40px; 
         } 
         .profile 
         { 
             width:220px; 
             height:220px; 
             border-radius:50%; 
             border: 1px solid #c8c3bd; 
             overflow:hidden; 
             background: white;
         } 
 
         .profile img 
         { 
             width:100%; 
             height:100%; 
             object-fit:cover; 
         } 
 
         .change-profile 
         { 
             margin-top:18px; 
         } 
 
         .change-profile a 
         { 
             text-decoration:none; 
             color:#00a2ff; 
             font-size:18px; 
         } 
 
         .fill 
         { 
             width:100%; 
             max-width:1100px; 
             margin:auto; 
         } 
 
         .blank-part 
         { 
             display:flex; 
             align-items:center; 
             margin-bottom:22px; 
             gap:20px; 
             width:100%; 
         } 
 
         .info-box 
         { 
             flex: 1; 
             width: auto; 
             background:white; 
             padding:18px 25px; 
             font-size:20px; 
             color:#222; 
             border: 1px solid #ddd;
         } 
 
         .edit-button 
         { 
             min-width:50px; 
         } 
 
         .edit-button a 
         { 
             text-decoration:none; 
             color:blue; 
             font-size:13px; 
         } 

         .alert {
             padding: 15px;
             margin-bottom: 20px;
             border: 1px solid transparent;
             border-radius: 4px;
             max-width: 1100px;
             margin-left: auto;
             margin-right: auto;
         }
         .alert-success {
             color: #3c763d;
             background-color: #dff0d8;
             border-color: #d6e9c6;
         }
         .alert-error {
             color: #a94442;
             background-color: #f2dede;
             border-color: #ebccd1;
         }

         @media(max-width:768px) 
         { 
 
             .main 
             { 
                 padding:20px; 
             } 
 
             .profile 
             { 
                 width:170px; 
                 height:170px; 
             } 
 
             .change-profile a 
             { 
                 font-size:16px; 
             } 
 
             .blank-part 
             { 
                 flex-direction:column; 
                 align-items:flex-start; 
                 width: 100%; 
                 gap:8px; 
             } 
             .info-box 
             { 
                 width:100%; 
                 font-size:16px; 
                 padding:15px; 
             } 
 
             .edit-button 
             { 
                 margin-left:5px; 
             } 
 
         } 
 
         @media(max-width:480px) 
         { 
 
             .title{ 
                 font-size:16px; 
             } 
 
             .profile 
             { 
                 width:140px; 
                 height:140px; 
             } 
 
             .info-box 
             { 
                 font-size:14px; 
             } 
 
             .change-profile a 
             { 
                 font-size:14px; 
             } 
 
         } 
 
         </style> 
     </head> 
 <body> 
 
 <div class="main"> 

    <c:if test="${not empty success}">
        <div class="alert alert-success">${success}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>
 
     <div class="title"> 
         Personal Info 
     </div> 
     <div class="profile-part"> 
 
         <div class="profile"> 
             <img src="${pageContext.request.contextPath}/account/profile-image" alt="profile" onerror="this.src='https://placehold.co/220x220?text=Profile'"> 
         </div> 
 
         <div class="change-profile"> 
             <a href="${pageContext.request.contextPath}/account/edit-profile">Change Profile</a> 
         </div> 
 
     </div> 
 
     <!-- INFO --> 
     <div class="fill"> 
 
         <div class="blank-part"> 
             <input class="info-box" value="${user.username}" placeholder="Username" readonly></input> 
             <div class="edit-button"> 
                 <a href="${pageContext.request.contextPath}/account/edit-profile">Edit</a> 
             </div> 
         </div> 
 
         <div class="blank-part"> 
             <input class="info-box" value="${user.email}" placeholder="Email" readonly></input> 
             <div class="edit-button"> 
                 <a href="${pageContext.request.contextPath}/account/edit-profile">Edit</a> 
             </div> 
         </div> 
 
         <div class="blank-part"> 
             <input class="info-box" type="password" value="********" placeholder="password" readonly></input> 
             <div class="edit-button"> 
                 <a href="${pageContext.request.contextPath}/account/change-password">Edit</a> 
             </div> 
         </div> 
 
         <div class="blank-part"> 
             <input class="info-box" value="${user.firstName}" placeholder="First Name" readonly></input> 
             <div class="edit-button"> 
                 <a href="${pageContext.request.contextPath}/account/edit-profile">Edit</a> 
             </div> 
         </div> 
 
         <div class="blank-part"> 
             <input class="info-box" value="${user.lastName}" placeholder="Last Name" readonly></input> 
             <div class="edit-button"> 
                 <a href="${pageContext.request.contextPath}/account/edit-profile">Edit</a> 
             </div> 
         </div> 
         <div class="blank-part"> 
             <input class="info-box" type="tel" value="${not empty user.phone ? user.phone : ''}" placeholder="Phone Number" readonly></input> 
             <div class="edit-button"> 
                 <a href="${pageContext.request.contextPath}/account/edit-profile">Edit</a> 
             </div> 
         </div> 
 
     </div> 
 
 </div> 
 
 </body> 
 </html> 

<jsp:include page="/WEB-INF/components/footer.jsp" />
