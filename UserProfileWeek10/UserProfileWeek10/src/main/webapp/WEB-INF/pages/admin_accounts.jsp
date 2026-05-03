<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Account Management</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            background: white;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            border-bottom: 2px solid #e9ecef;
            padding-bottom: 20px;
        }

        .header h1 {
            color: #333;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .badge-info {
            background-color: #6366f1;
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
        }

        .section {
            margin-bottom: 40px;
        }

        .section h2 {
            color: #333;
            font-weight: bold;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid #f0f0f0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .alert-info {
            background-color: #cfe2ff;
            border: 1px solid #b6d4fe;
            color: #084298;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        .table-wrapper {
            overflow-x: auto;
        }

        .table {
            margin-bottom: 0;
        }

        .table thead {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
        }

        .table thead th {
            font-weight: 600;
            color: #333;
            padding: 15px;
            text-align: left;
        }

        .table tbody td {
            padding: 15px;
            vertical-align: middle;
            border-bottom: 1px solid #dee2e6;
        }

        .table tbody tr:hover {
            background-color: #f9f9f9;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-active {
            background-color: #d4edda;
            color: #155724;
        }

        .status-inactive {
            background-color: #f8d7da;
            color: #721c24;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .btn-small {
            padding: 6px 12px;
            font-size: 12px;
            font-weight: 600;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .btn-restore {
            background-color: #28a745;
            color: white;
        }

        .btn-restore:hover {
            background-color: #218838;
            transform: translateY(-1px);
        }

        .btn-hard-delete {
            background-color: #dc3545;
            color: white;
        }

        .btn-hard-delete:hover {
            background-color: #c82333;
            transform: translateY(-1px);
        }

        .btn-view {
            background-color: #6366f1;
            color: white;
        }

        .btn-view:hover {
            background-color: #4f46e5;
            transform: translateY(-1px);
        }

        .empty-state {
            text-align: center;
            padding: 40px;
            color: #666;
        }

        .empty-state-icon {
            font-size: 48px;
            margin-bottom: 15px;
            color: #ccc;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        .stat-card-value {
            font-size: 32px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .stat-card-label {
            font-size: 14px;
            opacity: 0.9;
        }

        .warning-box {
            background-color: #fff3cd;
            border: 1px solid #ffc107;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            color: #856404;
        }

        .note {
            background-color: #e7f3ff;
            border-left: 4px solid #2196F3;
            padding: 12px;
            margin: 15px 0;
            border-radius: 3px;
            font-size: 14px;
            color: #1565c0;
        }

        .back-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #6366f1;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.2s ease;
        }

        .back-link:hover {
            color: #764ba2;
            transform: translateX(-5px);
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Back Button -->
    <a href="${pageContext.request.contextPath}/home" class="back-link">
        ← Back to Home
    </a>

    <!-- Header -->
    <div class="header">
        <h1>
            <i class="fas fa-cog"></i> Admin Account Management
        </h1>
        <span class="badge-info">🔐 Administration Panel</span>
    </div>

    <!-- Statistics Section -->
    <div class="section">
        <h2>
            <i class="fas fa-chart-pie"></i> Statistics
        </h2>
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-card-value" id="total-students">0</div>
                <div class="stat-card-label">Total Active Students</div>
            </div>
            <div class="stat-card">
                <div class="stat-card-value" id="deleted-accounts">0</div>
                <div class="stat-card-label">Deleted Accounts</div>
            </div>
            <div class="stat-card">
                <div class="stat-card-value" id="total-accounts">0</div>
                <div class="stat-card-label">Total Accounts</div>
            </div>
        </div>
    </div>

    <!-- Active Students Section -->
    <div class="section">
        <h2>
            <i class="fas fa-users"></i> Active Students
        </h2>
        <div class="alert-info">
            <strong>ℹ️ Info:</strong> These are all currently active student accounts in the system.
        </div>
        
        <div class="table-wrapper">
            <table class="table">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="active-students-tbody">
                    <tr>
                        <td colspan="5" class="text-center text-muted">
                            Loading active students...
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Deleted Accounts Section -->
    <div class="section">
        <h2>
            <i class="fas fa-trash-restore"></i> Deleted Accounts (Soft Delete)
        </h2>
        
        <div class="warning-box">
            <strong>⚠️ Warning:</strong> These accounts are soft-deleted (inactive). They can be restored to active status, 
            or permanently hard-deleted from the database. Data is currently preserved.
        </div>

        <div class="note">
            <strong>ℹ️ Note:</strong> Soft-deleted accounts cannot login and don't appear in regular user lists. 
            Only admins can see them here.
        </div>

        <div class="table-wrapper">
            <table class="table">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="deleted-accounts-tbody">
                    <tr>
                        <td colspan="5" class="text-center text-muted">
                            No deleted accounts found.
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Action Guide -->
    <div class="section">
        <h2>
            <i class="fas fa-book"></i> Action Guide
        </h2>
        
        <div class="row">
            <div class="col-md-4">
                <h5 class="text-success">✅ Restore Account</h5>
                <p>
                    Reactivates a soft-deleted account. The user will be able to login again.
                    Data is fully recovered. This is reversible.
                </p>
            </div>
            <div class="col-md-4">
                <h5 class="text-danger">❌ Hard Delete</h5>
                <p>
                    Permanently removes the account from the database. <strong>NO RECOVERY POSSIBLE.</strong>
                    Use only when absolutely certain. This is irreversible.
                </p>
            </div>
            <div class="col-md-4">
                <h5 class="text-info">🔍 View Details</h5>
                <p>
                    View complete student information including contact details, 
                    program enrollment, and registration date.
                </p>
            </div>
        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    const BASE_URL = '${pageContext.request.contextPath}';

    // Helper function to render student rows
    function renderStudentRow(student, showRestore = false) {
        const statusClass = student.status === 'active' ? 'status-active' : 'status-inactive';
        const statusText = student.status === 'active' ? 'Active' : 'Inactive';
        
        let actions = `
            <div class="action-buttons">
                <button class="btn-small btn-view" onclick="viewStudent('${student.username}', '${student.firstName} ${student.lastName}')">
                    <i class="fas fa-eye"></i> View
                </button>
        `;
        
        if (showRestore) {
            actions += `
                <button class="btn-small btn-restore" onclick="restoreAccount('${student.username}')">
                    <i class="fas fa-redo"></i> Restore
                </button>
                <button class="btn-small btn-hard-delete" onclick="hardDeleteAccount('${student.username}')">
                    <i class="fas fa-trash"></i> Hard Delete
                </button>
            `;
        }
        
        actions += `</div>`;
        
        return `
            <tr>
                <td><strong>@${student.username}</strong></td>
                <td>${student.firstName} ${student.lastName}</td>
                <td>${student.email}</td>
                <td><span class="status-badge ${statusClass}">${statusText}</span></td>
                <td>${actions}</td>
            </tr>
        `;
    }

    // Fetch all accounts from backend
    function loadAccountsFromBackend() {
        fetch(BASE_URL + '/admin/accounts', {
            method: 'GET',
            credentials: 'include',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Access denied or server error');
            }
            return response.json();
        })
        .then(data => {
            if (data.status === 'success') {
                renderAccounts(data.activeStudents, data.deletedAccounts, data.totalActive, data.totalDeleted, data.totalAccounts);
            } else {
                showError('Error: ' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showError('Failed to load accounts: ' + error.message);
        });
    }

    // Render accounts in tables
    function renderAccounts(activeStudents, deletedAccounts, totalActive, totalDeleted, totalAccounts) {
        // Render active students
        if (activeStudents && activeStudents.length > 0) {
            const activeStudentsHtml = activeStudents
                .map(student => renderStudentRow(student, false))
                .join('');
            document.getElementById('active-students-tbody').innerHTML = activeStudentsHtml;
        } else {
            document.getElementById('active-students-tbody').innerHTML = 
                '<tr><td colspan="5" class="text-center text-muted">No active students</td></tr>';
        }

        // Render deleted accounts
        if (deletedAccounts && deletedAccounts.length > 0) {
            const deletedAccountsHtml = deletedAccounts
                .map(student => renderStudentRow(student, true))
                .join('');
            document.getElementById('deleted-accounts-tbody').innerHTML = deletedAccountsHtml;
        } else {
            document.getElementById('deleted-accounts-tbody').innerHTML = 
                '<tr><td colspan="5" class="text-center text-muted">No deleted accounts</td></tr>';
        }

        // Update statistics
        document.getElementById('total-students').textContent = totalActive;
        document.getElementById('deleted-accounts').textContent = totalDeleted;
        document.getElementById('total-accounts').textContent = totalAccounts;
    }

    // Action handlers
    function viewStudent(username, fullName) {
        alert(`Viewing details for: ${fullName} (@${username})\n\nIn production, this would open a detailed modal.`);
    }

    function restoreAccount(username) {
        if (confirm(`✅ Restore account "@${username}" to active status?\n\nThe student will be able to login again.`)) {
            
            fetch(BASE_URL + '/admin/accounts?action=restore&username=' + encodeURIComponent(username), {
                method: 'POST',
                credentials: 'include',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => response.json())
            .then(data => {
                if (data.status === 'success') {
                    alert('✅ Account restored successfully: ' + username);
                    loadAccountsFromBackend(); // Refresh data
                } else {
                    alert('❌ Error: ' + data.message);
                }
            })
            .catch(error => {
                alert('❌ Error restoring account: ' + error.message);
            });
        }
    }

    function hardDeleteAccount(username) {
        if (confirm(`⚠️ FINAL WARNING: Hard delete account "@${username}"?\n\n❌ THIS CANNOT BE UNDONE!\n\nThe account will be permanently removed from the database.`)) {
            if (confirm('Are you ABSOLUTELY certain? This is irreversible!')) {
                
                fetch(BASE_URL + '/admin/accounts?action=hardDelete&username=' + encodeURIComponent(username), {
                    method: 'POST',
                    credentials: 'include',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => response.json())
                .then(data => {
                    if (data.status === 'success') {
                        alert('🗑️ Account permanently deleted: ' + username);
                        loadAccountsFromBackend(); // Refresh data
                    } else {
                        alert('❌ Error: ' + data.message);
                    }
                })
                .catch(error => {
                    alert('❌ Error deleting account: ' + error.message);
                });
            }
        }
    }

    // Show error message
    function showError(message) {
        const container = document.querySelector('.container');
        const errorDiv = document.createElement('div');
        errorDiv.className = 'alert alert-danger alert-dismissible fade show';
        errorDiv.role = 'alert';
        errorDiv.innerHTML = `
            <strong>Error!</strong> ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        `;
        container.insertBefore(errorDiv, container.firstChild);
    }

    // Initialize on page load
    window.addEventListener('load', function() {
        loadAccountsFromBackend();
    });
</script>

</body>
</html>
