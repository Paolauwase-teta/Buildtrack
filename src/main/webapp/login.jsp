<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | ConstructMIS</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="css/auth.css">
    </head>

    <body>
        <div class="auth-container">
            <!-- Left Side - Illustration -->
            <div class="auth-left">
                <div class="auth-illustration">
                    <div class="illustration-content">
                        <h2 class="illustration-title">Welcome Back!</h2>
                        <p class="illustration-text">
                            Continue managing your construction projects with powerful tools and real-time insights.
                        </p>
                        <div class="illustration-features">
                            <div class="feature-item">
                                <div class="feature-icon">✓</div>
                                <span>Real-time Project Tracking</span>
                            </div>
                            <div class="feature-item">
                                <div class="feature-icon">✓</div>
                                <span>Team Collaboration Tools</span>
                            </div>
                            <div class="feature-item">
                                <div class="feature-icon">✓</div>
                                <span>Automated Reporting</span>
                            </div>
                        </div>
                    </div>
                    <img src="data:image/svg+xml,%3Csvg viewBox='0 0 500 400' xmlns='http://www.w3.org/2000/svg'%3E%3Ccircle cx='250' cy='200' r='180' fill='%23E8E5F5' opacity='0.4'/%3E%3Crect x='150' y='100' width='200' height='200' rx='15' fill='white' stroke='%236C63FF' stroke-width='3'/%3E%3Crect x='150' y='100' width='200' height='40' rx='15' fill='%236C63FF'/%3E%3Ccircle cx='165' cy='120' r='5' fill='white'/%3E%3Ccircle cx='180' cy='120' r='5' fill='white'/%3E%3Ccircle cx='195' cy='120' r='5' fill='white'/%3E%3Crect x='170' y='160' width='80' height='10' rx='5' fill='%236C63FF' opacity='0.3'/%3E%3Crect x='170' y='180' width='120' height='10' rx='5' fill='%236C63FF' opacity='0.2'/%3E%3Crect x='170' y='200' width='100' height='10' rx='5' fill='%236C63FF' opacity='0.2'/%3E%3Ccircle cx='380' cy='180' r='15' fill='%23FFB89D'/%3E%3Cpath d='M 365 180 Q 380 165 395 180' fill='%23FFC107'/%3E%3Crect x='370' y='195' width='20' height='30' rx='3' fill='%236C63FF'/%3E%3Cline x1='370' y1='205' x2='355' y2='215' stroke='%236C63FF' stroke-width='5' stroke-linecap='round'/%3E%3Cline x1='390' y1='205' x2='405' y2='215' stroke='%236C63FF' stroke-width='5' stroke-linecap='round'/%3E%3Crect x='374' y='225' width='6' height='25' rx='3' fill='%23FF9800'/%3E%3Crect x='380' y='225' width='6' height='25' rx='3' fill='%23FF9800'/%3E%3C/svg%3E"
                        alt="Login Illustration" class="illustration-img">
                </div>
            </div>

            <!-- Right Side - Login Form -->
            <div class="auth-right">
                <div class="auth-form-container">
                    <div class="auth-header">
                        <a href="index.jsp" class="back-link">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                <path d="M12.5 15L7.5 10L12.5 5" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round" />
                            </svg>
                            <span>Back to Home</span>
                        </a>
                        <div class="logo">
                            <div class="logo-icon">🏗️</div>
                            <span>ConstructMIS</span>
                        </div>
                        <h1>Sign In</h1>
                        <p>Enter your credentials to access your account</p>
                    </div>

                    <% String error=(String) request.getAttribute("error"); if(error !=null){ %>
                        <div class="alert alert-error">
                            <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                <circle cx="10" cy="10" r="8" stroke="currentColor" stroke-width="2" />
                                <path d="M10 6V10M10 14H10.01" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" />
                            </svg>
                            <span>
                                <%= error %>
                            </span>
                        </div>
                        <% } if(request.getParameter("success") !=null){ %>
                            <div class="alert alert-success">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                    <circle cx="10" cy="10" r="8" stroke="currentColor" stroke-width="2" />
                                    <path d="M7 10L9 12L13 8" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" />
                                </svg>
                                <span>Account created successfully! Please sign in.</span>
                            </div>
                            <% } %>

                                <form action="UserController" method="post" class="auth-form">
                                    <input type="hidden" name="action" value="login">

                                    <div class="form-group">
                                        <label for="email">Email Address</label>
                                        <div class="input-wrapper">
                                            <svg class="input-icon" width="20" height="20" viewBox="0 0 20 20"
                                                fill="none">
                                                <path
                                                    d="M3 4H17C17.55 4 18 4.45 18 5V15C18 15.55 17.55 16 17 16H3C2.45 16 2 15.55 2 15V5C2 4.45 2.45 4 3 4Z"
                                                    stroke="currentColor" stroke-width="2" />
                                                <path d="M18 5L10 11L2 5" stroke="currentColor" stroke-width="2"
                                                    stroke-linecap="round" />
                                            </svg>
                                            <input type="email" id="email" name="email" placeholder="you@example.com"
                                                required>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <div class="input-wrapper">
                                            <svg class="input-icon" width="20" height="20" viewBox="0 0 20 20"
                                                fill="none">
                                                <rect x="4" y="9" width="12" height="9" rx="2" stroke="currentColor"
                                                    stroke-width="2" />
                                                <path d="M7 9V6C7 4.34315 8.34315 3 10 3C11.6569 3 13 4.34315 13 6V9"
                                                    stroke="currentColor" stroke-width="2" />
                                            </svg>
                                            <input type="password" id="password" name="password"
                                                placeholder="Enter your password" required>
                                        </div>
                                    </div>

                                    <div class="form-options">
                                        <label class="checkbox-label">
                                            <input type="checkbox" name="remember">
                                            <span>Remember me</span>
                                        </label>
                                        <a href="#" class="forgot-link">Forgot password?</a>
                                    </div>

                                    <button type="submit" class="btn-submit">
                                        <span>Sign In</span>
                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none">
                                            <path d="M7.5 15L12.5 10L7.5 5" stroke="currentColor" stroke-width="2"
                                                stroke-linecap="round" stroke-linejoin="round" />
                                        </svg>
                                    </button>
                                </form>

                                <div class="auth-footer">
                                    <p>Don't have an account? <a href="signup.jsp">Create Account</a></p>
                                </div>
                </div>
            </div>
        </div>
    </body>

    </html>