<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile — ${student.firstName} ${student.lastName}</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/userProfile.css">
</head>
<body>

<div class="profile-card">

    <!-- LEFT PANEL -->
    <div class="left-panel">
        <img 
            src="${pageContext.request.contextPath}/${student.image}"
            alt="Profile Image"
            onerror="this.style.display='none'; document.getElementById('initials-avatar').style.display='flex';"
            style="width:96px; height:96px; border-radius:50%; border:3px solid #5b6cf8; object-fit:cover;"
        />

        <%-- Fallback: show initials if image fails to load --%>
        <div class="avatar" id="initials-avatar" style="display:none;">
               ?   <%-- Simple placeholder — shown only if image fails to load --%>
        </div>

        <%-- ${student.firstName} reads the getFirstName() value from the StudentModel object
             that the servlet put in request scope via request.setAttribute("student", student) --%>
        <h2>${student.firstName} <span>${student.lastName}</span></h2>
        <p class="username-tag">@${student.userName}</p>
        <div class="left-divider"></div>
        <div class="program-badge">&#128218; Program #${student.program}</div>
    </div>

    <!-- RIGHT PANEL -->
    <div class="right-panel">
        <h1>My Profile</h1>
        <p class="subtitle">Your personal information from registration</p>

        <div class="info-grid">

            <div class="info-item">
                <label>First Name</label>
                <div class="info-box">
                    <span class="icon">&#128100;</span>
                    <span>${student.firstName}</span>
                </div>
            </div>

            <div class="info-item">
                <label>Last Name</label>
                <div class="info-box">
                    <span class="icon">&#128100;</span>
                    <span>${student.lastName}</span>
                </div>
            </div>

            <div class="info-item">
                <label>Username</label>
                <div class="info-box">
                    <span class="icon">&#128101;</span>
                    <span>@${student.userName}</span>
                </div>
            </div>

            <div class="info-item">
                <label>Email</label>
                <div class="info-box">
                    <span class="icon">&#9993;</span>
                    <span>${student.email}</span>
                </div>
            </div>

            <hr class="section-divider" />

            <div class="info-item">
                <label>Birthday</label>
                <div class="info-box">
                    <span class="icon">&#128197;</span>
                    <span>${student.dob}</span>
                </div>
            </div>

            <div class="info-item">
                <label>Gender</label>
                <div class="info-box">
                    <span class="icon">&#9895;</span>
                    <span>${student.gender}</span>
                </div>
            </div>

            <div class="info-item">
                <label>Phone Number</label>
                <div class="info-box">
                    <span class="icon">&#128222;</span>
                    <span>${student.number}</span>
                </div>
            </div>

            <div class="info-item">
                <label>Program ID</label>
                <div class="info-box">
                    <span class="icon">&#128218;</span>
                    <span>${student.program}</span>
                </div>
            </div>

        </div>

        <div class="actions">
            <a class="btn-secondary" href="${pageContext.request.contextPath}/logout">&#128274; Logout</a>
        </div>
    </div>

</div>
</body>
</html>