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

@WebServlet("secure/users")
public class  UserController extends HttpServlet {
        //help Method: create UserService (reused everywhere) , creating a service helper
        private UserService getUserService() {
                EntityManager em = HibernateUtil.getEntityManager();
                UserDAO userDAO = new UserDAO(em);
                return new UserService(userDAO);
        }



        //return all users
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


}