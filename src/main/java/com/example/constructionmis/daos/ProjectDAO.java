package com.example.constructionmis.daos;
import com.example.constructionmis.models.Project;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.util.List;

public class ProjectDAO {

     private final EntityManager em;

     public ProjectDAO(EntityManager em){
         this.em = em;
     }

     //CREATE
    public void save(Project project){
         EntityTransaction tx = em.getTransaction();
         tx.begin();
         em.persist(project);
         tx.commit();
    }


    //READ
    public Project findById(int id){
     return em.find(Project.class,id);
    }

    public List<Project> findAll(){
         return em.createQuery("From Project ",Project.class).getResultList();
    }

    //UPDATE
    public void update(Project project){
         EntityTransaction tx = em.getTransaction();
         tx.begin();
         em.merge(project);
         tx.commit();
    }

    //DELETE
    public void delete(Project project){
         EntityTransaction tx = em.getTransaction();
         tx.begin();
         em.remove(project);
         tx.commit();
    }
}
