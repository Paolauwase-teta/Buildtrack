package com.example.constructionmis.services;

import com.example.constructionmis.daos.ProjectDAO;
import com.example.constructionmis.models.Project;
import com.example.constructionmis.util.HibernateUtil;
import jakarta.persistence.EntityManager;
import com.example.constructionmis.daos.UserDAO;
import com.example.constructionmis.models.User;
import java.util.List;

public class Program {

    public static void main(String[] args) {

        System.out.println("=== USER SERVICE TEST ===");

        // STEP 1: Get EntityManager
        EntityManager em = HibernateUtil.getEntityManager();

        // STEP 2: Create DAO
        UserDAO userDAO = new UserDAO(em);

        // STEP 3: Create Service
        UserService userService = new UserService(userDAO);

        // =========================
        // 1️⃣ REGISTER USER
        // =========================
        User user = new User();
        user.setFullName("Paola Uwase");
        user.setEmail("paola@gmail.com");
        user.setPassword("123456"); // In real apps, hash this
        user.setRole("ADMIN");

        try {
            userService.registerUser(user);
            System.out.println("✔ User registered successfully");
        } catch (RuntimeException e) {
            System.out.println("⚠ " + e.getMessage());
        }

        // =========================
        // 2️⃣ LOGIN USER
        // =========================
        User loginUser = userService.authenticateUser("paola@gmail.com", "123456");
        if (loginUser != null) {
            System.out.println("✔ Login successful for: " + loginUser.getFullName());
        } else {
            System.out.println(" Login failed");
        }

        // =========================
        // 3️⃣ LIST ALL USERS
        // =========================
        List<User> allUsers = userService.getAllUsers();
        System.out.println("\n All Users:");
        for (User u : allUsers) {
            System.out.println(u.getId() + " | " + u.getFullName() + " | " + u.getEmail() + " | " + u.getRole());
        }

        // =========================
        // 4️⃣ CLEANUP
        // =========================
        em.close();
        HibernateUtil.shutdown();
        System.out.println("\n TEST COMPLETED");
    }
}
