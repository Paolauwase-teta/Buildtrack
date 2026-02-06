<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up | ConstructionMIS</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    </head>

    <body>

        <div class="auth-container">
            <div class="glass-panel auth-card">
                <div class="auth-header">
                    <h1 class="brand-logo">ConstructMIS</h1>
                    <h2>Create Account</h2>
                    <p>Join the team and start managing projects</p>
                </div>

                <% String error=(String) request.getAttribute("error"); if(error !=null){ %>
                    <div
                        style="background-color: rgba(239, 68, 68, 0.2); color: #fca5a5; padding: 10px; border-radius: 8px; margin-bottom: 1rem; border: 1px solid var(--danger);">
                        <%= error %>
                    </div>
                    <% } %>

                        <form action="${pageContext.request.contextPath}/users" method="post">
                            <input type="hidden" name="action" value="register">

                            <div class="form-group">
                                <label for="fullname">Full Name</label>
                                <input type="text" id="fullname" name="fullname" placeholder="John Doe" required>
                            </div>

                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="email" id="email" name="email" placeholder="you@company.com" required>
                            </div>

                            <div class="form-group">
                                <label for="role">Role</label>
                                <select id="role" name="role"
                                    style="width: 100%; padding: 0.75rem 1rem; background: rgba(15, 23, 42, 0.6); border: 1px solid var(--glass-border); border-radius: 8px; color: var(--white); outline: none;">
                                    <option value="PROJECT_MANAGER">Project Manager</option>
                                    <option value="SITE_ENGINEER">Site Engineer</option>
                                    <option value="ARCHITECT">Architect</option>
                                    <option value="CLIENT">Client</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" id="password" name="password"
                                    placeholder="Create a strong password" required>
                            </div>

                            <button type="submit" class="btn-primary">Sign Up</button>
                        </form>

                        <div class="auth-footer">
                            <p>Already have an account? <a href="${pageContext.request.contextPath}/login.jsp">Sign
                                    In</a></p>
                        </div>
            </div>
        </div>

    </body>

    </html>