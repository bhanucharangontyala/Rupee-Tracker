<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="et.model.User,java.util.List,et.model.Category,et.dao.CategoryDAO"%>

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

<link href="./styles/categories.css" rel="stylesheet">

</head>
<body>

	<div class="container-fluid mt-4">

		<div class="row justify-content-center">

			<div class="col-12 col-md-11 col-lg-9 col-xl-8">

				<div class="card shadow-sm p-4">

					<h5 class="mb-3 text-center text-md-start">
						<i class="bi bi-tags me-2"></i>Your Categories
					</h5>

					<!-- Responsive Table -->
					<div class="table-responsive">

						<%
						int userId = ((User) session.getAttribute("user")).getUserId();

						CategoryDAO cats = new CategoryDAO();

						List<Category> list = cats.selectUserCategories(userId);
						%>
						<table class="table table-bordered table-hover align-middle">

							<thead class="table-primary text-center">

								<tr>
									<th>Category</th>
									<th>Monthly Limit</th>
									<th style="width: 120px;">Action</th>
								</tr>

							</thead>

							<tbody>

								<%
								if (list != null) {
									for (Category cat : list) {
								%>

								<tr>

									<td class="fw-semibold"><i class="bi bi-folder me-1"></i>
										<%=cat.getCategoryName()%></td>

									<td class="text-success"><%=cat.getMonthlyLimit() != 0 ? "₹ " + cat.getMonthlyLimit() : "<span class='text-muted'>No Limit</span>"%></td>

									<td class="text-center side">

										<button class="btn btn-sm btn-primary" data-bs-toggle="modal"
											data-bs-target="#editModal<%=cat.getCategoryId()%>">
											<i class="bi bi-pencil"></i>
										</button>

										<form action="CategoryController" method="post" style="display: inline;">

											<input type="hidden" name="action" value="delete"> <input
												type="hidden" name="categoryId"
												value="<%=cat.getCategoryId()%>">

											<button type="button" class="btn btn-sm btn-danger" data-bs-toggle="modal"
											data-bs-target="#deleteModal<%=cat.getCategoryId()%>">
												<i class="bi bi-trash"></i>
											</button>

										</form>

									</td>

								</tr>
								<%
								}
								}
								%>
								<tr>
									<td colspan="3" class="text-center">

										<button class="btn btn-primary" data-bs-toggle="modal"
											data-bs-target="#addCategoryModal">

											<i class="bi bi-plus-circle me-1"></i> Add Category

										</button>

									</td>
								</tr>
							</tbody>

						</table>
						<!-- update/edit Category modal -->
						<%
						if (list != null) {
							for (Category cat : list) {
						%>

						<div class="modal fade" id="editModal<%=cat.getCategoryId()%>"
							tabindex="-1">

							<div class="modal-dialog">

								<div class="modal-content">

									<div class="modal-header">

										<h5 class="modal-title">Edit Category</h5>

										<button type="button" class="btn-close"
											data-bs-dismiss="modal"></button>

									</div>

									<form action="CategoryController" method="post">

										<div class="modal-body">

											<input type="hidden" name="action" value="update"> <input
												type="hidden" name="categoryId"
												value="<%=cat.getCategoryId()%>">

											<div class="mb-3">

												<label>Category Name</label> <input type="text"
													class="form-control" name="categoryName"
													value="<%=cat.getCategoryName()%>" required>

											</div>

											<div class="mb-3">

												<label>Monthly Limit</label> <input type="number"
													class="form-control" name="monthlyLimit"
													value="<%=cat.getMonthlyLimit()%>">

											</div>

										</div>

										<div class="modal-footer">

											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Cancel</button>

											<button type="submit" class="btn btn-primary">
												Update</button>

										</div>

									</form>

								</div>

							</div>

						</div>

						<%
						}
						}
						%>
					</div>

				</div>

			</div>

		</div>

	</div>
	<!-- delete Category Modal -->
	<%
	if (list != null) {
		for (Category cat : list) {
	%>

	<div class="modal fade" id="deleteModal<%=cat.getCategoryId()%>"
		tabindex="-1">

		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">

					<h5 class="modal-title text-danger">
						<i class="bi bi-exclamation-triangle me-2"></i> Delete Category
					</h5>

					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>

				</div>

				<div class="modal-body text-center">

					<p>
						Are you sure you want to delete <strong><%=cat.getCategoryName()%></strong>
						?
					</p>

					<p class="text-danger small">This action cannot be undone.</p>

				</div>

				<div class="modal-footer">

					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>

					<form action="CategoryController" method="post">

						<input type="hidden" name="action" value="delete"> <input
							type="hidden" name="categoryId" value="<%=cat.getCategoryId()%>">

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
	<!-- add category modal -->
	<div class="modal fade" id="addCategoryModal" tabindex="-1">

		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">

					<h5 class="modal-title">
						<i class="bi bi-plus-circle me-2"></i>Add Category
					</h5>

					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>

				</div>

				<form action="CategoryController" method="post">

					<div class="modal-body">

						<input type="hidden" name="action" value="add">

						<div class="mb-3">

							<label class="form-label">Category Name</label> <input
								type="text" class="form-control" name="categoryName"
								placeholder="Enter category name" required>

						</div>

						<div class="mb-3">

							<label class="form-label">Monthly Limit (Optional)</label> <input
								type="number" class="form-control" name="monthlyLimit"
								step="0.01" placeholder="Enter limit">

						</div>

					</div>

					<div class="modal-footer">

						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancel</button>

						<button type="submit" class="btn btn-primary">Add
							Category</button>

					</div>

				</form>

			</div>

		</div>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>