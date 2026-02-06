package com.example.constructionmis.daos;
import com.example.constructionmis.models.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import java.util.List;
import jakarta.persistence.NoResultException;


import static java.sql.Types.NULL;

public class UserDAO {
    private final EntityManager em;


    public UserDAO(EntityManager em){
        this.em = em;
    }


    //CREATE A USER
    public void saveUser(User user){
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(user);
        tx.commit();
    }

    //Read a user by id
    public User findById(int id){
        return em.find(User.class,id);
    }

    //find all users
    public List<User>findAll(){
        return  em.createQuery("FROM User",User.class).getResultList();
    }


    //find a user by email
    public User findByEmail(String Email){
        try{
            return  em.createQuery("FROM User u WHERE u.email = :email",User.class).setParameter("email",Email).getSingleResult();
        }catch (NoResultException e) {
            return null;
        }
    }



    //read by role
    public List<User> findByRole(String role){
        return  em.createQuery("FROM User u WHERE u.role = :role",User.class).setParameter("role",role).getResultList();
    }



    //checking if an email exists
    public boolean emailExists(String email) {
     Long count = em.createQuery("SELECT COUNT(u) FROM User u WHERE u.email = :email",Long.class).setParameter("email",email).getSingleResult();
       return count  > 0;
    }

    public void updateUser(User user){
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.merge(user);
        tx.commit();
    }

    //DELETE A USER
    public void deleteUser(User user){
        EntityTransaction tx = em.getTransaction();
            tx.begin();
            em.remove(user);
            tx.commit();
        }


}



