package com.example.constructionmis.controllers;

import com.example.constructionmis.daos.UserDAO;
import com.example.constructionmis.services.UserService;
import com.example.constructionmis.util.HibernateUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.constructionmis.models.User;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/auth/*")
//this means any request starting with /auth/ will go this servelet

public class AuthController extends HttpServlet {

    //helper methods to create UserService
    //this avoids repeating codes in every method
    private UserService getUserService(){
        //Create a new EntityManager (used by Hibernate)
        EntityManager em = HibernateUtil.getEntityManager();

        //Pass EntityManager into DAO
        UserDAO userDAO = new UserDAO(em);

        //returns a new userService using the DAO
        return new UserService(userDAO);
    }


    //handles post requests
    //all login/register/logout will be post
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //GET THE PART AFTER AUTH
        String path = request.getPathInfo();

        //deciding which endpoints should be called
        if("/register".equals(path)){
            handleRegister(request,response);
        }else if("/login".equals(path)){
            handleLogin(request,response);
        }else if("/logout".equals(path)){
            handleLogout(request,response);
        }else{
            //if endopoint is invalid
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid auth endpoint");
        }
    }

    private void handleRegister(HttpServletRequest request,HttpServletResponse response) throws IOException{
        //GETTING USER SERVICE
        UserService userService = getUserService();

        //Getting data from the request
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");


        User user = new User();
        user.setFullName(fullName.trim());
        user.setEmail(email.trim().toLowerCase());
        user.setPassword(password);
        user.setRole(role);

        try{
            userService.registerUser(user);
            response.sendRedirect(request.getContextPath() + "/register.jsp");
        }catch(RuntimeException e){
            response.setStatus(HttpServletResponse.SC_CONFLICT);
            response.getWriter().write(e.getMessage());
        }
    }


    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          UserService userService = getUserService();

          String email = request.getParameter("email");
          String password = request.getParameter("password");

          User user = userService.authenticateUser(email,password);


          if(user != null){
              HttpSession session = request.getSession();
              session.setAttribute("user",user);

             String role = user.getRole();
              //role-based redirection
              if(user.getRole().equalsIgnoreCase("ADMIN")){
                  response.sendRedirect(request.getContextPath() + "/secure/admin/dashboard.jsp");
              }
              else if(user.getRole().equalsIgnoreCase("ENGINEER")){
                  response.sendRedirect(request.getContextPath() + "/secure/engineer/dashboard.jsp");
              }
              else if(user.getRole().equalsIgnoreCase("MANAGER")){
                  response.sendRedirect(request.getContextPath() + "/secure/manager/dashboard.jsp");
              }
              else{
                  response.sendRedirect(request.getContextPath() + "/login.jsp");
              }
          } else{
              response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
              response.getWriter().write("invalid credentials");
          }

    }



    private void handleLogout(HttpServletRequest request,HttpServletResponse response) throws IOException{
        HttpSession session = request.getSession(false);
        if(session != null){
            session.invalidate();
        }
        response.getWriter().write("Logged out successfully");
    }
}