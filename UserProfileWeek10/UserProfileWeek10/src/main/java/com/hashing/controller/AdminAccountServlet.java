package com.hashing.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

import com.hashing.model.StudentModel;
import com.hashing.service.AccountService;
import com.hashing.service.ListService;

/**
 * AdminAccountServlet handles account management operations for administrators.
 * Provides endpoints to view, restore, and hard-delete student accounts.
 */
@WebServlet("/admin/accounts")
public class AdminAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private AccountService accountService = new AccountService();
    private ListService listService = new ListService();

    /**
     * GET request - Fetch all active and deleted students
     * Returns JSON with active and deleted account lists
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Check admin access
            if (!isAdmin(request)) {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                response.setContentType("application/json");
                sendJsonResponse(response, "error", "Access denied - Admin privileges required", null);
                return;
            }

            response.setContentType("application/json");
            PrintWriter out = response.getWriter();

            // Fetch active students
            List<StudentModel> activeStudents = listService.fetchAll();

            // Fetch deleted (inactive) students
            List<StudentModel> deletedStudents = accountService.getAllInactiveStudents();

            // Build JSON response
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("status", "success");
            jsonResponse.put("activeStudents", studentsToJsonArray(activeStudents));
            jsonResponse.put("deletedAccounts", studentsToJsonArray(deletedStudents));
            jsonResponse.put("totalActive", activeStudents.size());
            jsonResponse.put("totalDeleted", deletedStudents.size());
            jsonResponse.put("totalAccounts", activeStudents.size() + deletedStudents.size());

            out.print(jsonResponse.toString());
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json");
            sendJsonResponse(response, "error", "Error fetching accounts: " + e.getMessage(), null);
        }
    }

    /**
     * POST request - Handle admin actions (restore, hard-delete)
     * Parameters:
     *   - action: "restore" or "hardDelete"
     *   - username: target student username
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Check admin access
            if (!isAdmin(request)) {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                response.setContentType("application/json");
                sendJsonResponse(response, "error", "Access denied - Admin privileges required", null);
                return;
            }

            String action = request.getParameter("action");
            String username = request.getParameter("username");

            response.setContentType("application/json");

            // Validate inputs
            if (action == null || action.isEmpty() || username == null || username.isEmpty()) {
                sendJsonResponse(response, "error", "Missing action or username parameter", null);
                return;
            }

            // ==================== RESTORE ACCOUNT ====================
            if ("restore".equalsIgnoreCase(action)) {
                try {
                    accountService.restoreDeletedAccount(username);
                    sendJsonResponse(response, "success", "Account restored successfully", username);
                } catch (Exception e) {
                    sendJsonResponse(response, "error", "Error restoring account: " + e.getMessage(), null);
                }
            }

            // ==================== HARD DELETE ====================
            else if ("hardDelete".equalsIgnoreCase(action)) {
                try {
                    accountService.deleteAccountPermanent(username);
                    sendJsonResponse(response, "success", "Account permanently deleted", username);
                } catch (Exception e) {
                    sendJsonResponse(response, "error", "Error deleting account: " + e.getMessage(), null);
                }
            }

            // Invalid action
            else {
                sendJsonResponse(response, "error", "Invalid action: " + action, null);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.setContentType("application/json");
            sendJsonResponse(response, "error", "Server error: " + e.getMessage(), null);
        }
    }

    /**
     * Check if current user is admin
     */
    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return false;
        }

        String username = (String) session.getAttribute("username");
        // Admin check - username must be "admin"
        return "admin".equalsIgnoreCase(username);
    }

    /**
     * Convert StudentModel list to JSON array
     */
    private JSONArray studentsToJsonArray(List<StudentModel> students) {
        JSONArray array = new JSONArray();

        for (StudentModel student : students) {
            JSONObject obj = new JSONObject();
            obj.put("username", student.getUserName());
            obj.put("firstName", student.getFirstName());
            obj.put("lastName", student.getLastName());
            obj.put("email", student.getEmail());
            obj.put("status", student.getStatus() != null ? student.getStatus() : "active");
            obj.put("gender", student.getGender());
            obj.put("dob", student.getDob());
            obj.put("phone", student.getNumber());
            obj.put("program", student.getProgram());
            array.put(obj);
        }

        return array;
    }

    /**
     * Send JSON response to client
     */
    private void sendJsonResponse(HttpServletResponse response, String status, String message, String username) {
        try {
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();

            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("status", status);
            jsonResponse.put("message", message);

            if (username != null) {
                jsonResponse.put("username", username);
            }

            out.print(jsonResponse.toString());
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
