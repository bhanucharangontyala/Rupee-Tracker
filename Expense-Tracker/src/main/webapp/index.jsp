<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>â¹-Tracker - Expense Tracker</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root {
	--primary-color: #4361ee;
	--secondary-color: #3f37c9;
	--accent-color: #4cc9f0;
	--light-color: #f8f9fa;
	--dark-color: #212529;
}

body {
	margin: 0;
	padding: 0;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f0f2f5;
}

.navbar {
	background: linear-gradient(135deg, var(--primary-color),
		var(--secondary-color));
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.navbar-brand {
	font-weight: 700;
	letter-spacing: 1px;
}

.hero-section {
	height: 100vh;
	background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
		url('https://images.unsplash.com/photo-1553877522-43269d4ea984?ixlib=rb-4.0.3&auto=format&fit=crop&w=1950&q=80');
	background-size: cover;
	background-position: center;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	padding: 20px;
}

.hero-quote {
	font-size: 1.5rem;
	font-weight: 300;
	max-width: 800px;
	margin: 0 auto;
	line-height: 1.6;
}

.feature-card {
	background: white;
	border-radius: 10px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	height: 100%;
	overflow: hidden;
}

.feature-card:hover {
	transform: translateY(-10px);
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
}

.feature-icon {
	font-size: 3rem;
	color: var(--primary-color);
	margin-bottom: 20px;
}

.section-title {
	position: relative;
	margin-bottom: 2.5rem;
	text-align: center;
}

.section-title:after {
	content: '';
	position: absolute;
	bottom: -15px;
	left: 50%;
	transform: translateX(-50%);
	width: 80px;
	height: 4px;
	background: var(--accent-color);
	border-radius: 2px;
}

.btn-primary {
	background: linear-gradient(135deg, var(--primary-color),
		var(--secondary-color));
	border: none;
	padding: 10px 25px;
	border-radius: 30px;
	font-weight: 600;
	transition: all 0.3s ease;
}

.btn-primary:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 20px rgba(67, 97, 238, 0.3);
}

.contact-form {
	background: white;
	border-radius: 10px;
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
	padding: 30px;
}

.form-control {
	border-radius: 8px;
	padding: 12px 15px;
	border: 1px solid #e1e5eb;
}

.form-control:focus {
	border-color: var(--accent-color);
	box-shadow: 0 0 0 0.25rem rgba(76, 201, 240, 0.25);
}

footer {
	background: linear-gradient(135deg, var(--dark-color), #0a0a0a);
	color: white;
	padding: 40px 0;
}

.footer-links a {
	color: #adb5bd;
	text-decoration: none;
	transition: color 0.3s;
}

.footer-links a:hover {
	color: white;
}

@media ( max-width : 768px) {
	.hero-quote {
		font-size: 1.2rem;
	}
	.display-4 {
		font-size: 2.5rem;
	}
}

@media ( min-width : 992px) {
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
</style>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
		<div class="container">
			<a class="navbar-brand fw-bold fs-4" href="#">&#8377;-Tracker</a>

			<!-- Toggler Button -->
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Collapsible Content -->
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto align-items-lg-center">
					<li class="nav-item"><a class="nav-link text-light"
						href="#home">Home</a></li>
					<li class="nav-item"><a class="nav-link text-light"
						href="#about">About</a></li>
					<li class="nav-item"><a class="nav-link text-light"
						href="#features">Features</a></li>
					<li class="nav-item"><a class="nav-link text-light"
						href="#contact">Contact</a></li>
					<li class="nav-item ms-lg-3 mt-2 mt-lg-0"><a
						class="btn btn-outline-light" href="./register.jsp">Register</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Hero Section -->
	<section class="hero-section" id="home">
		<div class="container">
			<h1 class="display-4 fw-bold mb-4">Take Control of Your Finances</h1>
			<p class="hero-quote">"Do not save what is left after spending,
				but spend what is left after saving."</p>
			<div class="mt-5">
				<a href="#features" class="btn btn-primary btn-lg me-3">Explore
					Features</a> <a href="./register.jsp"
					class="btn btn-outline-light btn-lg">Get Started</a>
			</div>
		</div>
	</section>

	<!-- About Section -->
	<section class="py-5 bg-white" id="about">
		<div class="container py-5">
			<div class="row align-items-center">
				<div class="col-lg-6 mb-4 mb-lg-0">
					<h2 class="section-title">About &#8377;-Tracker</h2>
					<p class="lead">Smart money management for everyone</p>
					<p>â¹-Tracker is a comprehensive personal finance application
						designed to help you take control of your financial life. Whether
						you're trying to save for a big purchase, pay off debt, or simply
						understand where your money goes each month, â¹-Tracker provides
						the tools you need.</p>
					<p>Our intuitive platform makes it easy to track expenses, set
						budgets, visualize spending patterns, and achieve your financial
						goals. With real-time insights and customizable categories,
						managing your finances has never been easier.</p>
					<div class="row mt-4">
						<div class="col-md-6">
							<ul class="list-unstyled">
								<li class="mb-2"><i
									class="fas fa-check-circle text-success me-2"></i> Real-time
									expense tracking</li>
								<li class="mb-2"><i
									class="fas fa-check-circle text-success me-2"></i> Custom
									budget creation</li>
								<li class="mb-2"><i
									class="fas fa-check-circle text-success me-2"></i> Spending
									analytics</li>
							</ul>
						</div>
						<div class="col-md-6">
							<ul class="list-unstyled">
								<li class="mb-2"><i
									class="fas fa-check-circle text-success me-2"></i> Multi-device
									sync</li>
								<li class="mb-2"><i
									class="fas fa-check-circle text-success me-2"></i> Financial
									goal setting</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="p-4 bg-light rounded shadow-sm">
						<img
							src="https://images.unsplash.com/photo-1553877522-43269d4ea984?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80"
							alt="Expense Tracking Dashboard" class="img-fluid rounded">
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Features Section -->
	<section class="py-5 bg-light" id="features">
		<div class="container py-5">
			<h2 class="section-title">Powerful Features</h2>
			<p class="text-center mb-5">Everything you need to manage your
				finances effectively</p>

			<div class="row">
				<div class="col-md-6 col-lg-4 mb-4">
					<div class="feature-card p-4 h-100">
						<div class="feature-icon">
							<i class="fas fa-chart-pie"></i>
						</div>
						<h4>Expense Analytics</h4>
						<p>Visualize your spending patterns with interactive charts
							and graphs to understand where your money goes.</p>
					</div>
				</div>

				<div class="col-md-6 col-lg-4 mb-4">
					<div class="feature-card p-4 h-100">
						<div class="feature-icon">
							<i class="fas fa-bullseye"></i>
						</div>
						<h4>Budget Goals</h4>
						<p>Set personalized budget limits for different categories and
							track your progress toward financial goals.</p>
					</div>
				</div>

				<div class="col-md-6 col-lg-4 mb-4">
					<div class="feature-card p-4 h-100">
						<div class="feature-icon">
							<i class="fas fa-bell"></i>
						</div>
						<h4>Smart Alerts</h4>
						<p>Receive notifications when you're approaching budget limits
							or unusual spending activity.</p>
					</div>
				</div>


				<div class="col-md-6 col-lg-4 mb-4">
					<div class="feature-card p-4 h-100">
						<div class="feature-icon">
							<i class="fas fa-cloud-download-alt"></i>
						</div>
						<h4>Data Export</h4>
						<p>Easily export your financial data in various formats for
							tax preparation or financial planning.</p>
					</div>
				</div>

				
			</div>
		</div>
	</section>

	<!-- Contact Section -->
	<section class="py-5" id="contact">
		<div class="container py-5">
			<h2 class="section-title">Get In Touch</h2>
			<p class="text-center mb-5">Have questions? We'd love to hear
				from you.</p>

			<div class="row">
				<div class="col-lg-6 mb-5 mb-lg-0">
					<div class="contact-form">
						<form>
							<div class="mb-3">
								<label for="name" class="form-label">Your Name</label> <input
									type="text" class="form-control" id="name"
									placeholder="John Doe">
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email Address</label> <input
									type="email" class="form-control" id="email"
									placeholder="john@example.com">
							</div>
							<div class="mb-3">
								<label for="subject" class="form-label">Subject</label> <input
									type="text" class="form-control" id="subject"
									placeholder="How can we help?">
							</div>
							<div class="mb-4">
								<label for="message" class="form-label">Message</label>
								<textarea class="form-control" id="message" rows="5"
									placeholder="Your message here..."></textarea>
							</div>
							<button type="submit" class="btn btn-primary w-100">Send
								Message</button>
						</form>
					</div>
				</div>

				<div class="col-lg-6">
					<div class="ps-lg-5">
						<h4>Contact Information</h4>
						<p class="mb-4">Feel free to reach out to us with any
							questions or feedback. Our team is here to help!</p>

						<div class="d-flex mb-3">
							<div class="me-3 text-primary">
								<i class="fas fa-map-marker-alt fa-2x"></i>
							</div>
							<div>
								<h5>Our Location</h5>
								<p>KPHB colony, Hyderabad, 500082</p>
							</div>
						</div>

						<div class="d-flex mb-3">
							<div class="me-3 text-primary">
								<i class="fas fa-phone fa-2x"></i>
							</div>
							<div>
								<h5>Phone Number</h5>
								<p>+91 8341676632</p>
							</div>
						</div>

						<div class="d-flex mb-3">
							<div class="me-3 text-primary">
								<i class="fas fa-envelope fa-2x"></i>
							</div>
							<div>
								<h5>Email Address</h5>
								<p>support@rupeetracker.com</p>
							</div>
						</div>

						<div class="d-flex">
							<div class="me-3 text-primary">
								<i class="fas fa-clock fa-2x"></i>
							</div>
							<div>
								<h5>Working Hours</h5>
								<p>Monday - Friday: 9AM - 6PM</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-4 mb-md-0">
					<h5 class="fw-bold mb-3">â¹-Tracker</h5>
					<p>Your trusted partner in financial management. Take control
						of your expenses and achieve your financial goals with our
						intuitive platform.</p>
					<div class="d-flex mt-4">
						<a href="#" class="text-white me-3"><i
							class="fab fa-facebook-f"></i></a> <a href="#"
							class="text-white me-3"><i class="fab fa-twitter"></i></a> <a
							href="#" class="text-white me-3"><i class="fab fa-instagram"></i></a>
						<a href="#" class="text-white me-3"><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>

				<div class="col-md-2 mb-4 mb-md-0">
					<h5 class="fw-bold mb-3">Quick Links</h5>
					<ul class="list-unstyled footer-links">
						<li class="mb-2"><a href="#home">Home</a></li>
						<li class="mb-2"><a href="#about">About Us</a></li>
						<li class="mb-2"><a href="#features">Features</a></li>
						<li class="mb-2"><a href="#contact">Contact</a></li>
					</ul>
				</div>

				<div class="col-md-3 mb-4 mb-md-0">
					<h5 class="fw-bold mb-3">Features</h5>
					<ul class="list-unstyled footer-links">
						<li class="mb-2"><a href="#">Expense Tracking</a></li>
						<li class="mb-2"><a href="#">Budget Planning</a></li>
						<li class="mb-2"><a href="#">Financial Reports</a></li>
						<li class="mb-2"><a href="#">Goal Setting</a></li>
					</ul>
				</div>

				<div class="col-md-3">
					<h5 class="fw-bold mb-3">Newsletter</h5>
					<p>Subscribe to our newsletter for the latest updates.</p>
					<div class="input-group">
						<input type="email" class="form-control" placeholder="Your Email">
						<button class="btn btn-primary">Subscribe</button>
					</div>
				</div>
			</div>

			<hr class="my-4 bg-light">

			<div class="text-center">
				<p class="mb-0">&copy; 2026 &#8377;-Tracker. All rights reserved.</p>
			</div>
		</div>
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<script>
    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                window.scrollTo({
                    top: target.offsetTop - 70,
                    behavior: 'smooth'
                });
            }
        });
    });
    
    // Add scroll animation to navbar
    window.addEventListener('scroll', function() {
        const navbar = document.querySelector('.navbar');
        if (window.scrollY > 50) {
            navbar.classList.add('shadow');
        } else {
            navbar.classList.remove('shadow');
        }
    });
</script>

</body>
</html>
