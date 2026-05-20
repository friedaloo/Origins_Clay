<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
  .site-footer {
    position: fixed;
    bottom: 0px;
    width: 100%;
    background-color: #3c3833; 
    padding: 15px 40px;
  }

  .footer-content {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    width: 100%;
  }

  .logo a {
    font-size: 24px;
    color: #e8e8e8;
    text-decoration: none;
    font-weight: 400;
  }

  @media (max-width: 480px) {
    .site-footer {
      padding: 10px 20px;
      text-align: center;
    }
    .footer-content {
      justify-content: center;
    }
  }
</style>

<!-- ====== FOOTER ====== -->
<footer class="site-footer">
  <div class="footer-content">
    <div class="logo">
      <a href="${pageContext.request.contextPath}/home">Origin's Clay</a>
    </div>
  </div>
</footer>