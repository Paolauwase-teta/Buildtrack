<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | ConstructionMIS</title>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>

    <body>

        <div class="auth-container">
            <div class="glass-panel auth-card">
                <div class="auth-header">
                    <h1 class="brand-logo">ConstructMIS</h1>
                    <h2>Welcome Back</h2>
                    <p>Enter your credentials to access your dashboard</p>
                </div>

                <% String error=(String) request.getAttribute("error"); if(error !=null){ %>
                    <div
                        style="background-color: rgba(239, 68, 68, 0.2); color: #fca5a5; padding: 10px; border-radius: 8px; margin-bottom: 1rem; border: 1px solid var(--danger);">
                        <%= error %>
                    </div>
                    <% } if(request.getParameter("success") !=null){ %>
                        <div
                            style="background-color: rgba(16, 185, 129, 0.2); color: #86efac; padding: 10px; border-radius: 8px; margin-bottom: 1rem; border: 1px solid var(--success);">
                            Account created! Please sign in.
                        </div>
                        <% } %>

                            <form action="${pageContext.request.contextPath}/users" method="post">
                                <input type="hidden" name="action" value="login">
                                <div class="form-group">
                                    <label for="email">Email Address</label>
                                    <input type="email" id="email" name="email" placeholder="you@company.com" required>
                                </div>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" id="password" name="password" placeholder="Password"
                                        required>
                                </div>

                                <button type="submit" class="btn-primary">Sign In</button>
                            </form>

                            <div class="auth-footer">
                                <p>Don't have an account? <a
                                        href="${pageContext.request.contextPath}/register.jsp">Create Account</a></p>
                            </div>
            </div>
        </div>

    </body>

    </html>