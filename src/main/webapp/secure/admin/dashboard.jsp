<%@ page import="com.example.constructionmis.models.User" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <% User user=(User) session.getAttribute("user"); if(user==null || !user.getRole().equalsIgnoreCase("ADMIN")) {
            response.sendRedirect(request.getContextPath() + "/login.jsp" ); return; } %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Admin Dashboard | BuildTrack</title>
                <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap"
                    rel="stylesheet">
                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard-premium.css">
            </head>

            <body>

                <aside class="sidebar">
                    <div class="brand-logo">BuildTrack</div>
                    <ul class="nav-menu">
                        <li class="nav-item"><a href="#" class="nav-link active">Admin Home</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/UserController?action=list"
                                class="nav-link">User Management</a></li>
                        <li class="nav-item"><a href="${pageContext.request.contextPath}/ProjectController"
                                class="nav-link">System Projects</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">Security Logs</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">Settings</a></li>
                    </ul>
                    <div style="margin-top: auto;">
                        <a href="${pageContext.request.contextPath}/auth/logout" class="nav-link"
                            style="border: 1px solid var(--error); color: var(--error);">Logout</a>
                    </div>
                </aside>

                <main class="main-content">
                    <header>
                        <div>
                            <h2>Admin Console</h2>
                            <p>System Overview & Analytics</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/register.jsp" class="btn-primary">+ Create New
                            User</a>
                    </header>

                    <div class="stats-grid">
                        <div class="stat-card">
                            <div>
                                <div class="stat-value">124</div>
                                <div class="stat-label">Total Users</div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div>
                                <div class="stat-value">48</div>
                                <div class="stat-label">Active Projects</div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div>
                                <div class="stat-value">02</div>
                                <div class="stat-label">System Alerts</div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div>
                                <div class="stat-value">99%</div>
                                <div class="stat-label">Uptime</div>
                            </div>
                        </div>
                    </div>

                    <section class="section-card">
                        <h3>Recent System Activity</h3>
                        <div class="table-container">
                            <table>
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Role</th>
                                        <th>Action</th>
                                        <th>Timestamp</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Paola Uwase</td>
                                        <td>ADMIN</td>
                                        <td>User Creation</td>
                                        <td>Just Now</td>
                                        <td><span class="status-badge status-active">Success</span></td>
                                    </tr>
                                    <tr>
                                        <td>John Engineer</td>
                                        <td>SITE_ENGINEER</td>
                                        <td>Task Completion</td>
                                        <td>10 mins ago</td>
                                        <td><span class="status-badge status-active">Success</span></td>
                                    </tr>
                                    <tr>
                                        <td>System Daemon</td>
                                        <td>SYSTEM</td>
                                        <td>Daily Backup</td>
                                        <td>1 hour ago</td>
                                        <td><span class="status-badge status-active">Success</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </main>

            </body>

            </html>