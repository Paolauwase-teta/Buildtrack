<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register | BuildTrack</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth-premium.css">
    </head>

    <body>

        <div class="toast-container" id="toastContainer"></div>

        <div class="auth-container">
            <div class="auth-header">
                <h1>Join the Team</h1>
                <p>Create your BuildTrack account to start managing projects.</p>
            </div>

            <!-- The form now uses AJAX (JavaScript) to prevent page refreshes and show Toasts -->
            <form id="registerForm" onsubmit="handleRegistration(event)">
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <div class="input-wrapper">
                        <input type="text" id="fullname" name="fullname" placeholder="Paola the Engineer" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="email">Email Address</label>
                    <div class="input-wrapper">
                        <input type="email" id="email" name="email" placeholder="you@company.com" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="role">Role</label>
                    <div class="input-wrapper">
                        <select id="role" name="role" required>
                            <!-- ROLES NOW MATCH THE CONTROLLER EXACTLY -->
                            <option value="ADMIN">System Administrator</option>
                            <option value="PROJECT_MANAGER">Project Manager</option>
                            <option value="SITE_ENGINEER">Site Engineer</option>
                            <option value="ARCHITECT">Architect</option>
                            <option value="CLIENT">Client</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <input type="password" id="password" name="password" placeholder="Create a strong password"
                            required onkeyup="checkPasswordStrength(this.value)">
                        <button type="button" class="password-toggle" onclick="togglePassword('password')">Show</button>
                    </div>
                    <div class="strength-meter">
                        <div id="strengthBar" class="strength-bar"></div>
                    </div>
                    <p id="strengthText"
                        style="font-size: 0.7rem; margin-top: 5px; text-transform: uppercase; font-weight: 700;"></p>
                </div>

                <button type="submit" class="btn-primary" id="submitBtn">Create Account</button>
            </form>

            <div class="auth-footer">
                Already have an account? <a href="${pageContext.request.contextPath}/login.jsp">Sign In</a>
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

            async function handleRegistration(event) {
                event.preventDefault();
                const btn = document.getElementById('submitBtn');
                const formData = new URLSearchParams(new FormData(event.target));

                btn.innerText = "PROCESSING...";
                btn.disabled = true;

                try {
                    const response = await fetch('${pageContext.request.contextPath}/auth/register', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                        body: formData.toString()
                    });

                    if (response.ok) {
                        showToast("Registration successful! Redirecting to verification...", "success");
                        setTimeout(() => {
                            window.location.href = "${pageContext.request.contextPath}/verify-otp.jsp";
                        }, 1500);
                    } else {
                        // FAILURE: Show Toast instead of blank page
                        const errorText = await response.text();
                        showToast(errorText, "error");
                    }
                } catch (e) {
                    showToast("Server error. Try again.", "error");
                } finally {
                    btn.innerText = "CREATE ACCOUNT";
                    btn.disabled = false;
                }
            }

            function togglePassword(id) {
                const input = document.getElementById(id);
                const btn = event.target;
                if (input.type === "password") {
                    input.type = "text";
                    btn.textContent = "Hide";
                } else {
                    input.type = "password";
                    btn.textContent = "Show";
                }
            }

            function checkPasswordStrength(password) {
                const bar = document.getElementById('strengthBar');
                const text = document.getElementById('strengthText');
                let strength = 0;
                if (password.length >= 8) strength += 25;
                if (password.match(/[A-Z]/)) strength += 25;
                if (password.match(/[0-9]/)) strength += 25;
                if (password.match(/[^a-zA-Z0-9]/)) strength += 25;
                bar.style.width = strength + "%";
                if (strength <= 25) { bar.style.backgroundColor = "#ff3b30"; text.innerText = "Too Weak"; text.style.color = "#ff3b30"; }
                else if (strength <= 50) { bar.style.backgroundColor = "#ff9500"; text.innerText = "Simple"; text.style.color = "#ff9500"; }
                else if (strength <= 75) { bar.style.backgroundColor = "#ffcc00"; text.innerText = "Medium"; text.style.color = "#ffcc00"; }
                else { bar.style.backgroundColor = "#34c759"; text.innerText = "Strong"; text.style.color = "#34c759"; }
            }
        </script>

    </body>

    </html>