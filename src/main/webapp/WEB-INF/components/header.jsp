<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    border-radius: 0;
  }

  body {
    font-family: Arial, sans-serif;
  }

  .site-header {
    position: sticky;
    top: 0px;
    z-index: 1000;
    width: 100%;
    background-color: #3c3833; 
    padding: 12px 40px;
  }

  .header-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
  }

  .left-group {
    display: flex;
    align-items: center;
    gap: 35px;
  }

  .logo a {
    font-size: 24px;
    color: #e8e8e8;
    text-decoration: none;
    font-weight: 400;
  }

  .nav-links {
    list-style: none;
    display: flex;
    gap: 35px;
  }

  .nav-item a {
    font-size: 15px;
    color: #c4c4c4;
    text-decoration: none;
    transition: color 0.2s;
  }

  .nav-item a:hover {
    color: #ffffff;
  }

  @media (max-width: 768px) {
    .header-content {
      flex-direction: column;
      gap: 20px;
      text-align: center;
    }
    .left-group {
      flex-direction: column;
      gap: 15px;
    }
    .nav-links {
      gap: 15px;
      justify-content: center;
    }
  }
</style>

<!-- ====== HEADER ====== -->
<header class="site-header">
  <div class="header-content">
    <div class="left-group">
      <div class="logo">
        <a href="${pageContext.request.contextPath}/home">Origin's Clay</a>
      </div>

      <nav>
        <ul class="nav-links">
          <li class="nav-item"><a href="${pageContext.request.contextPath}/products">Products</a></li>
          <li class="nav-item"><a href="${pageContext.request.contextPath}/about">About</a></li>
          <li class="nav-item"><a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>
        </ul>
      </nav>
    </div>

    <div class="right-group">
      <ul class="nav-links">
        <c:choose>
          <c:when test="${not empty sessionScope.loggedInUser}">
            <c:if test="${sessionScope.userRole == 'admin'}">
              <li class="nav-item"><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
            </c:if>
            <c:if test="${sessionScope.userRole == 'customer'}">
              <li class="nav-item"><a href="${pageContext.request.contextPath}/cart">Cart</a></li>
              <li class="nav-item"><a href="${pageContext.request.contextPath}/wishlist">Wishlist</a></li>
            </c:if>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/account/profile">${sessionScope.loggedInUser.firstName}</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
          </c:when>
          <c:otherwise>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/account">Account</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/cart">Cart</a></li>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
</header>