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
        } else if ("/verify-otp".equals(path)) {
            handleOTPVerify(request, response);
        } else if ("/resend-otp".equals(path)) {
            handleResendOTP(request, response);
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
            EmailUtil.sendEmail(user.getEmail(), "Account Verification OTP", "Your verification code is: " + otp);
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

            // MFA FLOW: Always generate security code before session granting
            String otp = OTPUtil.generateOTP();
            session.setAttribute("otp", otp);
            session.setAttribute("tempUser", user);

            try {
                EmailUtil.sendEmail(user.getEmail(), "Security Verification Code",
                        "Hello " + user.getFullName() + ", your BuildTrack security code is: " + otp);

                // Return verification page URL to AJAX handler
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write(request.getContextPath() + "/verify-otp.jsp");
            } catch (Exception e) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Failed to send verification code. Check email connection.");
            }
        } else {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("Invalid email or password");
        }
    }

    private String getDashboardUrl(HttpServletRequest request, String role) {
        String url = request.getContextPath();
        if (role.equalsIgnoreCase("ADMIN")) {
            url += "/secure/admin/dashboard.jsp";
        } else if (role.equalsIgnoreCase("PROJECT_MANAGER")) {
            url += "/secure/manager/dashboard.jsp";
        } else if (role.equalsIgnoreCase("SITE_ENGINEER") || role.equalsIgnoreCase("ARCHITECT")) {
            url += "/secure/engineer/dashboard.jsp";
        } else {
            url += "/dashboard.jsp";
        }
        return url;
    }

    private void handleLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }

    private void handleOTPVerify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String enteredOtp = request.getParameter("otp");
        String sessionOtp = (String) session.getAttribute("otp");
        User tempUser = (User) session.getAttribute("tempUser");

        if (enteredOtp != null && enteredOtp.equals(sessionOtp) && tempUser != null) {
            UserService userService = getUserService();

            if (!tempUser.isVerified()) {
                tempUser.setVerified(true);
                userService.updateUser(tempUser);
            }

            session.setAttribute("user", tempUser);
            session.removeAttribute("otp");
            session.removeAttribute("tempUser");

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(getDashboardUrl(request, tempUser.getRole()));
        } else {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("Invalid code. Try again.");
        }
    }

    private void handleResendOTP(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        User tempUser = (User) session.getAttribute("tempUser");

        if (tempUser != null) {
            // ALWAYS generate a NEW code for security (Prevents reuse if intercepted)
            String newOtp = OTPUtil.generateOTP();
            session.setAttribute("otp", newOtp);

            try {
                EmailUtil.sendEmail(tempUser.getEmail(), "New Verification Code",
                        "Your new activation code is: " + newOtp);
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("New code sent!");
            } catch (Exception e) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("Failed to resend code.");
            }
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Session expired. Please try logging in again.");
        }
    }
}
