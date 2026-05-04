<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Welcome file — redirect to the HomeController servlet
    response.sendRedirect(request.getContextPath() + "/home");
%>
