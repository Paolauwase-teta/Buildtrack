package com.example.constructionmis.controllers;
import com.example.constructionmis.daos.UserDAO;
import com.example.constructionmis.models.User;
import com.example.constructionmis.util.HibernateUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.constructionmis.services.UserService;
import jakarta.persistence.EntityManager;

import java.io.IOException;
import java.util.List;

@WebServlet("/users")
public class  UserController extends HttpServlet {
        //help Method: create UserService (reused everywhere)
        private UserService getUserService() {
                EntityManager em = HibernateUtil.getEntityManager();
                UserDAO userDAO = new UserDAO(em);
                return new UserService(userDAO);
        }

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                        throws ServletException, IOException {

                UserService userService = getUserService();
                List<User> users = userService.getAllUsers();//getting all the list of users
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                StringBuilder json = new StringBuilder();
                json.append("[");
                for (int i = 0; i < users.size(); i++) {
                        User u = users.get(i);

                        json.append("{")
                                .append("\"id\":").append(u.getId()).append(",")
                                .append("\"email\":\"").append(u.getEmail()).append("\",")
                                .append("\"role\":\"").append(u.getRole()).append("\"")
                                .append("}");

                        if (i < users.size() - 1) {
                                json.append(",");
                        }
                }

                json.append("]");
                response.getWriter().write(json.toString());


        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                        throws  IOException {
                UserService userService = getUserService();

                //decide what action the client wants
                String action = request.getParameter("action");
                if("register".equalsIgnoreCase(action)){
                        handleRegister(request,response,userService);
                } else if ("login".equalsIgnoreCase(action)) {
                       handleLogin(request,response,userService);
                }else{
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                        response.getWriter().write("Invalid action");
                }
        }


        private void handleRegister(HttpServletRequest request,HttpServletResponse response,UserService userService) throws IOException{
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String role = request.getParameter("role");

                User user = new User();
                user.setFullName(fullName);
                user.setEmail(email);
                user.setPassword(password);
                user.setRole(role);

                try{
                        userService.registerUser(user);
                        response.getWriter().write("User registered successfully");
                } catch (RuntimeException e) {
                        response.setStatus(HttpServletResponse.SC_CONFLICT);
                        response.getWriter().write(e.getMessage());
                }
        }

        private void handleLogin(HttpServletRequest request,HttpServletResponse response,UserService userService) throws IOException{
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                User user =userService.authenticateUser(email,password);
                if(user != null){
                        response.getWriter().write("login successful");
                }else{
                        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                        response.getWriter().write("invalid credentials");
                }

        }
}