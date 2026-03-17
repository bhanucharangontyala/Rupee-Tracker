<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="et.model.User,et.model.Expenses,java.util.List,et.model.Category,et.dao.CategoryDAO"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Categories</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
	rel="stylesheet">

</head>
<body>
	<!-- Include Expense Form -->
	<div class="container mt-4">
		<div class="row justify-content-center">
			<div class="col-xl-6 col-lg-8 col-md-10 col-12">
				<%
				Expenses e = new Expenses();
				%>
				<div class="card shadow-sm p-4">

					<h4 class="mb-4 text-center text-primary fw-bold">Add Expense</h4>

					<form action="ExpenseController" method="post">

						<!-- Category -->
						<div class="mb-3">
							<input type="hidden" name="action" value="add"> <input
								type="hidden" name="categoryId" value="<%=e.getExpenseId()%>">

							<label for="category" class="form-label">Category</label> <select
								class="form-select" id="category" name="category" required>
								<option value="">Select Category</option>
								<%
								int userId = ((User) session.getAttribute("user")).getUserId();
								CategoryDAO cats = new CategoryDAO();
								List<Category> list = cats.selectUserCategories(userId);

								if (list != null) {
									for (Category cat : list) {
								%>
								<option value="<%=cat.getCategoryId()%>"><%=cat.getCategoryName()%></option>
								<%
								}
								}
								%>
							</select>
						</div>

						<!-- Amount -->
						<div class="mb-3">
							<label for="amount" class="form-label">Amount (&#8377;)</label> <input
								type="number" class="form-control" id="amount" name="amount"
								min="0" step="0.01" placeholder="Enter amount" required>
						</div>

						<!-- Description -->
						<div class="mb-4">
							<label for="description" class="form-label">Description</label>
							<textarea class="form-control" id="description"
								name="description" rows="3" placeholder="Enter expense details"
								required></textarea>
						</div>

						<!-- Submit -->
						<div class="d-grid">
							<button type="submit" class="btn btn-primary">Add
								Expense</button>
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