<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %> 
 <%@ taglib prefix="c" uri="jakarta.tags.core" %> 
 
 <jsp:include page="/WEB-INF/components/header.jsp"> 
     <jsp:param name="pageTitle" value="Change Password" /> 
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
 
     .alert-success { 
         background: #e8f5e9; 
         border-color: #4caf50; 
         color: #2e7d32; 
     } 
 
     .alert-error { 
         background: #fdecea; 
         border-color: #e53935; 
         color: #b71c1c; 
     } 
 
     .card { 
         background: white; 
         padding: 24px; 
         max-width: 480px; 
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
 
     .field-hint { 
         font-size: 11px; 
         color: #999; 
         margin-top: -12px; 
         margin-bottom: 18px; 
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
         .page-title { 
             font-size: 18px; 
         } 
 
         .form-actions { 
             flex-direction: column; 
         } 
     } 
 </style> 
 
 <h1 class="page-title"><em>Change</em> <strong>Password</strong></h1> 
 <p class="page-subtitle">Keep your account secure</p> 
 
 <c:if test="${not empty success}"> 
     <div class="alert alert-success">${success}</div> 
 </c:if> 
 <c:if test="${not empty error}"> 
     <div class="alert alert-error">${error}</div> 
 </c:if> 
 
 <div class="card"> 
     <form action="${pageContext.request.contextPath}/account/change-password" method="post"> 
 
         <div class="field"> 
             <label for="currentPassword">Current Password</label> 
             <input type="password" id="currentPassword" name="currentPassword" placeholder="••••••••" required> 
         </div> 
 
         <div class="field"> 
             <label for="newPassword">New Password</label> 
             <input type="password" id="newPassword" name="newPassword" placeholder="••••••••" required> 
         </div> 
         <p class="field-hint">Min 8 chars — uppercase, lowercase, digit &amp; special character required</p> 
 
         <div class="field"> 
             <label for="confirmPassword">Confirm New Password</label> 
             <input type="password" id="confirmPassword" name="confirmPassword" placeholder="••••••••" required> 
         </div> 
 
         <div class="form-actions"> 
             <button type="submit" class="btn btn-primary">Update Password</button> 
             <a href="${pageContext.request.contextPath}/account/profile" class="btn btn-secondary">Cancel</a> 
         </div> 
 
     </form> 
 </div> 
 
 <jsp:include page="/WEB-INF/components/footer.jsp" /> 
