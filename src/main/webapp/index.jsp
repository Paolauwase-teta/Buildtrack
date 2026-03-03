<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BuildTrack | Construction Management System</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800;900&display=swap"
            rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            :root {
                --black: #000000;
                --white: #ffffff;
                --gray: #666666;
                --light: #f5f5f5;
                --border: #e0e0e0;
            }

            body {
                font-family: 'Inter', sans-serif;
                background: var(--white);
                color: var(--black);
                overflow-x: hidden;
            }

            /* ======= NAVBAR ======= */
            nav {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 22px 80px;
                border-bottom: 1px solid var(--border);
                position: sticky;
                top: 0;
                background: white;
                z-index: 100;
            }

            .nav-logo {
                font-size: 20px;
                font-weight: 900;
                letter-spacing: -1px;
                text-transform: uppercase;
            }

            .nav-links {
                display: flex;
                align-items: center;
                gap: 40px;
            }

            .nav-links a {
                text-decoration: none;
                color: var(--gray);
                font-size: 0.8rem;
                /* Slightly smaller for all-caps aesthetic */
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 1px;
                transition: color 0.2s;
            }

            .nav-links a:hover {
                color: var(--black);
            }

            .nav-btn {
                background: var(--black);
                color: white;
                padding: 10px 24px;
                text-decoration: none;
                font-weight: 700;
                font-size: 0.85rem;
                text-transform: uppercase;
                letter-spacing: 1px;
                transition: all 0.2s;
            }

            .nav-btn:hover {
                background: var(--gray);
                color: white !important;
            }

            /* ======= HERO ======= */
            .hero {
                min-height: 88vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
                padding: 80px 80px 60px;
                border-bottom: 1px solid var(--border);
                position: relative;
                background-image: radial-gradient(#e0e0e0 0.5px, transparent 0.5px);
                background-size: 24px 24px;
            }

            .hero-badge {
                display: inline-block;
                border: 1px solid var(--black);
                padding: 6px 16px;
                font-size: 0.75rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 2px;
                margin-bottom: 2rem;
            }

            .hero h1 {
                font-size: clamp(3rem, 8vw, 7rem);
                font-weight: 900;
                letter-spacing: -3px;
                line-height: 1;
                max-width: 900px;
                margin-bottom: 2rem;
            }

            .hero h1 span {
                display: inline-block;
                border-bottom: 5px solid var(--black);
            }

            .hero p {
                font-size: 1.15rem;
                color: var(--gray);
                max-width: 520px;
                line-height: 1.7;
                margin-bottom: 3rem;
            }

            .hero-buttons {
                display: flex;
                gap: 16px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .btn-hero-primary {
                background: var(--black);
                color: white;
                padding: 16px 40px;
                font-weight: 700;
                font-size: 0.95rem;
                text-transform: uppercase;
                letter-spacing: 1px;
                text-decoration: none;
                border: 1px solid var(--black);
                transition: all 0.2s;
                box-shadow: 6px 6px 0px rgba(0, 0, 0, 0.15);
            }

            .btn-hero-primary:hover {
                box-shadow: 2px 2px 0px rgba(0, 0, 0, 0.15);
                transform: translate(4px, 4px);
            }

            .btn-hero-secondary {
                background: white;
                color: var(--black);
                padding: 16px 40px;
                font-weight: 700;
                font-size: 0.95rem;
                text-transform: uppercase;
                letter-spacing: 1px;
                text-decoration: none;
                border: 1px solid var(--black);
                transition: all 0.2s;
            }

            .btn-hero-secondary:hover {
                background: var(--light);
            }

            /* ======= STATS STRIP ======= */
            .stats-strip {
                display: flex;
                justify-content: center;
                gap: 0;
                border-bottom: 1px solid var(--border);
            }

            .stat-item {
                padding: 40px 60px;
                border-right: 1px solid var(--border);
                text-align: center;
            }

            .stat-item:last-child {
                border-right: none;
            }

            .stat-num {
                font-size: 2.5rem;
                font-weight: 900;
                letter-spacing: -2px;
            }

            .stat-label {
                font-size: 0.8rem;
                color: var(--gray);
                text-transform: uppercase;
                letter-spacing: 1px;
                margin-top: 5px;
            }

            /* ======= FEATURES ======= */
            .section-header {
                padding: 80px 80px 40px;
            }

            .section-tag {
                font-size: 0.75rem;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 2px;
                color: var(--gray);
                margin-bottom: 12px;
            }

            .section-header h2 {
                font-size: clamp(2rem, 4vw, 3.5rem);
                font-weight: 900;
                letter-spacing: -2px;
            }

            .features-grid {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                border-top: 1px solid var(--border);
            }

            .feature-card {
                padding: 50px 40px;
                border-right: 1px solid var(--border);
                border-bottom: 1px solid var(--border);
                transition: background 0.2s;
            }

            .feature-card:hover {
                background: var(--black);
                color: white;
            }

            .feature-card:hover .feature-desc {
                color: #ccc;
            }

            .feature-card:nth-child(3),
            .feature-card:nth-child(6) {
                border-right: none;
            }

            .feature-icon {
                width: 48px;
                height: 48px;
                border: 2px solid var(--black);
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 24px;
                font-size: 1.3rem;
            }

            .feature-card:hover .feature-icon {
                border-color: white;
            }

            .feature-card h3 {
                font-size: 1.2rem;
                font-weight: 700;
                margin-bottom: 12px;
                letter-spacing: -0.5px;
            }

            .feature-desc {
                font-size: 0.9rem;
                color: var(--gray);
                line-height: 1.6;
            }

            /* ======= WHO IS IT FOR ======= */
            .roles-section {
                padding: 80px;
                border-top: 1px solid var(--border);
            }

            .roles-grid {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                gap: 0;
                margin-top: 50px;
                border: 1px solid var(--border);
            }

            .role-card {
                padding: 40px 30px;
                border-right: 1px solid var(--border);
                position: relative;
            }

            .role-card:last-child {
                border-right: none;
            }

            .role-num {
                font-size: 3rem;
                font-weight: 900;
                opacity: 0.06;
                position: absolute;
                top: 20px;
                right: 20px;
            }

            .role-title {
                font-size: 1.1rem;
                font-weight: 800;
                margin-bottom: 10px;
            }

            .role-desc {
                font-size: 0.85rem;
                color: var(--gray);
                line-height: 1.6;
            }

            /* ======= CTA ======= */
            .cta-section {
                padding: 100px 80px;
                border-top: 1px solid var(--border);
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 40px;
            }

            .cta-section h2 {
                font-size: clamp(2rem, 4vw, 3.5rem);
                font-weight: 900;
                letter-spacing: -2px;
                max-width: 500px;
                line-height: 1.1;
            }

            .cta-right {
                display: flex;
                flex-direction: column;
                gap: 16px;
                align-items: flex-start;
            }

            /* ======= FOOTER ======= */
            footer {
                border-top: 1px solid var(--border);
                padding: 40px 80px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            footer p {
                font-size: 0.85rem;
                color: var(--gray);
            }

            @media (max-width: 900px) {
                nav {
                    padding: 20px 24px;
                }

                .hero {
                    padding: 60px 24px;
                }

                .stats-strip {
                    flex-wrap: wrap;
                }

                .stat-item {
                    border-right: none;
                    border-bottom: 1px solid var(--border);
                    width: 50%;
                }

                .section-header {
                    padding: 60px 24px 30px;
                }

                .features-grid {
                    grid-template-columns: 1fr;
                }

                .feature-card {
                    border-right: none;
                }

                .roles-grid {
                    grid-template-columns: 1fr 1fr;
                }

                .cta-section {
                    flex-direction: column;
                    padding: 60px 24px;
                    align-items: flex-start;
                }

                footer {
                    flex-direction: column;
                    gap: 10px;
                    padding: 30px 24px;
                }
            }
        </style>
    </head>

    <body>

        <!-- NAVBAR -->
        <nav>
            <div class="nav-logo">BuildTrack</div>
            <div class="nav-links">
                <a href="#features">Features</a>
                <a href="#roles">Who It's For</a>
                <a href="register.jsp">Sign Up</a>
                <a href="login.jsp" class="nav-btn">Login</a>
            </div>
        </nav>

        <!-- HERO -->
        <section class="hero">
            <div class="hero-badge">Construction Management System</div>
            <h1>Build Smarter.<br><span>Track Faster.</span></h1>
            <p>One platform for project managers, engineers, architects and clients to plan, track and deliver
                construction projects on time — every time.</p>
            <div class="hero-buttons">
                <a href="register.jsp" class="btn-hero-primary">Get Started Free</a>
                <a href="login.jsp" class="btn-hero-secondary">Sign In</a>
            </div>
        </section>

        <!-- STATS STRIP -->
        <div class="stats-strip">
            <div class="stat-item">
                <div class="stat-num">500+</div>
                <div class="stat-label">Projects Tracked</div>
            </div>
            <div class="stat-item">
                <div class="stat-num">98%</div>
                <div class="stat-label">On-Time Delivery</div>
            </div>
            <div class="stat-item">
                <div class="stat-num">1200+</div>
                <div class="stat-label">Team Members</div>
            </div>
            <div class="stat-item">
                <div class="stat-num">24/7</div>
                <div class="stat-label">System Availability</div>
            </div>
        </div>

        <!-- FEATURES -->
        <div id="features">
            <div class="section-header">
                <p class="section-tag">What We Offer</p>
                <h2>Every tool your<br>team needs.</h2>
            </div>
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">&#9679;</div>
                    <h3>Project Tracking</h3>
                    <p class="feature-desc">Monitor every phase of your construction project in real-time with live
                        status updates and automated alerts.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">&#9650;</div>
                    <h3>Task Management</h3>
                    <p class="feature-desc">Assign, track and prioritize tasks across your entire team. Know who is
                        doing what and by when.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">&#9632;</div>
                    <h3>Delay Reporting</h3>
                    <p class="feature-desc">Log delays the moment they happen. Keep all stakeholders informed with
                        structured incident reports.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">&#9670;</div>
                    <h3>Role-Based Access</h3>
                    <p class="feature-desc">Admins, Managers, Engineers and Clients each see only what they need. Secure
                        and structured access control.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">&#9711;</div>
                    <h3>Analytics Dashboard</h3>
                    <p class="feature-desc">Data-driven insights to identify risks, measure performance and improve
                        delivery timelines.</p>
                </div>
                <div class="feature-card">
                    <div class="feature-icon">&#10022;</div>
                    <h3>Secure Auth + OTP</h3>
                    <p class="feature-desc">Email OTP verification, encrypted passwords and captcha-protected login to
                        keep your account safe.</p>
                </div>
            </div>
        </div>

        <!-- WHO IS IT FOR -->
        <div class="roles-section" id="roles">
            <div class="section-header" style="padding: 0 0 0 0;">
                <p class="section-tag">Built For</p>
                <h2>One system.<br>Every role.</h2>
            </div>
            <div class="roles-grid">
                <div class="role-card">
                    <div class="role-num">01</div>
                    <div class="role-title">Project Manager</div>
                    <p class="role-desc">Oversee all projects, manage tasks, track milestones and generate reports from
                        a single dashboard.</p>
                </div>
                <div class="role-card">
                    <div class="role-num">02</div>
                    <div class="role-title">Site Engineer</div>
                    <p class="role-desc">Log delays, update task progress and submit site reports directly from the
                        field.</p>
                </div>
                <div class="role-card">
                    <div class="role-num">03</div>
                    <div class="role-title">Architect</div>
                    <p class="role-desc">Access project specs, review timelines and collaborate with the engineering
                        team seamlessly.</p>
                </div>
                <div class="role-card">
                    <div class="role-num">04</div>
                    <div class="role-title">Client</div>
                    <p class="role-desc">Get transparent visibility into project progress, budgets and delivery
                        schedules at any time.</p>
                </div>
            </div>
        </div>

        <!-- CTA -->
        <section class="cta-section">
            <h2>Ready to take control of your projects?</h2>
            <div class="cta-right">
                <a href="register.jsp" class="btn-hero-primary">Create Free Account</a>
                <a href="login.jsp" class="btn-hero-secondary">Already have an account →</a>
            </div>
        </section>

        <!-- FOOTER -->
        <footer>
            <p><strong>BuildTrack</strong> &mdash; Construction Management System</p>
            <p>&copy; 2026 BuildTrack. All Rights Reserved.</p>
        </footer>

    </body>

    </html>