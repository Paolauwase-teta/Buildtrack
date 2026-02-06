<%@ page import="java.util.List" %>
    <%@ page import="com.example.constructionmis.models.Project" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <% // Check session if(session.getAttribute("user")==null){ response.sendRedirect("login.jsp"); return; } //
                Set default values if attributes are missing (e.g. direct access without controller) Integer
                activeProjects=(request.getAttribute("activeProjects") !=null) ? (Integer)
                request.getAttribute("activeProjects") : 0; Integer pendingTasks=(request.getAttribute("pendingTasks")
                !=null) ? (Integer) request.getAttribute("pendingTasks") : 0; Integer
                criticalDelays=(request.getAttribute("criticalDelays") !=null) ? (Integer)
                request.getAttribute("criticalDelays") : 0; Integer totalReports=(request.getAttribute("totalReports")
                !=null) ? (Integer) request.getAttribute("totalReports") : 0; %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Dashboard | ConstructionMIS</title>
                    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
                        rel="stylesheet">
                    <link rel="stylesheet" href="css/style.css">
                </head>

                <body>

                    <div class="dashboard-layout">
                        <!-- Sidebar -->
                        <aside class="glass-panel sidebar"
                            style="margin: 0; border-radius: 0; border-top: none; border-bottom: none;">
                            <div class="brand-logo" style="font-size: 1.5rem;">ConstructMIS</div>

                            <ul class="nav-menu">
                                <li class="nav-item">
                                    <a href="DashboardController" class="nav-link active">
                                        <span class="nav-icon"></span> Dashboard
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="ProjectController" class="nav-link">
                                        <span class="nav-icon"></span> Projects
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <span class="nav-icon"></span> Tasks
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <span class="nav-icon"></span> Team
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <span class="nav-icon"></span> Delays
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <span class="nav-icon"></span> Reports
                                    </a>
                                </li>
                            </ul>

                            <div style="margin-top: auto;">
                                <a href="UserController?action=logout" class="nav-link" style="color: var(--danger);">
                                    <span class="nav-icon"></span> Logout
                                </a>
                            </div>
                        </aside>

                        <!-- Main Content -->
                        <main class="main-content">
                            <header
                                style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                                <div>
                                    <h2>Dashboard Overview</h2>
                                    <p>Welcome back, User</p>
                                </div>
                                <a href="projects.jsp" class="btn-primary"
                                    style="width: auto; padding: 0.5rem 1.5rem; text-decoration: none;">+ New
                                    Project</a>
                            </header>

                            <!-- Error Display -->
                            <% String error=(String) request.getAttribute("error"); if(error !=null){ %>
                                <div
                                    style="background-color: rgba(239, 68, 68, 0.2); color: #fca5a5; padding: 1rem; border: 1px solid var(--danger); border-radius: 12px; margin-bottom: 1.5rem;">
                                    <strong>System Error:</strong>
                                    <%= error %>
                                </div>
                                <% } %>

                                    <!-- Stats Cards -->
                                    <div class="stats-grid">
                                        <div class="glass-panel stat-card">
                                            <div>
                                                <div class="stat-value">
                                                    <%= activeProjects %>
                                                </div>
                                                <div class="stat-label">Total Projects</div>
                                            </div>
                                            <div class="stat-icon"></div>
                                        </div>
                                        <div class="glass-panel stat-card">
                                            <div>
                                                <div class="stat-value">
                                                    <%= pendingTasks %>
                                                </div>
                                                <div class="stat-label">All Tasks</div>
                                            </div>
                                            <div class="stat-icon"
                                                style="color: var(--secondary); background: rgba(252, 211, 77, 0.1);">
                                            </div>
                                        </div>
                                        <div class="glass-panel stat-card">
                                            <div>
                                                <div class="stat-value">
                                                    <%= criticalDelays %>
                                                </div>
                                                <div class="stat-label">Delays Logged</div>
                                            </div>
                                            <div class="stat-icon"
                                                style="color: var(--danger); background: rgba(239, 68, 68, 0.1);">
                                            </div>
                                        </div>
                                        <div class="glass-panel stat-card">
                                            <div>
                                                <div class="stat-value">
                                                    <%= totalReports %>
                                                </div>
                                                <div class="stat-label">Reports Generated</div>
                                            </div>
                                            <div class="stat-icon"
                                                style="color: var(--success); background: rgba(16, 185, 129, 0.1);">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Recent Activity Section -->
                                    <div class="glass-panel" style="padding: 1.5rem;">
                                        <h3 style="color: var(--white); margin-bottom: 1rem;">Recent Projects</h3>

                                        <div class="table-container">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Project Name</th>
                                                        <th>Location</th>
                                                        <th>Status</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% List<Project> recentProjects = (List<Project>)
                                                            request.getAttribute("recentProjects");
                                                            if (recentProjects != null && !recentProjects.isEmpty()) {
                                                            for (Project p : recentProjects) {
                                                            %>
                                                            <tr>
                                                                <td style="color: var(--text-dim);">
                                                                    <%= p.getId() %>
                                                                </td>
                                                                <td style="font-weight: 500;">
                                                                    <%= p.getProjectName() %>
                                                                </td>
                                                                <td>
                                                                    <%= p.getLocation() %>
                                                                </td>
                                                                <td><span
                                                                        class="status-badge status-active">Active</span>
                                                                </td>
                                                                <td>
                                                                    <button class="btn-action btn-edit">View</button>
                                                                </td>
                                                            </tr>
                                                            <% } } else { %>
                                                                <tr>
                                                                    <td colspan="5"
                                                                        style="text-align: center; padding: 2rem; color: var(--text-dim);">
                                                                        No projects found.
                                                                    </td>
                                                                </tr>
                                                                <% } %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                        </main>
                    </div>

                </body>

                </html>