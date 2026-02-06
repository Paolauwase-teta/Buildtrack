package com.example.constructionmis.services;
import com.example.constructionmis.daos.UserDAO;
import com.example.constructionmis.models.User;
import org.mindrot.jbcrypt.BCrypt;

import java.util.List;

public class UserService {
    private final UserDAO userDAO;
    /**
     * @see com.example.constructionmis.daos.UserDAO //userDAO
     * {@link com.example.constructionmis.models.User} User entity
     * @param userDAO
     */
    public UserService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    //before saving a user check if the email exists
    public void registerUser(User user){
        if(userDAO.emailExists(user.getEmail())){
            throw new RuntimeException("Email already exists");
        }
        //take the plain password
        String plainPassword = user.getPassword();
        //hash the password
        String hashedPassword = BCrypt.hashpw(plainPassword,BCrypt.gensalt());
        user.setPassword(hashedPassword);
        userDAO.saveUser(user);
    }

    public User getUserById(int id) {
        return userDAO.findById(id);
    }

    public List<User> getAllUsers() {
        return userDAO.findAll();
    }

    public User getByEmail(String email) {
        return userDAO.findByEmail(email);
    }

    public List<User> getUserByRole(String role) {
        return userDAO.findByRole(role);
    }

    public boolean emailExists(String email) {
        return userDAO.emailExists(email);
    }

    // Authentication method
    public User authenticateUser(String email, String password) {
        User user = userDAO.findByEmail(email);
        if (user != null && BCrypt.checkpw(password,user.getPassword())) {
            return user;
        }
        return null;
    }

    public void updateUser(User user) {
        userDAO.updateUser(user);
    }

    public void deleteUser(User user) {
        userDAO.deleteUser(user);
    }

    // Overloaded method to delete by ID
    public void deleteUserById(int id) {
        User user = userDAO.findById(id);
        if (user != null) {
            userDAO.deleteUser(user);
        }
    }
}
