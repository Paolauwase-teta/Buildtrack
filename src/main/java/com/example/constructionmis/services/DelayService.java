package com.example.constructionmis.services;
import com.example.constructionmis.daos.DelayDAO;
import com.example.constructionmis.models.Delay;
import java.util.List;

public class DelayService {
    private final DelayDAO delayDAO;

    public DelayService(DelayDAO delayDAO) {
        this.delayDAO = delayDAO;
    }

    public void createDelay(Delay delay) {
        delayDAO.save(delay);
    }

    public Delay getDelayById(int id) {
        return delayDAO.findById(id);
    }

    public List<Delay> getAllDelays() {
        return delayDAO.findAll();
    }

    public List<Delay> getDelaysByProjectId(int projectId) {
        return delayDAO.findByProjectId(projectId);
    }

    public List<Delay> getDelaysByTaskId(int taskId) {
        return delayDAO.findByTaskId(taskId);
    }

    public List<Delay> getDelaysByStatus(String status) {
        return delayDAO.findByStatus(status);
    }

    public List<Delay> getDelaysByReportedBy(int userId) {
        return delayDAO.findByReportedBy(userId);
    }

    public void updateDelay(Delay delay) {
        delayDAO.update(delay);
    }

    public void deleteDelay(Delay delay) {
        delayDAO.delete(delay);
    }

    // Overloaded method to delete by ID
    public void deleteDelay(int id) {
        Delay delay = delayDAO.findById(id);
        if (delay != null) {
            delayDAO.delete(delay);
        }
    }
}
