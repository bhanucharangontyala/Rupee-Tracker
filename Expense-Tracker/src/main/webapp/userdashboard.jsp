<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="et.model.User,et.model.User_income,java.util.List,et.model.Category,et.dao.CategoryDAO"%>
<%
String pageName = (String) request.getAttribute("page");
if (pageName == null) {
	pageName = "home";
}

User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Dashboard | ₹-Tracker</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
	rel="stylesheet">
<link href="./styles/dashboard.css" rel="stylesheet">
<style>

</style>
</head>
<body>

	<!-- ===== Desktop Sidebar ===== -->
	<div class="sidebar-desktop d-none d-lg-block">
		<a href="Dashboard?page=home"> <i class="bi bi-currency-rupee"></i><span>Dashboard</span>
		</a> <a href="Dashboard?page=expenses"> <i class="bi bi-cash-stack"></i>
			<span>Expenses</span>
		</a> <a href="Dashboard?page=categories"> <i class="bi bi-tags"></i> <span>Categories</span>
		</a> <a href="Dashboard?page=charts"><i class="bi bi-bar-chart"></i><span>Charts</span></a>
		<a href="Dashboard?page=history"><i class="bi bi-clock-history"></i><span>History</span></a>
	</div>

	<!-- ===== Main Content ===== -->
	<div class="main-content">

		<!-- Top Navbar -->
		<div class="top-navbar">

			<!-- Mobile Menu Button -->
			<button class="btn btn-dark d-lg-none" data-bs-toggle="offcanvas"
				data-bs-target="#mobileSidebar">
				<i class="bi bi-list"></i>
			</button>

			<!-- Amount Left -->
			<div class="amount-box">₹ ${not empty sessionScope.income and not empty sessionScope.totalEx 
    ? sessionScope.income - sessionScope.totalEx 
    : 0}
				Left This Month</div>

			<!-- User Dropdown -->
			<div class="dropdown">
				<a href="#"
					class="d-flex align-items-center text-decoration-none dropdown-toggle"
					data-bs-toggle="dropdown"> <span
					class="me-2 fw-semibold d-none d-sm-inline"> <%=((User) session.getAttribute("user")).getUserName()%>
				</span> <img src="https://i.pravatar.cc/150?img=3" class="profile-img">
				</a>
				<ul class="dropdown-menu dropdown-menu-end">
					<li><a class="dropdown-item" href="#">Profile</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item text-danger" href="./login.jsp">Logout</a></li>
				</ul>
			</div>
		</div>

		<!-- Dashboard Cards -->
		<div class="container mt-4">
			<%
			if (pageName.equals("home")) {
			%>
			<div class="row g-4">
				<div class="col-xl-4 col-md-6 col-12">
					<div class="card shadow-sm p-4">
						<h6>Total Expenses</h6>
						<h3 class="text-danger">₹ ${not empty sessionScope.totalEx 
    ? sessionScope.totalEx 
    : 0}</h3>
					</div>
				</div>

				<div class="col-xl-4 col-md-6 col-12">
					<div class="card shadow-sm p-4">
						<h6>Total Savings</h6>
						<h3 class="text-success">₹ 4,900</h3>
					</div>
				</div>

				<div class="col-xl-4 col-md-12 col-12">
					<div class="card shadow-sm p-4">
						<h6>Monthly Budget</h6>
						<h3 class="text-primary">₹ ${sessionScope.income}</h3>
					</div>
				</div>
				<%
				} else if (pageName.equals("expenses")) {
				%>

				<!-- Include addExpense Page -->
				<%@ include file="addexpense.jsp"%>

				<%
				} else if (pageName.equals("categories")) {
				%>

				<!-- Include Categories Page -->
				<%@ include file="categories.jsp"%>

				<%
				} else if (pageName.equals("charts")) {
				%>

				<%@ include file="charts.jsp"%>

				<%
				} else if (pageName.equals("history")) {
				%>

				<%@ include file="history.jsp"%>

				<%
				}
				%>
			</div>
		</div>

	</div>

	<!-- ===== Mobile Offcanvas Sidebar ===== -->
	<div class="offcanvas offcanvas-start bg-dark text-white" tabindex="-1"
		id="mobileSidebar">

		<div class="offcanvas-header">
			<h5>₹-Tracker</h5>
			<button type="button" class="btn-close btn-close-white"
				data-bs-dismiss="offcanvas"></button>
		</div>

		<div class="offcanvas-body">
			<a href="Dashboard?page=home" class="d-block text-white mb-3"> <i
				class="bi bi-currency-rupee"></i><span>Dashboard</span></a> <a
				href="Dashboard?page=expenses" class="d-block text-white mb-3">
				<i class="bi bi-cash-stack"></i> <span>Expenses</span>
			</a> <a href="Dashboard?page=categories" class="d-block text-white mb-3">
				<i class="bi bi-tags"></i> <span>Categories</span>
			</a> <a href="Dashboard?page=charts" class="d-block text-white mb-3"><i
				class="bi bi-bar-chart me-2"></i>Charts</a> <a
				href="Dashboard?page=history" class="d-block text-white mb-3"><i
				class="bi bi-clock-history me-2"></i>History</a>
		</div>
	</div>

	<%
	String message = (String) session.getAttribute("message");
	if (message != null) {
	%>

	<div id="loginAlert"
		class="alert alert-success text-center position-fixed top-0 start-50 translate-middle-x mt-3 shadow"
		style="z-index: 9999; min-width: 300px;">
		<%=message%>
	</div>

	<script>
    // Hide alert after 3 seconds
    setTimeout(function () {
        let alertBox = document.getElementById("loginAlert");
        if (alertBox) {
            alertBox.style.transition = "opacity 0.5s";
            alertBox.style.opacity = "0";
            setTimeout(() => alertBox.remove(), 500);
        }
    }, 3000); // 3000ms = 3 seconds
	</script>

	<%
	session.removeAttribute("message");
	}
	%>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>