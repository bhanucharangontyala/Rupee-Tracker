<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="et.model.User,java.util.List,et.model.Expenses,et.model.Category,et.dao.ExpenseDAO"%>

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

<link href="./styles/history.css" rel="stylesheet">

</head>
<body>

	<div class="container-fluid mt-4">

		<div class="row justify-content-center">

			<div class="col-12 col-md-11 col-lg-9 col-xl-8">

				<div class="card shadow-sm p-4">

					<h5 class="mb-3 text-center text-md-start">
						<i class="bi bi-tags me-2"></i>Your Expenses
					</h5>

					<div class="table-responsive">

						<%
						int userId = ((User) session.getAttribute("user")).getUserId();

						ExpenseDAO expDAO = new ExpenseDAO();

						List<Expenses> list = expDAO.selectUserExpenses(userId);
						%>
						<table class="table table-bordered table-hover align-middle">

							<thead class="table-primary text-center">

								<tr>
									<th>Category</th>
									<th>Amount</th>
									<th>Expense_Date</th>
									<th>Description</th>
									<th style="width: 120px;">Action</th>
								</tr>

							</thead>

							<tbody>

								<%
								if (list != null) {
									for (Expenses ex : list) {
								%>

								<tr>

									<td class="fw-semibold"><i class="bi bi-folder me-1"></i>
										<%=ex.getCatName()%></td>
									<td class="text-success"><%=ex.getAmount()%></td>
									<td class="text-success"><%=ex.getExpenseDate()%></td>
									<td class="text-success"><%=ex.getDescription()%></td>
									<td class="text-success side">

										<button class="btn btn-sm btn-primary" data-bs-toggle="modal"
											data-bs-target="#editModal<%=ex.getExpenseId()%>">
											<i class="bi bi-pencil"></i>
										</button>

										<form action="ExpenseController" method="post"
											style="display: inline;">

											<input type="hidden" name="action" value="delete"> <input
												type="hidden" name="categoryId"
												value="<%=ex.getExpenseId()%>">

											<button type="button" class="btn btn-sm btn-danger"
												data-bs-toggle="modal"
												data-bs-target="#deleteModal<%=ex.getExpenseId()%>">
												<i class="bi bi-trash"></i>
											</button>

										</form>

									</td>

								</tr>
								<%
								}
								}
								%>

							</tbody>

						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- update/edit Expense modal -->
	<%
	if (list != null) {
		for (Expenses ex : list) {
	%>

	<div class="modal fade" id="editModal<%=ex.getExpenseId()%>"
		tabindex="-1">

		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">

					<h5 class="modal-title">Edit Expense</h5>

					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>

				</div>

				<form action="ExpenseController" method="post">

					<div class="modal-body">

						<input type="hidden" name="action" value="update"> <input
							type="hidden" name="expenseId" value="<%=ex.getExpenseId()%>">

						<div class="mb-3">

							<label>Category Name</label> <input type="text"
								class="form-control" name="categoryName"
								value="<%=ex.getCatName()%>" readonly>

						</div>

						<div class="mb-3">

							<label>Amount</label> <input type="number" class="form-control"
								name="amount" value="<%=ex.getAmount()%>">

						</div>

						<div class="mb-3">

							<label>Expense Date</label> <input type="date"
								class="form-control" name="expenseDate"
								value="<%=ex.getExpenseDate()%>">

						</div>

						<div class="mb-3">

							<label>Description</label> <input type="text"
								class="form-control" name="description"
								value="<%=ex.getDescription()%>">

						</div>

					</div>

					<div class="modal-footer">

						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancel</button>

						<button type="submit" class="btn btn-primary">Update</button>

					</div>

				</form>

			</div>

		</div>

	</div>

	<%
	}
	}
	%>

	<!-- delete Expense Modal -->
	<%
	if (list != null) {
		for (Expenses ex : list) {
	%>

	<div class="modal fade" id="deleteModal<%=ex.getExpenseId()%>"
		tabindex="-1">

		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">

					<h5 class="modal-title text-danger">
						<i class="bi bi-exclamation-triangle me-2"></i> Delete Expense
					</h5>

					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>

				</div>

				<div class="modal-body text-center">

					<p>
						Are you sure you want to delete <strong><%=ex.getCatName()%></strong>
						?
					</p>

					<p class="text-danger small">This action cannot be undone.</p>

				</div>

				<div class="modal-footer">

					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>

					<form action="ExpenseController" method="post">

						<input type="hidden" name="action" value="delete"> <input
							type="hidden" name="expenseId" value="<%=ex.getExpenseId()%>">

						<button type="submit" class="btn btn-danger">Delete</button>

					</form>

				</div>

			</div>

		</div>

	</div>

	<%
	}
	}
	%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>