package com.example.constructionmis.models;

import jakarta.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "reports")
public class Report {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String title;

    @Column(length = 1000)
    private String description;

    @Column(name = "report_date", nullable = false)
    private Timestamp reportDate;

    @Column(nullable = false)
    private String status; // DRAFT | SUBMITTED | APPROVED

    @Column(name = "created_at", nullable = false, updatable = false)
    private Timestamp createdAt;

    // Relationships

    @ManyToOne
    @JoinColumn(name = "generated_by", nullable = false)
    private User generatedBy; // User who created the report

    @ManyToOne
    @JoinColumn(name = "project_id", nullable = false)
    private Project project; // Project this report is about

    // Optional: tasks and delays mentioned in report
    @ManyToMany
    @JoinTable(
            name = "report_tasks",
            joinColumns = @JoinColumn(name = "report_id"),
            inverseJoinColumns = @JoinColumn(name = "task_id")
    )
    private List<Task> relatedTasks = new ArrayList<>();

    @ManyToMany
    @JoinTable(
            name = "report_delays",
            joinColumns = @JoinColumn(name = "report_id"),
            inverseJoinColumns = @JoinColumn(name = "delay_id")
    )
    private List<Delay> relatedDelays = new ArrayList<>();

    // Constructors
    public Report() {
    }

    public Report(String title, String description, String status, User generatedBy, Project project) {
        this.title = title;
        this.description = description;
        this.status = status;
        this.generatedBy = generatedBy;
        this.project = project;
        this.reportDate = new Timestamp(System.currentTimeMillis());
    }

    // Automatically set createdAt timestamp
    @PrePersist
    protected void onCreate() {
        this.createdAt = new Timestamp(System.currentTimeMillis());
        if (this.reportDate == null) {
            this.reportDate = new Timestamp(System.currentTimeMillis());
        }
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getReportDate() {
        return reportDate;
    }

    public void setReportDate(Timestamp reportDate) {
        this.reportDate = reportDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public User getGeneratedBy() {
        return generatedBy;
    }

    public void setGeneratedBy(User generatedBy) {
        this.generatedBy = generatedBy;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public List<Task> getRelatedTasks() {
        return relatedTasks;
    }

    public void setRelatedTasks(List<Task> relatedTasks) {
        this.relatedTasks = relatedTasks;
    }

    public List<Delay> getRelatedDelays() {
        return relatedDelays;
    }

    public void setRelatedDelays(List<Delay> relatedDelays) {
        this.relatedDelays = relatedDelays;
    }

    @Override
    public String toString() {
        return "Report{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", reportDate=" + reportDate +
                ", status='" + status + '\'' +
                ", createdAt=" + createdAt +
                ", generatedBy=" + generatedBy.getFullName() +
                ", project=" + project.getProjectName() +
                '}';
    }
}
