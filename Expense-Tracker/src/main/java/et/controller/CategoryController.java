package et.controller;

import java.io.IOException;

import et.model.Category;
import et.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CategoryService;

@WebServlet("/CategoryController")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CategoryController() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		int userId = user.getUserId();
		String action = request.getParameter("action");
		CategoryService cs = new CategoryService();
		if (("add").equals(action)) {
			String cName = request.getParameter("categoryName");
			String limitStr = request.getParameter("monthlyLimit");
			Double limit = null;
			if (limitStr != null && !limitStr.isEmpty()) {
				limit = Double.parseDouble(limitStr);
			}
			// setting for the model class
			Category c = new Category();
			c.setUserId(userId);
			c.setCategoryName(cName);
			c.setMonthlyLimit(limit);

			// calling the service

			if (cs.insertcat(c)) {
				request.getSession().setAttribute("message", "category added successfully!");
			} else {
				request.getSession().setAttribute("message", "Failed to add category!");
			}
			response.sendRedirect("Dashboard?page=categories");
		} else if (("update").equals(action)) {
			int categoryId = Integer.parseInt(request.getParameter("categoryId"));
			String cName = request.getParameter("categoryName");
			String limitStr = request.getParameter("monthlyLimit");
			Double limit = null;
			if (limitStr != null && !limitStr.isEmpty()) {
				limit = Double.parseDouble(limitStr);
			}
			Category c = new Category();
			c.setCategoryId(categoryId);
			c.setUserId(userId);
			c.setCategoryName(cName);
			c.setMonthlyLimit(limit);

			if (cs.updateCategory(c)) {
				request.getSession().setAttribute("message", "Category updated successfully!");
			} else {
				request.getSession().setAttribute("message", "Failed to update category!");
			}
			response.sendRedirect("Dashboard?page=categories");
		} else if (("delete").equals(action)) {
			int categoryId = Integer.parseInt(request.getParameter("categoryId"));
			if (cs.deleteCategory(categoryId)) {
				request.getSession().setAttribute("message", "Category deleted successfully");
			} else {
				request.getSession().setAttribute("message", "Failed to delete Category");
			}
			response.sendRedirect("Dashboard?page=categories");
		}
		
	}

}
