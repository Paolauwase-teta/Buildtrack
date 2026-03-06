<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>BuildTrack | Construction Management System</title>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800;900&display=swap"
            rel="stylesheet">
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Outfit', -apple-system, sans-serif;
            }

            :root {
                --primary: #2563eb;
                --primary-dark: #1e40af;
                --primary-light: #eff6ff;
                --accent: #f59e0b;
                --text-dark: #0f172a;
                --text-light: #64748b;
                --white: #ffffff;
                --bg-subtle: #f8fafc;
                --border: #e2e8f0;
                --radius: 16px;
                --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            }

            body {
                background: var(--white);
                color: var(--text-dark);
                overflow-x: hidden;
            }

            /* ======= NAVBAR ======= */
            nav {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 1.25rem 8%;
                background: rgba(255, 255, 255, 0.8);
                backdrop-filter: blur(16px);
                position: sticky;
                top: 0;
                z-index: 1000;
                border-bottom: 1px solid var(--border);
            }

            .nav-logo {
                font-size: 1.5rem;
                font-weight: 800;
                color: var(--primary);
                letter-spacing: -0.5px;
            }

            .nav-links {
                display: flex;
                align-items: center;
                gap: 3rem;
            }

            .nav-links a {
                text-decoration: none;
                color: var(--text-dark);
                font-size: 0.9375rem;
                font-weight: 600;
                transition: color 0.2s;
            }

            .nav-links a:hover {
                color: var(--primary);
            }

            .nav-btn {
                background: var(--primary);
                color: white !important;
                padding: 0.75rem 1.75rem;
                border-radius: 100px;
                transition: all 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
            }

            .nav-btn:hover {
                background: var(--primary-dark);
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(37, 99, 235, 0.3);
            }

            /* ======= HERO ======= */
            .hero {
                min-height: 85vh;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                text-align: center;
                padding: 100px 8%;
                position: relative;
                background: radial-gradient(circle at 70% 30%, #eff6ff 0%, #ffffff 100%);
                overflow: hidden;
            }

            .hero::before {
                content: '';
                position: absolute;
                top: -100px;
                right: -100px;
                width: 400px;
                height: 400px;
                background: var(--primary-light);
                filter: blur(100px);
                z-index: 0;
                opacity: 0.6;
            }

            .hero-badge {
                position: relative;
                z-index: 1;
                display: inline-block;
                background: var(--primary-light);
                color: var(--primary);
                padding: 0.5rem 1.25rem;
                border-radius: 100px;
                font-size: 0.875rem;
                font-weight: 700;
                letter-spacing: 0.5px;
                margin-bottom: 2rem;
            }

            .hero h1 {
                position: relative;
                z-index: 1;
                font-size: clamp(3rem, 7vw, 5.5rem);
                font-weight: 800;
                letter-spacing: -2px;
                line-height: 1.1;
                max-width: 900px;
                margin-bottom: 2rem;
                color: var(--text-dark);
            }

            .hero h1 span {
                color: var(--primary);
                display: inline-block;
            }

            .hero p {
                position: relative;
                z-index: 1;
                font-size: 1.25rem;
                color: var(--text-light);
                max-width: 600px;
                line-height: 1.6;
                margin-bottom: 3.5rem;
            }

            .hero-buttons {
                position: relative;
                z-index: 1;
                display: flex;
                gap: 1.5rem;
                flex-wrap: wrap;
                justify-content: center;
            }

            .btn-hero-primary {
                background: var(--primary);
                color: white;
                padding: 1.125rem 2.5rem;
                font-weight: 700;
                font-size: 1.0625rem;
                border-radius: 100px;
                text-decoration: none;
                transition: all 0.3s;
                box-shadow: 0 10px 30px rgba(37, 99, 235, 0.25);
            }

            .btn-hero-primary:hover {
                transform: translateY(-4px) scale(1.02);
                background: var(--primary-dark);
                box-shadow: 0 20px 40px rgba(37, 99, 235, 0.3);
            }

            .btn-hero-secondary {
                background: var(--primary-light);
                color: var(--primary);
                padding: 1.125rem 2.5rem;
                font-weight: 700;
                font-size: 1.0625rem;
                border-radius: 100px;
                text-decoration: none;
                transition: all 0.3s;
            }

            .btn-hero-secondary:hover {
                background: #dbeafe;
                transform: translateY(-2px);
            }

            /* ======= STATS ======= */
            .stats-strip {
                display: flex;
                justify-content: center;
                background: var(--white);
                padding: 4rem 8%;
                gap: 2rem;
                border-bottom: 1px solid var(--border);
            }

            .stat-item {
                flex: 1;
                text-align: center;
                padding: 2rem;
                background: var(--bg-subtle);
                border-radius: var(--radius);
                transition: transform 0.3s;
            }

            .stat-item:hover {
                transform: translateY(-5px);
            }

            .stat-num {
                font-size: 3rem;
                font-weight: 800;
                color: var(--primary);
                letter-spacing: -1.5px;
            }

            .stat-label {
                font-size: 0.875rem;
                color: var(--text-light);
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 1px;
                margin-top: 0.5rem;
            }

            /* ======= FEATURES ======= */
            .section-header {
                padding: 6rem 8% 3rem;
                text-align: center;
            }

            .section-tag {
                font-size: 0.875rem;
                font-weight: 700;
                color: var(--primary);
                text-transform: uppercase;
                letter-spacing: 1.5px;
                margin-bottom: 1rem;
            }

            .section-header h2 {
                font-size: clamp(2rem, 4vw, 3rem);
                font-weight: 800;
                letter-spacing: -1px;
                color: var(--text-dark);
            }

            .features-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
                gap: 2.5rem;
                padding: 0 8% 6rem;
            }

            .feature-card {
                padding: 3rem 2.5rem;
                background: var(--white);
                border: 1px solid var(--border);
                border-radius: var(--radius);
                transition: all 0.4s cubic-bezier(0.165, 0.84, 0.44, 1);
                position: relative;
                overflow: hidden;
            }

            .feature-card:hover {
                border-color: var(--primary-light);
                transform: translateY(-10px);
                box-shadow: 0 30px 60px -15px rgba(0, 0, 0, 0.08);
            }

            .feature-icon {
                width: 56px;
                height: 56px;
                background: var(--primary-light);
                color: var(--primary);
                border-radius: 14px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 1.5rem;
                font-size: 1.5rem;
            }

            .feature-card h3 {
                font-size: 1.375rem;
                font-weight: 700;
                margin-bottom: 1rem;
                color: var(--text-dark);
            }

            .feature-desc {
                font-size: 1rem;
                color: var(--text-light);
                line-height: 1.6;
            }

            /* ======= ROLES ======= */
            .roles-section {
                padding: 6rem 8%;
                background: var(--bg-subtle);
            }

            .roles-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 2rem;
                margin-top: 4rem;
            }

            .role-card {
                background: var(--white);
                padding: 2.5rem;
                border-radius: var(--radius);
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.02);
                position: relative;
            }

            .role-num {
                font-size: 4rem;
                font-weight: 800;
                color: var(--primary);
                opacity: 0.05;
                position: absolute;
                top: 1rem;
                right: 1.5rem;
            }

            .role-title {
                font-size: 1.25rem;
                font-weight: 700;
                margin-bottom: 0.75rem;
                color: var(--text-dark);
            }

            .role-desc {
                font-size: 0.9375rem;
                color: var(--text-light);
                line-height: 1.6;
            }

            /* ======= CTA ======= */
            .cta-section {
                padding: 8rem 8%;
                background: var(--primary);
                color: white;
                display: flex;
                justify-content: space-between;
                align-items: center;
                gap: 4rem;
                border-radius: 40px;
                margin: 4rem 8%;
            }

            .cta-section h2 {
                font-size: clamp(2rem, 4vw, 3.5rem);
                font-weight: 800;
                letter-spacing: -2px;
                max-width: 600px;
                line-height: 1.1;
            }

            .cta-right {
                display: flex;
                flex-direction: column;
                gap: 1.5rem;
                align-items: flex-start;
            }

            .cta-right .btn-hero-primary {
                background: var(--white);
                color: var(--primary);
                box-shadow: 0 10px 30px rgba(255, 255, 255, 0.1);
            }

            .cta-right .btn-hero-secondary {
                background: rgba(255, 255, 255, 0.1);
                color: white;
                border: 1px solid rgba(255, 255, 255, 0.2);
            }

            /* ======= FOOTER ======= */
            footer {
                padding: 4rem 8%;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-top: 1px solid var(--border);
            }

            footer p {
                font-size: 0.9375rem;
                color: var(--text-light);
                font-weight: 500;
            }

            @media (max-width: 1024px) {
                .cta-section {
                    flex-direction: column;
                    text-align: center;
                    align-items: center;
                }

                .cta-right {
                    align-items: center;
                }
            }

            @media (max-width: 768px) {
                nav {
                    padding: 1rem 5%;
                }

                .nav-links {
                    display: none;
                }

                .hero {
                    padding: 80px 5%;
                }

                .stats-strip {
                    flex-direction: column;
                }

                footer {
                    flex-direction: column;
                    gap: 1rem;
                    text-align: center;
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