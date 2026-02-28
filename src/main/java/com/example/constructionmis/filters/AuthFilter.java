package com.example.constructionmis.filters;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;
import java.io.IOException;
@WebFilter("/secure/*")


public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain) throws IOException,ServletException{
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;


        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("user") == null){
            res.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            res.getWriter().write("You must login first.");
            return;
        }

        chain.doFilter(request,response);
    }
}
