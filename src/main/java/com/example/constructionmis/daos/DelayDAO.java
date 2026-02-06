package com.example.constructionmis.daos;

import com.example.constructionmis.models.Delay;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.util.List;

public class DelayDAO {

    private final EntityManager em;

    public DelayDAO(EntityManager em) {
        this.em = em;
    }

    // CREATE
    public void save(Delay delay) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(delay);
        tx.commit();
    }

    // READ
    public Delay findById(int id) {
        return em.find(Delay.class, id);
    }

    public List<Delay> findAll() {
        return em.createQuery("FROM Delay", Delay.class).getResultList();
    }

    // Find delays by project ID
    public List<Delay> findByProjectId(int projectId) {
        return em.createQuery("FROM Delay d WHERE d.project.id = :projectId", Delay.class)
                .setParameter("projectId", projectId)
                .getResultList();
    }

    // Find delays by task ID
    public List<Delay> findByTaskId(int taskId) {
        return em.createQuery("FROM Delay d WHERE d.task.id = :taskId", Delay.class)
                .setParameter("taskId", taskId)
                .getResultList();
    }

    // Find delays by status
    public List<Delay> findByStatus(String status) {
        return em.createQuery("FROM Delay d WHERE d.status = :status", Delay.class)
                .setParameter("status", status)
                .getResultList();
    }

    // Find delays reported by a specific user
    public List<Delay> findByReportedBy(int userId) {
        return em.createQuery("FROM Delay d WHERE d.reportedBy.id = :userId", Delay.class)
                .setParameter("userId", userId)
                .getResultList();
    }

    // UPDATE
    public void update(Delay delay) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.merge(delay);
        tx.commit();
    }

    // DELETE
    public void delete(Delay delay) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.remove(delay);
        tx.commit();
    }
}
