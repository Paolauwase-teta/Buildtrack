<%@ page import="java.util.List" %>
    <%@ page import="com.example.constructionmis.models.Project" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <% if(session.getAttribute("user")==null){ response.sendRedirect("login.jsp"); return; } %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Projects | ConstructionMIS</title>
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
                                    <a href="DashboardController" class="nav-link">
                                        <span class="nav-icon"></span> Dashboard
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="ProjectController" class="nav-link active">
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
                                    <h2>Project Management</h2>
                                    <p>Manage on-site projects and locations</p>
                                </div>
                            </header>

                            <!-- Error Alert -->
                            <% String error=(String) request.getAttribute("error"); if(error !=null){ %>
                                <div
                                    style="background-color: rgba(239, 68, 68, 0.2); color: #fca5a5; padding: 1rem; border: 1px solid var(--danger); border-radius: 12px; margin-bottom: 1.5rem; backdrop-filter: blur(8px);">
                                    <strong style="color: var(--danger)">Connection Failure:</strong>
                                    <%= error %> <br>
                                        <small>Check 'src/main/resources/hibernate.cfg.xml' and MySQL Service.</small>
                                </div>
                                <% } %>

                                    <!-- Add Project Section -->
                                    <div class="glass-panel" style="padding: 1.5rem; margin-bottom: 2rem;">
                                        <h3>Create New Project</h3>
                                        <form action="ProjectController" method="post"
                                            style="display: grid; grid-template-columns: 1fr 1fr auto; gap: 1rem; align-items: end; margin-top: 1rem;">
                                            <input type="hidden" name="action" value="add">

                                            <div class="form-group" style="margin-bottom: 0;">
                                                <label>Project Name</label>
                                                <input type="text" name="projectName" placeholder="Project Name"
                                                    required>
                                            </div>

                                            <div class="form-group" style="margin-bottom: 0;">
                                                <label>Location</label>
                                                <input type="text" name="location" placeholder="Location" required>
                                            </div>

                                            <button type="submit" class="btn-primary" style="height: 48px;">Add
                                                Project</button>
                                        </form>
                                    </div>

                                    <!-- Project List Table -->
                                    <div class="glass-panel" style="padding: 1.5rem;">
                                        <div class="table-container">
                                            <table>
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Project Name</th>
                                                        <th>Location</th>
                                                        <th>Status (Auto)</th>
                                                        <th>Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <% List<Project> projects = (List<Project>)
                                                            request.getAttribute("projects");
                                                            if (projects != null) {
                                                            for (Project p : projects) {
                                                            %>
                                                            <tr>
                                                                <td style="color: var(--text-dim);">
                                                                    <%= p.getId() %>
                                                                </td>
                                                                <td style="font-weight: 500; color: var(--white);">
                                                                    <%= p.getProjectName() %>
                                                                </td>
                                                                <td>
                                                                    <%= p.getLocation() %>
                                                                </td>
                                                                <td><span
                                                                        class="status-badge status-active">Active</span>
                                                                </td>
                                                                <td>
                                                                    <a href="ProjectController?action=delete&id=<%= p.getId() %>"
                                                                        class="btn-action btn-delete"
                                                                        style="text-decoration: none;">Delete</a>
                                                                </td>
                                                            </tr>
                                                            <% } } else { %>
                                                                <tr>
                                                                    <td colspan="5"
                                                                        style="text-align: center; padding: 2rem; color: var(--text-dim);">
                                                                        No projects found or database unconnected.
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