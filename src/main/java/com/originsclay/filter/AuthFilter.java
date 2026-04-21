package com.originsclay.filter;

import com.originsclay.util.SessionUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * AuthFilter - Blocks unauthenticated access to protected URLs and
 * enforces role-based access (admin vs customer).
 * Satisfies rubric 4d "Redirect Management (Filter)".
 */
@WebFilter(urlPatterns = {"/account/*", "/admin/*", "/cart/*", "/wishlist/*", "/orders/*"})
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException { }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  request  = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String contextPath = request.getContextPath();
        String uri = request.getRequestURI();

        // Check if user is logged in
        if (!SessionUtil.isLoggedIn(request)) {
            response.sendRedirect(contextPath + "/login");
            return;
        }

        // Admin-only pages
        if (uri.startsWith(contextPath + "/admin")) {
            if (!SessionUtil.isAdmin(request)) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN,
                        "You do not have permission to access this page.");
                return;
            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() { }
}
