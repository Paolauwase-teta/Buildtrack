<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BuildTrack - Construction Management</title>
        <link
            href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="css/landing.css">
    </head>

    <body>
        <!-- Navigation -->
        <nav class="navbar">
            <div class="logo">
                <div class="logo-icon">🏗️</div>
                <span class="logo-text">BUILDTRACK</span>
            </div>
            <ul class="nav-menu">
                <li><a href="#services" class="nav-link">Services</a></li>
                <li><a href="#projects" class="nav-link">Projects</a></li>
                <li><a href="#about" class="nav-link">About us</a></li>
                <li><a href="#cases" class="nav-link">Cases</a></li>
            </ul>
            <div class="nav-right">
                <span class="lang">ENG</span>
                <a href="login.jsp" class="btn-contact">LOGIN</a>
            </div>
        </nav>

        <!-- Hero Section with Background -->
        <section class="hero-main">
            <div class="hero-container">
                <!-- Left Content -->
                <div class="hero-left">
                    <h1 class="main-title">
                        THE<br>
                        <span class="title-perfect">PERFECT</span><br>
                        <span class="title-project">PROJECT<sup>®</sup></span>
                    </h1>
                    <p class="subtitle">/ We manage construction projects /</p>
                    <button class="btn-start" onclick="window.location.href='signup.jsp'">START</button>
                </div>

                <!-- Right Card -->
                <div class="hero-right">
                    <div class="project-card">
                        <!-- Tags -->
                        <div class="card-tags">
                            <span class="tag">Planning</span>
                            <span class="tag">Tracking</span>
                            <span class="tag tag-active">3D</span>
                        </div>

                        <!-- Card Content -->
                        <div class="card-main-content">
                            <h3 class="card-title">Unique design &<br>management</h3>
                            <p class="card-subtitle">From blueprints to completion.</p>
                        </div>

                        <!-- Room Tour Preview -->
                        <div class="room-tour">
                            <div class="tour-preview">
                                <div class="play-button">▶</div>
                                <span class="tour-text">PROJECTTOUR</span>
                            </div>
                            <div class="preview-image">
                                <svg viewBox="0 0 120 80" xmlns="http://www.w3.org/2000/svg">
                                    <rect width="120" height="80" rx="8" fill="#E8DCC8" />
                                    <rect x="10" y="15" width="100" height="50" rx="4" fill="#D4C4B0" />
                                    <rect x="20" y="25" width="30" height="20" fill="#8B7355" />
                                    <line x1="35" y1="35" x2="35" y2="40" stroke="#5A4A3A" stroke-width="2" />
                                </svg>
                            </div>
                        </div>

                        <!-- Building Illustration -->
                        <div class="building-main">
                            <svg viewBox="0 0 500 350" xmlns="http://www.w3.org/2000/svg">
                                <!-- Modern curved building -->
                                <defs>
                                    <linearGradient id="buildingGrad1" x1="0%" y1="0%" x2="100%" y2="100%">
                                        <stop offset="0%" style="stop-color:#E8C4B0;stop-opacity:1" />
                                        <stop offset="100%" style="stop-color:#D4B4A0;stop-opacity:1" />
                                    </linearGradient>
                                    <linearGradient id="buildingGrad2" x1="0%" y1="0%" x2="100%" y2="100%">
                                        <stop offset="0%" style="stop-color:#F5D4C4;stop-opacity:1" />
                                        <stop offset="100%" style="stop-color:#E8C4B0;stop-opacity:1" />
                                    </linearGradient>
                                    <linearGradient id="roofGrad" x1="0%" y1="0%" x2="100%" y2="100%">
                                        <stop offset="0%" style="stop-color:#3C3C3C;stop-opacity:1" />
                                        <stop offset="100%" style="stop-color:#2A2A2A;stop-opacity:1" />
                                    </linearGradient>
                                </defs>

                                <!-- Left curved section (beige/pink) -->
                                <path d="M 80 320 L 80 140 Q 80 120 100 120 L 200 120 Q 220 120 220 140 L 220 320 Z"
                                    fill="url(#buildingGrad1)" />

                                <!-- Curved roof -->
                                <ellipse cx="150" cy="130" rx="90" ry="45" fill="url(#roofGrad)" />

                                <!-- Right section (lighter pink) -->
                                <rect x="220" y="100" width="180" height="220" fill="url(#buildingGrad2)" />

                                <!-- Vertical accent line -->
                                <line x1="220" y1="100" x2="220" y2="320" stroke="#3C3C3C" stroke-width="4" />

                                <!-- Windows on left curved section -->
                                <rect x="110" y="160" width="35" height="45" rx="3" fill="#8B6B55" opacity="0.6" />
                                <rect x="155" y="160" width="35" height="45" rx="3" fill="#8B6B55" opacity="0.6" />
                                <rect x="110" y="220" width="35" height="45" rx="3" fill="#8B6B55" opacity="0.6" />
                                <rect x="155" y="220" width="35" height="45" rx="3" fill="#8B6B55" opacity="0.6" />

                                <!-- Windows on right section -->
                                <rect x="245" y="130" width="40" height="50" rx="3" fill="#D4A574" opacity="0.5" />
                                <rect x="300" y="130" width="40" height="50" rx="3" fill="#D4A574" opacity="0.5" />
                                <rect x="355" y="130" width="40" height="50" rx="3" fill="#D4A574" opacity="0.5" />
                                <rect x="245" y="200" width="40" height="50" rx="3" fill="#D4A574" opacity="0.5" />
                                <rect x="300" y="200" width="40" height="50" rx="3" fill="#D4A574" opacity="0.5" />
                                <rect x="355" y="200" width="40" height="50" rx="3" fill="#D4A574" opacity="0.5" />

                                <!-- Ground/grass -->
                                <rect x="0" y="320" width="500" height="30" fill="#6B8E6B" opacity="0.3" />

                                <!-- Small window on roof -->
                                <circle cx="150" cy="125" r="8" fill="white" opacity="0.7" />

                                <!-- Lighting effect on right building -->
                                <rect x="355" y="260" width="40" height="30" fill="#FFE4D4" opacity="0.8" />
                            </svg>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Bottom Info Cards -->
            <div class="bottom-cards">
                <!-- Materials Card -->
                <div class="info-card materials-card">
                    <h3>We use best<br>materials!</h3>
                    <p>Working with verified<br>suppliers.</p>
                    <div class="materials-visual">
                        <svg viewBox="0 0 150 100" xmlns="http://www.w3.org/2000/svg">
                            <!-- Material layers illustration -->
                            <g transform="translate(20, 20)">
                                <!-- Layer 1 -->
                                <rect x="0" y="0" width="35" height="60" fill="#D4A574" stroke="#8B7355"
                                    stroke-width="2" />
                                <line x1="5" y1="10" x2="30" y2="10" stroke="#8B7355" stroke-width="1.5" />
                                <line x1="5" y1="20" x2="30" y2="20" stroke="#8B7355" stroke-width="1.5" />
                                <line x1="5" y1="30" x2="30" y2="30" stroke="#8B7355" stroke-width="1.5" />
                                <line x1="5" y1="40" x2="30" y2="40" stroke="#8B7355" stroke-width="1.5" />
                                <line x1="5" y1="50" x2="30" y2="50" stroke="#8B7355" stroke-width="1.5" />

                                <!-- Layer 2 -->
                                <rect x="40" y="5" width="35" height="55" fill="#E8DCC8" stroke="#8B7355"
                                    stroke-width="2" />
                                <rect x="45" y="15" width="25" height="8" fill="#C4B4A0" />
                                <rect x="45" y="28" width="25" height="8" fill="#C4B4A0" />
                                <rect x="45" y="41" width="25" height="8" fill="#C4B4A0" />

                                <!-- Layer 3 -->
                                <rect x="80" y="10" width="35" height="50" fill="#C4B4A0" stroke="#8B7355"
                                    stroke-width="2" />
                                <circle cx="97.5" cy="25" r="3" fill="#8B7355" />
                                <circle cx="97.5" cy="35" r="3" fill="#8B7355" />
                                <circle cx="97.5" cy="45" r="3" fill="#8B7355" />
                            </g>
                        </svg>
                    </div>
                </div>

                <!-- Customers Card -->
                <div class="info-card customers-card">
                    <div class="customer-avatars">
                        <div class="avatar">👷</div>
                        <div class="avatar">👨‍💼</div>
                    </div>
                    <h2 class="customer-count">12m+</h2>
                    <p class="customer-label">Customers</p>
                </div>

                <!-- Nature Card -->
                <div class="info-card nature-card">
                    <h3>WE CAN COMBINE<br>NATURE & PROJECT<br>COMFORT</h3>
                    <a href="#about" class="learn-more-btn">LEARN MORE</a>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-content">
                <div class="footer-section">
                    <div class="footer-logo">
                        <div class="logo-icon">🏗️</div>
                        <span>BUILDTRACK</span>
                    </div>
                    <p>Building the future of construction management.</p>
                </div>
                <div class="footer-section">
                    <h4>Product</h4>
                    <a href="#services">Services</a>
                    <a href="#projects">Projects</a>
                    <a href="signup.jsp">Sign Up</a>
                </div>
                <div class="footer-section">
                    <h4>Company</h4>
                    <a href="#about">About</a>
                    <a href="#contact">Contact</a>
                    <a href="login.jsp">Login</a>
                </div>
                <div class="footer-section">
                    <h4>Legal</h4>
                    <a href="#privacy">Privacy</a>
                    <a href="#terms">Terms</a>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2026 BuildTrack. All rights reserved.</p>
            </div>
        </footer>

        <script src="js/landing.js"></script>
    </body>

    </html>