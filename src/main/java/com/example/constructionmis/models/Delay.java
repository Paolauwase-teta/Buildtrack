package com.example.constructionmis.models;
import jakarta.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "delays")
public class Delay {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "description", length = 1000, nullable = false)
    private String description;

    @Column(name = "delay_date", nullable = false)
    private Timestamp delayDate;

    @Column(name = "duration_days")
    private int durationDays; // Optional: how long the delay is expected to last

    @Column(name = "status", nullable = false)
    private String status; // REPORTED | UNDER_REVIEW | RESOLVED

    @Column(name = "created_at", nullable = false, updatable = false)
    private Timestamp createdAt;

    // Relationships

    @ManyToOne
    @JoinColumn(name = "reported_by", nullable = false)
    private User reportedBy; // User who reported the delay

    @ManyToOne
    @JoinColumn(name = "project_id", nullable = false)
    private Project project; // Project affected by the delay

    @ManyToOne
    @JoinColumn(name = "task_id", nullable = true)
    private Task task; // Optional: task affected by this delay

    // Constructors

    public Delay() {
    }

    public Delay(String description, int durationDays, String status, User reportedBy, Project project, Task task) {
        this.description = description;
        this.durationDays = durationDays;
        this.status = status;
        this.reportedBy = reportedBy;
        this.project = project;
        this.task = task;
        this.delayDate = new Timestamp(System.currentTimeMillis());
    }

    // Automatically set createdAt timestamp
    @PrePersist
    protected void onCreate() {
        this.createdAt = new Timestamp(System.currentTimeMillis());
        if (this.delayDate == null) {
            this.delayDate = new Timestamp(System.currentTimeMillis());
        }
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getDelayDate() {
        return delayDate;
    }

    public void setDelayDate(Timestamp delayDate) {
        this.delayDate = delayDate;
    }

    public int getDurationDays() {
        return durationDays;
    }

    public void setDurationDays(int durationDays) {
        this.durationDays = durationDays;
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

    public User getReportedBy() {
        return reportedBy;
    }

    public void setReportedBy(User reportedBy) {
        this.reportedBy = reportedBy;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    @Override
    public String toString() {
        return "Delay{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", delayDate=" + delayDate +
                ", durationDays=" + durationDays +
                ", status='" + status + '\'' +
                ", createdAt=" + createdAt +
                ", reportedBy=" + reportedBy.getFullName() +
                ", project=" + project.getProjectName() +
                ", task=" + (task != null ? task.getTaskName() : "N/A") +
                '}';
    }
}
