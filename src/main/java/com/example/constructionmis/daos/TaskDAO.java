package com.example.constructionmis.daos;
import com.example.constructionmis.models.Task;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;

public class TaskDAO {

    private final EntityManager em;

    public TaskDAO(EntityManager em) {
        this.em = em;
    }

    // CREATE
    public void save(Task task) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(task);
        tx.commit();
    }

    // READ
    public Task findById(int id) {
        return em.find(Task.class, id);
    }

    public List<Task> findAll() {
        return em.createQuery("FROM Task", Task.class).getResultList();
    }

    // Find tasks by project ID
    public List<Task> findByProjectId(int projectId) {
        return em.createQuery("FROM Task t WHERE t.project.id = :projectId", Task.class)
                .setParameter("projectId", projectId)
                .getResultList();
    }

    // Find tasks by assigned user ID
    public List<Task> findByUserId(int userId) {
        return em.createQuery("FROM Task t WHERE t.assignedTo.id = :userId", Task.class)
                .setParameter("userId", userId)
                .getResultList();
    }

    // Find tasks by status
    public List<Task> findByStatus(String status) {
        return em.createQuery("FROM Task t WHERE t.status = :status", Task.class)
                .setParameter("status", status)
                .getResultList();
    }

    // UPDATE
    public void update(Task task) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.merge(task);
        tx.commit();
    }

    // DELETE
    public void delete(Task task) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.remove(task);
        tx.commit();
    }

}