<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Construction MIS | Premium Management</title>

        <!-- SEO Meta Tags -->
        <meta name="description"
            content="Construction Management Information System - Premium solutions for modern project management.">

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&display=swap"
            rel="stylesheet">

        <!-- Custom Style -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/landing.css">
    </head>

    <body>

        <div class="rings rings-tl">
            <div class="inner-ring"></div>
        </div>
        <div class="rings rings-br">
            <div class="inner-ring"></div>
        </div>
        <div class="bg-shape shadow-shape"></div>
        <div class="bg-shape color-shape"></div>

        <header>
            <nav>
                <div class="logo">
                    <div class="logo-circle"></div>
                    <span>ConstructMIS</span>
                </div>
                <ul class="nav-links">
                    <li><a href="${pageContext.request.contextPath}/index.jsp" class="active">Home</a></li>
                    <li><a href="#">News</a></li>
                    <li><a href="#">About us</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
                <div class="nav-auth">
                    <% if (session.getAttribute("user")==null) { %>
                        <a href="${pageContext.request.contextPath}/login.jsp" class="btn-login">Login</a>
                        <a href="${pageContext.request.contextPath}/register.jsp" class="btn-signup-nav">Register</a>
                        <% } else { %>
                            <a href="${pageContext.request.contextPath}/dashboard.jsp" class="btn-login">Dashboard</a>
                            <a href="${pageContext.request.contextPath}/logout" class="btn-signup-nav">Logout</a>
                            <% } %>
                </div>
            </nav>
        </header>

        <main class="hero">
            <div class="hero-content">
                <h1 class="hero-title">CONSTRUCTION MGMT<br>MADE INTELLIGENT</h1>
                <p class="hero-description">
                    Empower your building projects with our comprehensive Management Information System.
                    Streamline workflows, manage onsite resources, and monitor real-time progress all in one place.
                </p>
                <div class="hero-actions">
                    <a href="${pageContext.request.contextPath}/register.jsp" class="btn-main">GET STARTED</a>
                </div>

                <div class="pagination">
                    <div class="dot active"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                    <div class="dot"></div>
                </div>
            </div>

            <div class="hero-image-container">
                <div class="hero-image">
                    <img src="${pageContext.request.contextPath}/images/hero.png?v=<%= System.currentTimeMillis() %>"
                        alt="Construction Illustration">
                </div>
                <!-- Decorative animated car -->
                <div class="car-animation">
                    <svg viewBox="0 0 24 24" fill="var(--primary)" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M18.92 6.01C18.72 5.42 18.16 5 17.5 5H6.5C5.84 5 5.28 5.42 5.08 6.01L3 12V20C3 20.55 3.45 21 4 21H5C5.55 21 6 20.55 6 20V19H18V20C18 20.55 18.45 21 19 21H20C20.55 21 21 20.55 21 20V12L18.92 6.01ZM6.85 7H17.15L18.22 10H5.78L6.85 7ZM19 17H5V12H19V17ZM7.5 16C8.33 16 9 15.33 9 14.5C9 13.67 8.33 13 7.5 13C6.67 13 6 13.67 6 14.5C6 15.33 6.67 16 7.5 16ZM16.5 16C17.33 16 18 15.33 18 14.5C18 13.67 17.33 13 16.5 13C15.67 13 15 13.67 15 14.5C15 15.33 15.67 16 16.5 16Z" />
                    </svg>
                </div>
            </div>
        </main>

        <div class="bg-decoration">
            <div class="gear gear-1"></div>
            <div class="gear gear-2"></div>
            <div class="cog-pattern"></div>
        </div>

    </body>

    </html>