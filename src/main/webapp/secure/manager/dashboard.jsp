<%@ page import="com.example.constructionmis.models.*" %>
    <%@ page import="java.util.List" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <% User user=(User) session.getAttribute("user"); if(user==null ||
                !user.getRole().equalsIgnoreCase("PROJECT_MANAGER")) { response.sendRedirect(request.getContextPath()
                + "/login.jsp" ); return; } %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Manager Dashboard | BuildTrack</title>
                    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
                        rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard-premium.css">
                </head>

                <body>

                    <aside class="sidebar">
                        <div class="brand-logo">BuildTrack</div>
                        <div
                            style="font-size: 0.75rem; font-weight: 800; text-transform: uppercase; border: 1px solid black; padding: 4px; display: inline-block; margin-bottom: 25px;">
                            Manager Console</div>
                        <ul class="nav-menu">
                            <li class="nav-item"><a href="#" class="nav-link active">Dashboard</a></li>
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/ProjectController"
                                    class="nav-link">My Projects</a></li>
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/ReportController"
                                    class="nav-link">Reports Center</a></li>
                            <li class="nav-item"><a href="#" class="nav-link">Team Management</a></li>
                            <li class="nav-item"><a href="#" class="nav-link">Budget Tracking</a></li>
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
                <p>Welcome to your project management suite.</p>
            </div>
            <div style=" display: flex; gap: 10px;">
                                        <a href="${pageContext.request.contextPath}/ReportController"
                                            class="btn-primary"
                                            style="background: white; color: black; border: 2px solid black;">Generate
                                            Report</a>
                                        <a href="${pageContext.request.contextPath}/ProjectController?action=new"
                                            class="btn-primary">+ New Project</a>
                            </div>
                        </header>

                        <div class="stats-grid">
                            <div class="stat-card">
                                <div>
                                    <div class="stat-value">08</div>
                                    <div class="stat-label">Active Projects</div>
                                </div>
                            </div>
                            <div class="stat-card">
                                <div>
                                    <div class="stat-value">24</div>
                                    <div class="stat-label">Pending Tasks</div>
                                </div>
                            </div>
                            <div class="stat-card">
                                <div>
                                    <div class="stat-value">12</div>
                                    <div class="stat-label">Team Members</div>
                                </div>
                            </div>
                            <div class="stat-card">
                                <div>
                                    <div class="stat-value">05</div>
                                    <div class="stat-label">Critical Delays</div>
                                </div>
                            </div>
                        </div>

                        <section class="section-card">
                            <h3>Recent Project Progress</h3>
                            <div class="table-container">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Project ID</th>
                                            <th>Project Name</th>
                                            <th>Progress</th>
                                            <th>Lead Engineer</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>#PRJ-001</td>
                                            <td>City Hub Construction</td>
                                            <td>75%</td>
                                            <td>John Smith</td>
                                            <td><span class="status-badge status-active">Active</span></td>
                                            <td><button class="btn-action">Details</button></td>
                                        </tr>
                                        <tr>
                                            <td>#PRJ-004</td>
                                            <td>Skyline Plaza Phase II</td>
                                            <td>30%</td>
                                            <td>Paola Uwase</td>
                                            <td><span class="status-badge status-pending">In Review</span></td>
                                            <td><button class="btn-action">Details</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </main>

                </body>

                </html>