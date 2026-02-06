//package com.example.constructionmis.controllers;
//
//import com.example.constructionmis.daos.ProjectDAO;
//import com.example.constructionmis.util.HibernateUtil;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import com.example.constructionmis.services.ProjectService;
//import com.example.constructionmis.models.Project;
//import jakarta.persistence.EntityManager;
//import java.io.IOException;
//
//
//@WebServlet(name = "ProjectController", value = "/ProjectController")
//public class ProjectController extends HttpServlet {
//
//    private ProjectService projectService;
//    private String dbError = null;
//
//    @Override
//    public void init() {
//        try {
//            // creating entityManager once
//            EntityManager em = HibernateUtil.getEntityManager();
//            // initialising dao
//            ProjectDAO projectDAO = new ProjectDAO(em);
//            // initialize service and inject dao
//            projectService = new ProjectService(projectDAO);
//        } catch (Exception e) {
//            e.printStackTrace();
//            dbError = "Database Connection Failed: " + e.getMessage();
//        }
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        if (dbError != null) {
//            request.setAttribute("error", dbError);
//            request.getRequestDispatcher("projects.jsp").forward(request, response);
//            return null;
//        }
//
//        if (action == null || action.equals("list")) {
//            request.setAttribute("projects", projectService.getAllProjects());
//            request.getRequestDispatcher("projects.jsp").forward(request, response);
//        } else if (action.equals("delete")) {
//            int id = Integer.parseInt(request.getParameter("id"));
//            projectService.deleteProject(id);
//            response.sendRedirect("ProjectController");
//        }
//        return null;
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        if (action.equals("add")) {
//            Project project = new Project();
//            project.setProjectName(request.getParameter("projectName"));
//            project.setLocation(request.getParameter("location"));
//            projectService.createProject(project);
//        } else if (action.equals("update")) {
//            Project project = new Project();
//            project.setId(Integer.parseInt(request.getParameter("id")));
//            project.setProjectName(request.getParameter("projectName"));
//            project.setLocation(request.getParameter("location"));
//            projectService.updateProject(project);
//        }
//
//        response.sendRedirect("projects.jsp");
//    }
//}
