package com.quizpro.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class RootForwardFilter implements Filter {

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;

        String uri = request.getRequestURI();
        String contextPath = request.getContextPath();

        if (uri.startsWith(contextPath) ||
            uri.contains(".css") || uri.contains(".js") ||
            uri.contains(".png") || uri.contains(".jpg") ||
            uri.contains(".woff") || uri.contains(".ico")) {

            chain.doFilter(req, res);
            return;
        }

        request.getRequestDispatcher(contextPath + uri)
               .forward(request, response);
    }
}
