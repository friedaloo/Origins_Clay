<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Directory</title>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: linear-gradient(135deg, #ffffff 0%, #e2e8f0 100%);
            min-height: 100vh;
            color: #0f172a;
            padding: 2rem; /* Balanced padding */
            display: flex;
            justify-content: center;
        }

        .container {
            width: 100%;
            /* Increased width from 1100px to 1250px */
            max-width: 1250px; 
        }

        .header-flex {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding: 0 0.5rem;
        }

        h2 {
            font-size: 2.25rem;
            font-weight: 700;
            letter-spacing: -1px;
            color: #1e293b;
        }

        h2 span {
            color: #6366f1;
        }

        .stats-badge {
            background: #6366f1;
            color: white;
            padding: 0.6rem 1.25rem;
            border-radius: 12px;
            font-size: 0.9rem;
            font-weight: 600;
            box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.3);
        }

        .table-card {
            background: #ffffff;
            border-radius: 24px;
            box-shadow: 0 20px 40px -10px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            border: 1px solid #e2e8f0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            /* Ensures table stretches to fill the wider container */
            table-layout: auto; 
        }

        th {
            background: #f8fafc;
            padding: 1.5rem;
            font-size: 0.75rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: #64748b;
            border-bottom: 1px solid #e2e8f0;
        }

        td {
            padding: 1.25rem 1.5rem;
            font-size: 0.95rem;
            color: #334155;
            border-bottom: 1px solid #f1f5f9;
        }

        tr:hover td {
            background-color: #f8fafc;
        }

        .user-info {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .user-name {
            font-weight: 600;
            color: #0f172a;
        }

        .user-handle {
            font-size: 0.8rem;
            color: #94a3b8;
        }

        .program-tag {
            display: inline-block;
            padding: 0.35rem 0.85rem;
            border-radius: 8px;
            font-size: 0.8rem;
            font-weight: 600;
            background: #f1f5f9;
            color: #475569;
            white-space: nowrap;
        }

        .edit-btn {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: #6366f1;
            text-decoration: none;
            font-weight: 600;
            padding: 0.6rem 1rem;
            border-radius: 10px;
            transition: all 0.2s ease;
            background: rgba(99, 102, 241, 0.05);
        }

        .edit-btn:hover {
            background: #6366f1;
            color: #ffffff;
            transform: translateY(-1px);
        }

        .empty-state {
            text-align: center;
            padding: 5rem 2rem;
            color: #94a3b8;
        }

        /* Responsive Mobile Tweak */
        @media (max-width: 1024px) {
            .container { max-width: 100%; }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header-flex">
        <h2>Student <span>Directory</span></h2>
        <c:if test="${not empty students}">
            <div class="stats-badge">
                <i class="fa fa-graduation-cap"></i> &nbsp; ${fn:length(students)} Enrolled
            </div>
        </c:if>
    </div>

    <div class="table-card">
        <c:choose>
            <c:when test="${empty students}">
                <div class="empty-state">
                    <i class="fa-regular fa-folder-open fa-3x" style="margin-bottom: 1rem; opacity: 0.5;"></i>
                    <p>No student records found.</p>
                </div>
            </c:when>
            
            <c:otherwise>
                <table>
                    <thead>
                        <tr>
                            <th>Student Details</th>
                            <th>Email Address</th>
                            <th>Date of Birth</th>
                            <th>Enrolled Program</th>
                            <th style="text-align: right;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${students}">
                            <tr>
                                <td>
                                    <div class="user-info">
                                        <span class="user-name">${s.firstName} ${s.lastName}</span>
                                        <span class="user-handle">@${fn:toLowerCase(s.userName)}</span>
                                    </div>
                                </td>
                                <td>${s.email}</td>
                                <td>
                                    <fmt:formatDate value="${s.dob}" pattern="dd MMM, yyyy" />
                                </td>
                                <td>
                                    <span class="program-tag">
                                        <c:choose>
                                            <c:when test="${s.program == 2}">Bachelor in Computing</c:when>
                                            <c:when test="${s.program == 5}">Bachelor in Multimedia</c:when>
                                            <c:when test="${s.program == 6}">Bachelor in Networking</c:when>
                                            <c:otherwise>General Studies</c:otherwise>
                                        </c:choose>
                                    </span>
                                </td>
                                <td style="text-align: right;">
                                    <a href="edit?user=${s.userName}" class="edit-btn">
                                        <i class="fa fa-pen-to-square"></i> Edit
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</div>

</body>
</html>