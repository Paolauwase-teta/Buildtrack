package com.example.constructionmis.util;

public class PasswordUtil {
    //validate password strength
    public static void validatePassword(String password){
        //null checking
        if(password == null){
            throw new RuntimeException("Password cannot be null");
        }

        //minimum length check
        if(password.length() < 8){
            throw new RuntimeException("Password must be at least 8 characters");
        }

        //regex rules
        boolean hasUppercase = password.matches(".*[A-Z].*");
        boolean hasNumber = password.matches(".*[0-9].*");
        boolean hasSpecial = password.matches(".*[!@#$%^&*()].*");

        if(!hasUppercase){
            throw new RuntimeException("password must contain uppercase letters");
        }
        if(!hasNumber){
            throw new RuntimeException("password must contain numbers");
        }

        if(!hasSpecial){
            throw new RuntimeException("password must contain special characters");
        }
    }
}
