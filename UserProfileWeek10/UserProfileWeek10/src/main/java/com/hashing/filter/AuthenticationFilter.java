package com.hashing.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.hashing.utils.SessionUtil;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {

    private static final String LOGIN = "/login";
    private static final String REGISTER = "/register";
    private static final String HOME = "/home";
    private static final String ADMIN_PREFIX = "/admin";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {}

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
    	
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        String contextPath = req.getContextPath();
       
        String path = uri.substring(contextPath.length());


        if (path.startsWith("/resources/") || path.endsWith(".css") || path.endsWith(".js") || path.endsWith(".png") || path.endsWith(".jpg")   || path.startsWith("/WEB-INF")) {

            chain.doFilter(request, response);
            return;
        }

     
        Object user = SessionUtil.getAttribute(req, "username");
        boolean isLoggedIn = (user != null);

        // Check admin access for /admin/* paths
        if (path.startsWith(ADMIN_PREFIX)) {
            if (!isLoggedIn) {
                res.sendRedirect(contextPath + LOGIN);
                return;
            }
            
            String username = (String) user;
            if (!"admin".equalsIgnoreCase(username)) {
                // Non-admin user trying to access admin panel
                res.sendStatus(HttpServletResponse.SC_FORBIDDEN);
                res.getWriter().print("Access Denied: Admin privileges required");
                return;
            }
            
            // Admin user - allow access
            chain.doFilter(request, response);
            return;
        }

        boolean isPublic = path.equals(LOGIN) || path.equals(REGISTER);

        if (!isLoggedIn) {
            if (isPublic) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(contextPath + LOGIN);
            }
        } else {
            if (isPublic) {
                res.sendRedirect(contextPath + HOME);
            } else {
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {}
}