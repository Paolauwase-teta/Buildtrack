<%@ page import="com.example.constructionmis.models.*" %>
    <%@ page import="java.util.List" %>
        <%@ page contentType="text/html;charset=UTF-8" language="java" %>
            <% User user=(User) session.getAttribute("user"); if(user==null ||
                (!user.getRole().equalsIgnoreCase("SITE_ENGINEER") && !user.getRole().equalsIgnoreCase("ARCHITECT"))) {
                response.sendRedirect(request.getContextPath() + "/login.jsp" ); return; } %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Engineer Dashboard | BuildTrack</title>
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
                            Engineer View</div>
                        <ul class="nav-menu">
                            <li class="nav-item"><a href="#" class="nav-link active">Task Board</a></li>
                            <li class="nav-item"><a
                                    href="${pageContext.request.contextPath}/TaskController?action=assigned"
                                    class="nav-link">Assigned Tasks</a></li>
                            <li class="nav-item"><a href="${pageContext.request.contextPath}/DelayController"
                                    class="nav-link">Report Delays</a></li>
                            <li class="nav-item"><a href="#" class="nav-link">Site Photos</a></li>
                            <li class="nav-item"><a href="#" class="nav-link">Blueprints</a></li>
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
                <p>Welcome to Site Engineer Dashboard</p>
            </div>
            <div style=" display: flex; gap: 10px;">
                                        <a href="${pageContext.request.contextPath}/DelayController?action=new"
                                            class="btn-primary"
                                            style="background: white; color: black; border: 2px solid black;">Report
                                            Delay</a>
                                        <a href="#" class="btn-primary">+ Update Progress</a>
                            </div>
                        </header>

                        <div class="stats-grid">
                            <div class="stat-card">
                                <div>
                                    <div class="stat-value">12</div>
                                    <div class="stat-label">Tasks Assigned</div>
                                </div>
                            </div>
                            <div class="stat-card">
                                <div>
                                    <div class="stat-value">04</div>
                                    <div class="stat-label">Tasks Finished</div>
                                </div>
                            </div>
                            <div class="stat-card">
                                <div>
                                    <div class="stat-value">02</div>
                                    <div class="stat-label">Active Delays</div>
                                </div>
                            </div>
                            <div class="stat-card">
                                <div>
                                    <div class="stat-value">08</div>
                                    <div class="stat-label">Days Remaining</div>
                                </div>
                            </div>
                        </div>

                        <section class="section-card">
                            <h3>Pending Tasks Today</h3>
                            <div class="table-container">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Task ID</th>
                                            <th>Description</th>
                                            <th>Priority</th>
                                            <th>Due Date</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>#TSK-102</td>
                                            <td>Foundation Excavation Phase 2</td>
                                            <td>High</td>
                                            <td>Tomorrow</td>
                                            <td><span class="status-badge status-active">In Progress</span></td>
                                            <td><button class="btn-action">Update</button></td>
                                        </tr>
                                        <tr>
                                            <td>#TSK-110</td>
                                            <td>Material Sourcing - Cement</td>
                                            <td>Medium</td>
                                            <td>Friday</td>
                                            <td><span class="status-badge status-pending">Pending</span></td>
                                            <td><button class="btn-action">Update</button></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </main>

                </body>

                </html>