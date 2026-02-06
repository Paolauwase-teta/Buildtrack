package com.example.constructionmis.services;
import com.example.constructionmis.daos.ProjectDAO;
import com.example.constructionmis.models.Project;
import java.util.List;

public class ProjectService {
    private final ProjectDAO projectDAO;

    public ProjectService(ProjectDAO projectDAO) {
        this.projectDAO = projectDAO;
    }

    public void createProject(Project project) {
        projectDAO.save(project);
    }

    public Project getProjectById(int id) {
        return projectDAO.findById(id);
    }

    public List<Project> getAllProjects() {
        return projectDAO.findAll();
    }

    public void updateProject(Project project) {
        projectDAO.update(project);
    }

    public void deleteProject(Project project) {
        projectDAO.delete(project);
    }

    // Overloaded method to delete by ID
    public void deleteProject(int id) {
        Project project = projectDAO.findById(id);
        if (project != null) {
            projectDAO.delete(project);
        }
    }
}
