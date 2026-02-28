package com.example.constructionmis.controllers;

import com.example.constructionmis.daos.UserDAO;
import com.example.constructionmis.services.UserService;
import com.example.constructionmis.util.EmailUtil;
import com.example.constructionmis.util.HibernateUtil;
import com.example.constructionmis.util.OTPUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.constructionmis.models.User;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/auth/*")
// this means any request starting with /auth/ will go this servelet

public class AuthController extends HttpServlet {

    // helper methods to create UserService
    // this avoids repeating codes in every method
    private UserService getUserService() {
        // Create a new EntityManager (used by Hibernate)
        EntityManager em = HibernateUtil.getEntityManager();

        // Pass EntityManager into DAO
        UserDAO userDAO = new UserDAO(em);

        // returns a new userService using the DAO
        return new UserService(userDAO);
    }

    // handles post requests
    // all login/register/logout will be post
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // GET THE PART AFTER AUTH
        String path = request.getPathInfo();

        // deciding which endpoints should be called
        if ("/register".equals(path)) {
            handleRegister(request, response);
        } else if ("/login".equals(path)) {
            handleLogin(request, response);
        } else if ("/logout".equals(path)) {
            handleLogout(request, response);
        } else if ("/verify".equals(path)) {
            handleVerifyOTP(request, response);
        } else {
            // if endopoint is invalid
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid auth endpoint");
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // GETTING USER SERVICE
        UserService userService = getUserService();

        // Getting data from the request
        String fullName = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        User user = new User();
        user.setFullName(fullName.trim());
        user.setEmail(email.trim().toLowerCase());
        user.setPassword(password);
        user.setRole(role);

        try {
            userService.registerUser(user);

            // generate otp
            String otp = OTPUtil.generateOTP();
            // store otp temporary in session
            HttpSession session = request.getSession();
            session.setAttribute("otp", otp);
            session.setAttribute("tempUser", user);

            // send otp email
            EmailUtil.sendEmail(user.getEmail(), "Account Verification OTP", "Your otp is :  " + otp);
            response.sendRedirect(request.getContextPath() + "/verify-otp.jsp");
        } catch (RuntimeException e) {
            response.setStatus(HttpServletResponse.SC_CONFLICT);
            response.getWriter().write(e.getMessage());
        }
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserService userService = getUserService();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userService.authenticateUser(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            String role = user.getRole();
            // role-based redirection
            if (user.getRole().equalsIgnoreCase("ADMIN")) {
                response.sendRedirect(request.getContextPath() + "/secure/admin/dashboard.jsp");
            } else if (user.getRole().equalsIgnoreCase("ENGINEER")) {
                response.sendRedirect(request.getContextPath() + "/secure/engineer/dashboard.jsp");
            } else if (user.getRole().equalsIgnoreCase("MANAGER")) {
                response.sendRedirect(request.getContextPath() + "/secure/manager/dashboard.jsp");
            } else {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
            }
        } else {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("invalid credentials");
        }

    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.getWriter().write("Logged out successfully");
    }

    private void handleVerifyOTP(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Step 1: Get the current session
        HttpSession session = request.getSession();
        // Step 2: Extract the OTP code entered by the user from the form
        String enteredOtp = request.getParameter("otp");
        // Step 3: Retrieve the correct OTP that was stored in the session during
        // registration
        String sessionOtp = (String) session.getAttribute("otp");
        // Step 4: Retrieve the user object that we temporarily stored in the session
        User tempUser = (User) session.getAttribute("tempUser");

        // Step 5: Check if the entered OTP matches the one in our session and the user
        // exists
        if (enteredOtp != null && enteredOtp.equals(sessionOtp) && tempUser != null) {
            // Step 6: Create or retrieve the User Service instance to update the database
            UserService userService = getUserService();
            // Step 7: Update the user's status to 'verified = true'
            tempUser.setVerified(true);
            // Step 8: Save the updated user status back to the database
            userService.updateUser(tempUser);

            // Step 9: Remove the temporary OTP and user data from the session
            session.removeAttribute("otp");
            session.removeAttribute("tempUser");

            // Step 10: Redirect the user successfully to the login page
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        } else {
            // Step 11: If verification fails, set an unauthorized status code
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            // Step 12: Inform the user that the code was incorrect
            response.getWriter().write("Invalid OTP codes. Try again.");
        }
    }
}