<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile — ${student.firstName} ${student.lastName}</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/userProfile.css">
    <!-- Bootstrap CSS for modals -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Delete Account Button Styling */
        .btn-delete {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-left: 10px;
        }

        .btn-delete:hover {
            background-color: #c82333;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(220, 53, 69, 0.3);
        }

        .btn-delete:active {
            transform: translateY(0);
        }

        /* Alert Styling */
        .alert-container {
            margin-bottom: 20px;
        }

        .alert {
            padding: 15px 20px;
            border-radius: 5px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .alert-danger {
            background-color: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
        }

        .alert-warning {
            background-color: #fff3cd;
            border: 1px solid #ffeaa7;
            color: #856404;
        }

        .alert-success {
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            color: #155724;
        }

        .alert-close {
            margin-left: auto;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
        }

        /* Modal styling overrides */
        .modal-header {
            background-color: #dc3545;
            color: white;
        }

        .modal-header .btn-close {
            filter: brightness(0) invert(1);
        }

        .form-warning {
            background-color: #fff3cd;
            border-left: 4px solid #ffc107;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 3px;
        }

        .form-control:focus {
            border-color: #dc3545;
            box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
        }

        .checkbox-container {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .checkbox-container input[type="checkbox"] {
            width: 20px;
            height: 20px;
            cursor: pointer;
        }

        .delete-danger-text {
            color: #dc3545;
            font-weight: 600;
        }
    </style>
</head>
<body>

<!-- Success/Error Alert Messages -->
<div class="alert-container" style="padding: 0 20px; margin-top: 20px;">
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" role="alert">
            <span>⚠️</span>
            <strong>${errorMessage}</strong>
            <span class="alert-close" onclick="this.parentElement.style.display='none';">&times;</span>
        </div>
    </c:if>
</div>

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
            <button class="btn-delete" data-bs-toggle="modal" data-bs-target="#deleteAccountModal">🗑️ Delete Account</button>
        </div>
    </div>

</div>

<!-- Delete Account Modal -->
<div class="modal fade" id="deleteAccountModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <strong>⚠️ Delete Account</strong>
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-warning">
                    <strong>⚠️ Important Warning</strong><br>
                    This action will <span class="delete-danger-text">permanently delete your account</span>. 
                    Your data will be preserved on our servers but you will <span class="delete-danger-text">NOT be able to login</span> 
                    after deletion. You can contact an administrator to restore your account.
                </div>

                <form id="deleteAccountForm" method="POST" action="${pageContext.request.contextPath}/userProfile">
                    <input type="hidden" name="action" value="deleteAccount">

                    <div class="mb-3">
                        <label for="password" class="form-label">
                            <strong>Password Verification</strong>
                        </label>
                        <input 
                            type="password" 
                            class="form-control" 
                            id="password" 
                            name="password" 
                            placeholder="Enter your password" 
                            required
                        >
                        <small class="form-text" style="color: #666;">
                            We need your password to confirm this action for security.
                        </small>
                    </div>

                    <div class="checkbox-container">
                        <input 
                            type="checkbox" 
                            id="confirmDelete" 
                            name="confirmDelete" 
                            value="yes" 
                            required
                        >
                        <label for="confirmDelete" style="margin: 0; cursor: pointer;">
                            I understand and confirm that my account will be permanently deleted
                        </label>
                    </div>

                    <div class="mb-3">
                        <small class="form-text" style="color: #666; display: block;">
                            ℹ️ <strong>Note:</strong> If you change your mind later, contact support and we can help restore your account.
                        </small>
                    </div>

                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-danger btn-lg" id="confirmDeleteBtn">
                            Delete My Account (NO WAY BACK)
                        </button>
                    </div>
                </form>
            </div>
            <div class="modal-footer" style="border-top: 1px solid #dee2e6;">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    ❌ Cancel
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS for modals -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- JavaScript for form validation -->
<script>
    // Handle delete account form submission
    document.getElementById('deleteAccountForm')?.addEventListener('submit', function(e) {
        const password = document.getElementById('password').value.trim();
        const confirmDelete = document.getElementById('confirmDelete').checked;

        // Validate password
        if (!password || password.length === 0) {
            e.preventDefault();
            alert('❌ Please enter your password');
            return false;
        }

        // Check minimum password length (assumed from registration)
        if (password.length < 4) {
            e.preventDefault();
            alert('❌ Password seems too short');
            return false;
        }

        // Validate confirmation checkbox
        if (!confirmDelete) {
            e.preventDefault();
            alert('❌ Please confirm account deletion by checking the box');
            return false;
        }

        // Final confirmation
        if (!confirm('⚠️ FINAL WARNING: Are you absolutely sure? This cannot be undone!\n\nClick OK to permanently delete your account.')) {
            e.preventDefault();
            return false;
        }

        // Form will submit if all validations pass
        return true;
    });

    // Close alerts when X is clicked
    document.querySelectorAll('.alert-close').forEach(closeBtn => {
        closeBtn.addEventListener('click', function() {
            this.parentElement.style.display = 'none';
        });
    });

    // Auto-hide alerts after 5 seconds (optional)
    window.addEventListener('load', function() {
        const alerts = document.querySelectorAll('.alert');
        alerts.forEach(alert => {
            setTimeout(() => {
                alert.style.transition = 'opacity 0.3s ease';
                alert.style.opacity = '0';
                setTimeout(() => alert.style.display = 'none', 300);
            }, 5000);
        });
    });
</script>

</body>
</html>