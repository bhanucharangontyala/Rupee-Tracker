<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register | ₹-Tracker</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
    rel="stylesheet">

<style>
.register-card {
    border-radius: 12px;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    border: none;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
}

.form-control {
    border-radius: 8px;
    padding: 12px 15px;
    border: 1px solid #e1e5eb;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: #4361ee;
    box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
}

.btn-register {
    border-radius: 8px;
    padding: 12px;
    font-weight: 600;
    background: linear-gradient(135deg, #4361ee, #3f37c9);
    border: none;
    transition: all 0.3s ease;
}

.btn-register:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 20px rgba(67, 97, 238, 0.3);
}

.btn-register:active {
    transform: translateY(-1px);
}

body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
        url('https://images.unsplash.com/photo-1553877522-43269d4ea984?ixlib=rb-4.0.3&auto=format&fit=crop&w=1950&q=80');
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

.navbar {
    background: linear-gradient(135deg, #4361ee, #3f37c9);
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.navbar-brand {
    font-weight: 700;
    letter-spacing: 1px;
}

.hero-section {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 20px;
    padding-top: 80px;
}

.form-label {
    text-align: start !important;
    font-weight: 500;
    margin-bottom: 8px;
    color: #333;
}

.card-header {
    background: transparent;
    border-bottom: 1px solid #eee;
    padding-bottom: 20px;
}

.card-header h3 {
    color: #4361ee;
    margin: 0;
}

.alert-success {
    border-radius: 8px;
    background-color: #d4edda;
    border: 1px solid #c3e6cb;
    color: #155724;
    padding: 12px 15px;
    margin-bottom: 20px;
}

.alert-success strong {
    font-weight: 600;
}

.login-link {
    text-align: center;
    margin-top: 15px;
}

.login-link a {
    color: #4361ee;
    text-decoration: none;
    font-weight: 500;
    transition: all 0.3s ease;
}

.login-link a:hover {
    color: #3f37c9;
    text-decoration: underline;
}

.footer {
    background: linear-gradient(135deg, #212529, #0a0a0a);
    color: white;
    padding: 20px 0;
    text-align: center;
    font-size: 0.9rem;
    margin-top: auto;
}

.footer a {
    color: #adb5bd;
    text-decoration: none;
    transition: color 0.3s;
}

.footer a:hover {
    color: white;
}

/* Larger text for large screens */
@media (min-width: 992px) {
    .navbar-brand {
        font-size: 1.8rem;
    }
    .navbar-nav .nav-link {
        font-size: 1.1rem;
        margin-left: 15px;
        margin-right: 15px;
    }
    .navbar .btn {
        font-size: 1.1rem;
        padding: 8px 18px;
    }
}

@media (max-width: 576px) {
    .hero-section {
        padding: 20px 15px;
        padding-top: 80px;
    }
    
    .register-card {
        padding: 25px 20px;
    }
}
</style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            <a class="navbar-brand fw-bold fs-4" href="./index.jsp">₹-Tracker</a>

            <!-- Toggler Button -->
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Collapsible Content -->
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto align-items-lg-center">
                    <li class="nav-item"><a class="nav-link text-light"
                        href="./index.jsp">Home</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-7 col-sm-10">
                    <div class="card register-card">
                        <div class="card-body p-4">
                            <div class="card-header text-center mb-4">
                                <h3>Create Account</h3>
                                <p class="text-muted mb-0">Join ₹-Tracker today</p>
                            </div>
                            
                            <% String message = (String) request.getAttribute("message");
                               if (message != null && !message.isEmpty()) { %>
                                <div class="alert alert-success" role="alert">
                                    <strong>Success!</strong> <%= message %>
                                </div>
                            <% } %>
                            
                            <form action="RegisterController" method="post">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Username</label> 
                                    <input
                                        type="text" class="form-control" id="username" name="username"
                                        placeholder="Enter username" required>
                                </div>

                                <div class="mb-3">
                                    <label for="fullname" class="form-label">Full Name</label> 
                                    <input
                                        type="text" class="form-control" id="fullname" name="fullname"
                                        placeholder="Enter full name" required>
                                </div>

                                <div class="mb-3">
                                    <label for="email" class="form-label">Email Address</label> 
                                    <input
                                        type="email" class="form-control" id="email" name="email"
                                        placeholder="Enter email address" required>
                                </div>

                                <div class="mb-4">
                                    <label for="password" class="form-label">Password</label> 
                                    <input
                                        type="password" class="form-control" id="password"
                                        name="password" placeholder="Create password" required>
                                </div>

                                <div class="d-grid">
                                    <button type="submit" class="btn btn-register text-white">
                                        Create Account
                                    </button>
                                </div>
                                
                                <div class="login-link">
                                    <a href="./login.jsp">Already have an account? Login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <div class="footer">
        <div class="container">
            <p class="mb-0">&copy; 2026 ₹-Tracker. All rights reserved. | 
                <a href="#">Privacy Policy</a> | 
                <a href="#">Terms of Service</a>
            </p>
        </div>
    </div>
    
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
