package com.example.constructionmis.services;
import com.example.constructionmis.daos.ReportDAO;
import com.example.constructionmis.models.Report;
import java.util.List;

public class ReportService {
    private final ReportDAO reportDAO;

    public ReportService(ReportDAO reportDAO) {
        this.reportDAO = reportDAO;
    }

    public void createReport(Report report) {
        reportDAO.save(report);
    }

    public Report getReportById(int id) {
        return reportDAO.findById(id);
    }

    public List<Report> getAllReports() {
        return reportDAO.findAll();
    }

    public List<Report> getReportsByProjectId(int projectId) {
        return reportDAO.findByProjectId(projectId);
    }

    public List<Report> getReportsByStatus(String status) {
        return reportDAO.findByStatus(status);
    }

    public List<Report> getReportsByGeneratedBy(int userId) {
        return reportDAO.findByGeneratedBy(userId);
    }

    public void updateReport(Report report) {
        reportDAO.update(report);
    }

    public void deleteReport(Report report) {
        reportDAO.delete(report);
    }

    // Overloaded method to delete by ID
    public void deleteReport(int id) {
        Report report = reportDAO.findById(id);
        if (report != null) {
            reportDAO.delete(report);
        }
    }
}
