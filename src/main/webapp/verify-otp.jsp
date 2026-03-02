<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Verify Email | BuildTrack</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth-premium.css">
    </head>

    <body>

        <div class="auth-container">
            <div class="auth-header">
                <h1>Verify Email</h1>
                <p>We've sent a code to your email. Please enter it below to activate your account.</p>
            </div>

            <% String error=request.getParameter("error"); if(error !=null) { %>
                <div class="alert alert-error">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="12" cy="12" r="10"></circle>
                        <line x1="12" y1="8" x2="12" y2="12"></line>
                        <line x1="12" y1="16" x2="12.01" y2="16"></line>
                    </svg>
                    <%= error %>
                </div>
                <% } %>

                    <form action="${pageContext.request.contextPath}/auth/verify-otp" method="post">
                        <div class="form-group">
                            <label for="otp">6-Digit Code</label>
                            <div class="input-wrapper">
                                <input type="text" id="otp" name="otp" placeholder="000 000" maxlength="8"
                                    style="letter-spacing: 5px; text-align: center; font-size: 1.5rem;" required>
                            </div>
                        </div>

                        <button type="submit" class="btn-primary">Verify Account</button>
                    </form>

                    <div class="auth-footer">
                        Didn't receive the code? <a href="#">Resend Code</a><br><br>
                        <a href="${pageContext.request.contextPath}/register.jsp">Back to Register</a>
                    </div>
        </div>

    </body>

    </html>