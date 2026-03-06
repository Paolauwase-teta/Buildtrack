<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login | BuildTrack</title>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth-premium.css">
    </head>

    <body>

        <div class="toast-container" id="toastContainer"></div>

        <div class="auth-container">
            <div class="auth-header">
                <h1>Welcome Back</h1>
                <p>Sign in to continue managing your construction projects.</p>
            </div>

            <!-- AJAX based login for Toast support -->
            <form id="loginForm" onsubmit="handleLogin(event)">
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <div class="input-wrapper">
                        <input type="email" id="email" name="email" placeholder="you@company.com" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <input type="password" id="password" name="password" placeholder="••••••••" required>
                        <button type="button" class="password-toggle" onclick="togglePassword('password')">Show</button>
                    </div>
                </div>

                <!-- Captcha Section -->
                <div class="form-group">
                    <label>Human Verification</label>
                    <div class="captcha-container">
                        <div id="captchaCode" class="captcha-code"></div>
                        <div class="input-wrapper" style="flex: 1;">
                            <input type="text" id="captchaInput" placeholder="Enter code" required>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn-primary" id="loginBtn">Sign In</button>
            </form>

            <div class="auth-footer">
                Don't have an account? <a href="${pageContext.request.contextPath}/register.jsp">Create for free</a>
            </div>
        </div>

        <script>
            function showToast(message, type = "error") {
                const container = document.getElementById('toastContainer');
                const toast = document.createElement('div');
                toast.className = `toast ${type}`;
                toast.innerText = message;
                container.appendChild(toast);
                setTimeout(() => toast.remove(), 4000);
            }

            async function handleLogin(event) {
                event.preventDefault();
                const captchaInput = document.getElementById('captchaInput').value.toUpperCase();
                if (captchaInput !== currentCaptcha) {
                    showToast("Invalid Verification Code", "error");
                    generateCaptcha();
                    return;
                }

                const btn = document.getElementById('loginBtn');
                const formData = new URLSearchParams(new FormData(event.target));
                btn.innerText = "AUTHENTICATING...";
                btn.disabled = true;

                try {
                    const response = await fetch('${pageContext.request.contextPath}/auth/login', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                        body: formData.toString()
                    });

                    if (response.ok) {
                        const redirectUrl = await response.text();
                        showToast("Credentials verified. Sending OTP...", "success");
                        setTimeout(() => {
                            window.location.href = redirectUrl;
                        }, 1200);
                    } else {
                        // FAILURE: Capture the raw text from response.getWriter().write()
                        const errorMsg = await response.text();
                        showToast(errorMsg || "Invalid Credentials", "error");
                    }
                } catch (e) {
                    showToast("Connection Error. Try again.", "error");
                } finally {
                    btn.innerText = "SIGN IN";
                    btn.disabled = false;
                }
            }

            // Existing UI Logics
            let currentCaptcha = "";
            function generateCaptcha() {
                const chars = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";
                let code = "";
                for (let i = 0; i < 5; i++) code += chars.charAt(Math.floor(Math.random() * chars.length));
                currentCaptcha = code;
                document.getElementById('captchaCode').innerText = code;
            }
            window.onload = generateCaptcha;

            function togglePassword(id) {
                const input = document.getElementById(id);
                const btn = event.target;
                if (input.type === "password") { input.type = "text"; btn.textContent = "Hide"; }
                else { input.type = "password"; btn.textContent = "Show"; }
            }
        </script>

    </body>

    </html>