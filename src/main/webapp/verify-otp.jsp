<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Verify OTP | BuildTrack</title>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth-premium.css">
    </head>

    <body>

        <div class="toast-container" id="toastContainer"></div>

        <div class="auth-container">
            <div class="auth-header">
                <h1>Verify OTP</h1>
                <p>We've sent a 6-digit code to your email. Enter it below to activate your account.</p>
            </div>

            <form id="verifyOtpForm" onsubmit="handleVerification(event)">
                <div class="form-group">
                    <label for="otp">6-Digit Code</label>
                    <div class="input-wrapper">
                        <input type="text" id="otp" name="otp" placeholder="000 000" maxlength="8"
                            style="letter-spacing: 5px; text-align: center; font-size: 1.5rem;" required>
                    </div>
                </div>

                <button type="submit" class="btn-primary" id="verifyBtn">Verify Account</button>
            </form>

            <div class="auth-footer">
                Didn't receive the code? <a href="#" onclick="resendOtp(event)">Resend Code</a><br><br>
                <a href="${pageContext.request.contextPath}/register.jsp">Back to Register</a>
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

            async function handleVerification(event) {
                event.preventDefault();
                const btn = document.getElementById('verifyBtn');
                const formData = new URLSearchParams(new FormData(event.target));

                btn.innerText = "VERIFYING...";
                btn.disabled = true;

                try {
                    const response = await fetch('${pageContext.request.contextPath}/auth/verify-otp', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                        body: formData.toString()
                    });

                    if (response.ok) {
                        const redirectUrl = await response.text();
                        showToast("Verification Successful! Redirecting...", "success");
                        setTimeout(() => {
                            window.location.href = redirectUrl;
                        }, 1200);
                    } else {
                        const errorText = await response.text();
                        showToast(errorText || "Invalid OTP code", "error");
                    }
                } catch (e) {
                    showToast("Server error. Try again.", "error");
                } finally {
                    btn.innerText = "VERIFY ACCOUNT";
                    btn.disabled = false;
                }
            }

            async function resendOtp(event) {
                event.preventDefault();
                const resendLink = event.target;
                const originalText = resendLink.innerText;

                resendLink.innerText = "SENDING...";
                resendLink.style.pointerEvents = "none";

                try {
                    const response = await fetch('${pageContext.request.contextPath}/auth/resend-otp', {
                        method: 'POST'
                    });

                    if (response.ok) {
                        showToast("A new check code was sent to your email.", "success");
                    } else {
                        const errorMsg = await response.text();
                        showToast(errorMsg || "Failed to resend code.");
                    }
                } catch (e) {
                    showToast("Network error. Try again.");
                } finally {
                    setTimeout(() => {
                        resendLink.innerText = originalText;
                        resendLink.style.pointerEvents = "auto";
                    }, 5000); // 5s cooldown
                }
            }
        </script>

    </body>

    </html>