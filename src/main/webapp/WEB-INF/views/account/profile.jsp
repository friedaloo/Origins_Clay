<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %> 
 <%@ taglib prefix="c" uri="jakarta.tags.core" %> 
 
 <jsp:include page="/WEB-INF/components/header.jsp"> 
     <jsp:param name="pageTitle" value="My Profile" /> 
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
 
     .page-title strong { 
         font-weight: 700; 
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
 
     .profile-layout { 
         display: flex; 
         flex-wrap: wrap; 
         gap: 24px; 
     } 
 
     .profile-main { 
         flex: 2; 
         min-width: 300px; 
     } 
 
     .profile-sidebar { 
         flex: 1; 
         min-width: 220px; 
     } 
 
     .card { 
         background: white; 
         padding: 24px; 
     } 
 
     .profile-header { 
         display: flex; 
         align-items: center; 
         gap: 20px; 
         margin-bottom: 24px; 
     } 
 
     .profile-avatar { 
         width: 100px; 
         height: 100px; 
         overflow: hidden; 
         border: 1px solid #c8c3bd; 
         flex-shrink: 0; 
     } 
 
     .profile-avatar img { 
         width: 100%; 
         height: 100%; 
         object-fit: cover; 
     } 
 
     .profile-name { 
         font-size: 22px; 
         font-weight: 700; 
         color: #111; 
         margin-bottom: 4px; 
     } 
 
     .profile-username { 
         font-size: 13px; 
         color: #888; 
         margin-bottom: 4px; 
     } 
 
     .profile-meta { 
         font-size: 11px; 
         letter-spacing: 2px; 
         text-transform: uppercase; 
         color: #999; 
     } 
 
     table { 
         width: 100%; 
         border-collapse: collapse; 
     } 
 
     table th, 
     table td { 
         padding: 10px 12px; 
         font-size: 14px; 
         text-align: left; 
         border-bottom: 1px solid #f0ede0; 
     } 
 
     table th { 
         width: 140px; 
         color: #777; 
         font-weight: 600; 
     } 
 
     table td { 
         color: #222; 
     } 
 
     .actions-label { 
         font-size: 11px; 
         font-weight: 600; 
         letter-spacing: 2px; 
         text-transform: uppercase; 
         color: #999; 
         margin-bottom: 14px; 
     } 
 
     .actions-list { 
         display: flex; 
         flex-direction: column; 
         gap: 8px; 
     } 
 
     .btn { 
         display: block; 
         padding: 10px 16px; 
         font-size: 14px; 
         text-decoration: none; 
         text-align: center; 
         cursor: pointer; 
         border: none; 
         font-family: Arial, sans-serif; 
     } 
 
     .btn-secondary { 
         background: #efeddd; 
         color: #333; 
         border: 1px solid #c8c3bd; 
     } 
 
     .btn-secondary:hover { 
         background: #e2dfc8; 
     } 
 
     .btn-primary { 
         background: #111; 
         color: white; 
     } 
 
     .btn-primary:hover { 
         background: #333; 
     } 
 
     @media (max-width: 600px) { 
         .profile-layout { 
             flex-direction: column; 
         } 
 
         .profile-header { 
             flex-direction: column; 
             align-items: flex-start; 
         } 
 
         .page-title { 
             font-size: 18px; 
         } 
     } 
 </style> 
 
 <h1 class="page-title"><em>My</em> <strong>Profile</strong></h1> 
 <p class="page-subtitle">Your account details</p> 
 
 <c:if test="${not empty success}"> 
     <div class="alert alert-success">${success}</div> 
 </c:if> 
 <c:if test="${not empty error}"> 
     <div class="alert alert-error">${error}</div> 
 </c:if> 
 
 <div class="profile-layout"> 
 
     <!-- Profile Info --> 
     <div class="profile-main"> 
         <div class="card"> 
             <div class="profile-header"> 
                 <div class="profile-avatar"> 
                     <img src="${pageContext.request.contextPath}/account/profile-image" alt="Profile Picture"> 
                 </div> 
                 <div> 
                     <div class="profile-name">${user.fullName}</div> 
                     <div class="profile-username">@${user.username}</div> 
                     <div class="profile-meta">${user.role} · ${user.status ? 'Active' : 'Pending'}</div> 
                 </div> 
             </div> 
 
             <table> 
                 <tr><th>Email</th><td>${user.email}</td></tr> 
                 <tr><th>Phone</th><td>${not empty user.phone ? user.phone : '—'}</td></tr> 
                 <tr><th>Address</th><td>${not empty user.address ? user.address : '—'}</td></tr> 
             </table> 
         </div> 
     </div> 
 
     <!-- Quick Actions --> 
     <div class="profile-sidebar"> 
         <div class="card"> 
             <div class="actions-label">Quick Actions</div> 
             <div class="actions-list"> 
                 <a href="${pageContext.request.contextPath}/account/edit-profile" class="btn btn-secondary"> 
                     <i class="fa-solid fa-pen"></i> Edit Profile 
                 </a> 
                 <a href="${pageContext.request.contextPath}/account/change-password" class="btn btn-secondary"> 
                     <i class="fa-solid fa-lock"></i> Change Password 
                 </a> 
                 <a href="${pageContext.request.contextPath}/account/orders" class="btn btn-secondary"> 
                     <i class="fa-solid fa-box"></i> My Orders 
                 </a> 
                 <a href="${pageContext.request.contextPath}/wishlist" class="btn btn-secondary"> 
                     <i class="fa-regular fa-heart"></i> Wishlist 
                 </a> 
             </div> 
         </div> 
     </div> 
 
 </div> 
 
 <jsp:include page="/WEB-INF/components/footer.jsp" /> 
