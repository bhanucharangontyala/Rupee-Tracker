<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Income | ₹-Tracker</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(to right, #eef2f3, #dfe9f3);
	min-height: 100vh;
	display: flex;
	align-items: center;
}

.income-card {
	border-radius: 12px;
}

@media ( max-width :576px) {
	body {
		padding: 15px;
	}
}
</style>
</head>
<body>

	<div class="container">
		<div class="row justify-content-center">

			<div class="col-xl-5 col-lg-6 col-md-8 col-sm-12">

				<div class="card shadow-lg income-card p-4">

					<h3 class="text-center fw-bold mb-4">Enter Monthly Income</h3>

					<form action="IncomeController" method="post">

						<!-- Monthly Income -->
						<div class="mb-4">
							<label for="monthlyIncome" class="form-label"> Monthly
								Income (₹) </label> <input type="number" class="form-control"
								id="monthlyIncome" name="monthlyIncome"
								placeholder="Enter your monthly income" min="0" step="0.01"
								required>
						</div>

						<!-- Submit Button -->
						<div class="d-grid">
							<button type="submit" class="btn btn-dark">Save Income</button>
						</div>

					</form>

				</div>

			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>