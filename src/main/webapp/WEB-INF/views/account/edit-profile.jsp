<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %> 
 <%@ taglib prefix="c" uri="jakarta.tags.core" %> 
 
 <jsp:include page="/WEB-INF/components/header.jsp"> 
     <jsp:param name="pageTitle" value="Edit Profile" /> 
 </jsp:include> 
 
 <style> 

     body { 
         font-family: Arial, sans-serif; 
         background: #efeddd; 
     } 
 
     .page-title { 
         font-size: 22px; 
         margin-bottom: 6px; 
         color: #111; 
     } 
 
     .page-title em { 
         font-style: normal; 
         color: #555; 
     } 
 
     .page-subtitle { 
         font-size: 13px; 
         color: #777; 
         margin-bottom: 24px; 
     } 
 
     .alert { 
         padding: 12px 18px; 
         margin-bottom: 16px; 
         font-size: 14px; 
         border-left: 4px solid transparent; 
     } 
 
     .alert-error { 
         background: #fdecea; 
         border-color: #e53935; 
         color: #b71c1c; 
     } 
 
     .card { 
         background: white; 
         padding: 24px; 
         max-width: 600px; 
     } 
 
     .field { 
         margin-bottom: 18px; 
     } 
 
     .field label { 
         display: block; 
         font-size: 13px; 
         font-weight: 600; 
         color: #555; 
         margin-bottom: 6px; 
     } 
 
     .field input { 
         width: 100%; 
         padding: 10px 14px; 
         font-size: 14px; 
         font-family: Arial, sans-serif; 
         border: 1px solid #c8c3bd; 
         background: #faf9f3; 
         color: #222; 
         outline: none; 
     } 
 
     .field input:focus { 
         border-color: #888; 
         background: white; 
     } 
 
     .field small { 
         display: block; 
         font-size: 11px; 
         color: #999; 
         margin-top: 4px; 
     } 
 
     .name-row { 
         display: flex; 
         gap: 16px; 
         flex-wrap: wrap; 
     } 
 
     .name-row .field { 
         flex: 1; 
         min-width: 180px; 
     } 
 
     .form-actions { 
         display: flex; 
         gap: 10px; 
         margin-top: 8px; 
     } 
 
     .btn { 
         padding: 10px 20px; 
         font-size: 14px; 
         font-family: Arial, sans-serif; 
         text-decoration: none; 
         cursor: pointer; 
         border: none; 
         display: inline-block; 
     } 
 
     .btn-primary { 
         background: #111; 
         color: white; 
     } 
 
     .btn-primary:hover { 
         background: #333; 
     } 
 
     .btn-secondary { 
         background: #efeddd; 
         color: #333; 
         border: 1px solid #c8c3bd; 
     } 
 
     .btn-secondary:hover { 
         background: #e2dfc8; 
     } 
 
     @media (max-width: 480px) { 
         .name-row { 
             flex-direction: column; 
         } 
 
         .page-title { 
             font-size: 18px; 
         } 
     } 
 </style> 
 
 <h1 class="page-title"><em>Edit</em> <strong>Profile</strong></h1> 
 <p class="page-subtitle">Update your personal information</p> 
 
 <c:if test="${not empty error}"> 
     <div class="alert alert-error">${error}</div> 
 </c:if> 
 
 <div class="card"> 
     <form action="${pageContext.request.contextPath}/account/edit-profile" method="post" enctype="multipart/form-data"> 
 
         <div class="field"> 
             <label for="username">Username</label> 
             <input type="text" id="username" name="username" value="${user.username}" required> 
         </div> 
 
         <div class="name-row"> 
             <div class="field"> 
                 <label for="firstName">First Name</label> 
                 <input type="text" id="firstName" name="firstName" value="${user.firstName}" required> 
             </div> 
             <div class="field"> 
                 <label for="lastName">Last Name</label> 
                 <input type="text" id="lastName" name="lastName" value="${user.lastName}" required> 
             </div> 
         </div> 
 
         <div class="field"> 
             <label for="email">Email</label> 
             <input type="email" id="email" name="email" value="${user.email}" required> 
         </div> 
 
         <div class="field"> 
             <label for="phone">Phone</label> 
             <input type="text" id="phone" name="phone" value="${user.phone}"> 
         </div> 
 
         <div class="field"> 
             <label for="address">Address</label> 
             <input type="text" id="address" name="address" value="${user.address}"> 
         </div> 
 
         <div class="field"> 
             <label for="profileImage">Profile Picture</label> 
             <input type="file" id="profileImage" name="profileImage" accept="image/*"> 
             <small>Leave empty to keep current picture.</small> 
         </div> 
 
         <div class="form-actions"> 
             <button type="submit" class="btn btn-primary">Save Changes</button> 
             <a href="${pageContext.request.contextPath}/account/profile" class="btn btn-secondary">Cancel</a> 
         </div> 
 
     </form> 
 </div> 
 
 <jsp:include page="/WEB-INF/components/footer.jsp" /> 
