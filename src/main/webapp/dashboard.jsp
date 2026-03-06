<%@ page import="com.example.constructionmis.models.*" %>
    <%@ page import="java.util.List" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <% User user=(User) session.getAttribute("user"); if(user==null) {
                response.sendRedirect(request.getContextPath() + "/login.jsp" ); return; } Integer
                activeProjects=(request.getAttribute("activeProjects") !=null) ? (Integer)
                request.getAttribute("activeProjects") : 0; Integer pendingTasks=(request.getAttribute("pendingTasks")
                !=null) ? (Integer) request.getAttribute("pendingTasks") : 0; %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Dashboard | BuildTrack</title>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard-premium.css">
                </head>

                <body>

                    <aside class="sidebar">
                        <div class="brand-logo">BuildTrack</div>
                        <div
                            style="font-size: 0.75rem; font-weight: 800; text-transform: uppercase; border: 1px solid black; padding: 4px; display: inline-block; margin-bottom: 25px;">
                            <%= user.getRole() %> Console
                        </div>
                        <ul class="nav-menu">
                            <li class="nav-item"><a href="#" class="nav-link active">Dashboard</a></li>
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/ProjectController"
                                    class="nav-link">Access Projects</a></li>
                            <li class="nav-item"><a href="#" class="nav-link">My Profile</a></li>
                            <li class="nav-item"><a href="#" class="nav-link">Feedback</a></li>
                        </ul>
                        <div style="margin-top: auto;">
                            <a href="${pageContext.request.contextPath}/auth/logout" class="nav-link"
                                style="border: 1px solid var(--error); color: var(--error);">Logout</a>
                        </div>
                    </aside>

                    <main class="main-content">
                        <header>
                            <div>
                                <h2>Hello, <%= user.getFullName().split(" ")[0] %></h2>
                <p>Track your construction project progress here.</p>
            </div>
            <a href=" ${pageContext.request.contextPath}/ProjectController" class="btn-primary">View All Projects</a>
                        </header>

                        <div class="stats-grid">
                            <div class="stat-card">
                                <div>
                                    <div class="stat-value">
                                        <%= activeProjects %>
                                    </div>
                                    <div class="stat-label">Total Projects</div>
                                </div>
                            </div>
                            <div class="stat-card">
                                <div>
                                    <div class="stat-value">
                                        <%= pendingTasks %>
                                    </div>
                                    <div class="stat-label">All Tasks</div>
                                </div>
                            </div>
                            <div class="stat-card">
                                <div>
                                    <div class="stat-value">-</div>
                                    <div class="stat-label">Status</div>
                                </div>
                            </div>
                            <div class="stat-card">
                                <div>
                                    <div class="stat-value">100%</div>
                                    <div class="stat-label">Verification</div>
                                </div>
                            </div>
                        </div>

                        <section class="section-card">
                            <h3>Recent Project Updates</h3>
                            <div class="table-container">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Project ID</th>
                                            <th>Name</th>
                                            <th>Update</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>#001</td>
                                            <td>Sample Building</td>
                                            <td>Initial Setup Complete</td>
                                            <td><span class="status-badge status-active">Done</span></td>
                                        </tr>
                                        <tr>
                                            <td colspan="4"
                                                style="text-align: center; padding: 3rem; color: var(--text-muted); letter-spacing: 1px; font-weight: 800;">
                                                [ More Updates Coming Soon ]</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </main>

                </body>

                </html>