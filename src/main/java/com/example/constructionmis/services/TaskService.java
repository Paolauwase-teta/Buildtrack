package com.example.constructionmis.services;
import com.example.constructionmis.daos.TaskDAO;
import com.example.constructionmis.models.Task;
import java.util.List;

public class TaskService {
    private final TaskDAO taskDAO;

    public TaskService(TaskDAO taskDAO) {
        this.taskDAO = taskDAO;
    }

    public void createTask(Task task) {
        taskDAO.save(task);
    }

    public Task getTaskById(int id) {
        return taskDAO.findById(id);
    }

    public List<Task> getAllTasks() {
        return taskDAO.findAll();
    }

    public List<Task> getTasksByProjectId(int projectId) {
        return taskDAO.findByProjectId(projectId);
    }

    public List<Task> getTasksByUserId(int userId) {
        return taskDAO.findByUserId(userId);
    }

    public List<Task> getTasksByStatus(String status) {
        return taskDAO.findByStatus(status);
    }

    public void updateTask(Task task) {
        taskDAO.update(task);
    }

    public void deleteTask(Task task) {
        taskDAO.delete(task);
    }

    // Overloaded method to delete by ID
    public void deleteTask(int id) {
        Task task = taskDAO.findById(id);
        if (task != null) {
            taskDAO.delete(task);
        }
    }
}
