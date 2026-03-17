package et.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import et.dao.ExpenseDAO;
import et.dao.ExpenseDAOInterface;
import et.model.Expenses;
import et.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ExpenseService;

@WebServlet("/ExpenseController")
public class ExpenseController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExpenseController() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		int userId = user.getUserId();
		String action = request.getParameter("action");
		// income validation
		Double income = (Double) request.getSession().getAttribute("income");
		Double totalExpenses = (Double) request.getSession().getAttribute("totalEx");
		if (income == null || totalExpenses == null) {
			request.getSession().setAttribute("message", "Error: Missing income or expense data.");
			response.sendRedirect("Dashboard?page=expenses");
			return;
		}
		ExpenseService exser = new ExpenseService();
		ExpenseDAOInterface exDAO = new ExpenseDAO();
		exDAO.expensesSum(user);
		if (("add").equals(action)) {
			int categoryid = Integer.parseInt(request.getParameter("category"));
			double amount = Double.parseDouble(request.getParameter("amount"));
			String description = request.getParameter("description");
			LocalDate today = LocalDate.now();
			java.sql.Date currDate = java.sql.Date.valueOf(today);
			// Check if adding this expense exceeds income
			if (totalExpenses + amount > income) {
				request.getSession().setAttribute("message", "Adding this expense would exceed your income!");
				response.sendRedirect("Dashboard?page=expenses");
				return;
			}
			// setting the expense data to model
			Expenses ex = new Expenses();
			ex.setUserId(userId);
			ex.setExpenseDate(currDate);
			ex.setCategoryId(categoryid);
			ex.setAmount(amount);
			ex.setDescription(description);
			// calling the service
			String status = exser.addExpense(ex);
			if (("success").equals(status)) {
				double tEx = exDAO.expensesSum(user);
				request.getSession().setAttribute("totalEx", tEx);
				request.getSession().setAttribute("message", "Expense added successfully!");
			} else {
				request.getSession().setAttribute("message", "Failed to add expense!");
			}
			response.sendRedirect("Dashboard?page=expenses");
		} else if (("update").equals(action)) {
			int expenseId = Integer.parseInt(request.getParameter("expenseId"));
			double amount = Double.parseDouble(request.getParameter("amount"));
			String dateStr = request.getParameter("expenseDate");
			Date expDate = Date.valueOf(dateStr);
			String description = request.getParameter("description");
			
			// getting the old expense id data
			Expenses oldExp = exDAO.getExpenseById(expenseId);
			double oldAmount = oldExp.getAmount();
			
			 // Check if updating causes exceeding income
	        double diff = amount - oldAmount;
	        if (totalExpenses + diff > income) {
	            request.getSession().setAttribute("message", "Updating this expense would exceed your income!");
	            response.sendRedirect("Dashboard?page=history");
	            return;
	        }
	        
			//setting data to model
			Expenses ex = new Expenses();
			ex.setExpenseId(expenseId);
			ex.setAmount(amount);
			ex.setExpenseDate(expDate);
			ex.setDescription(description);
			if (exser.updateExpense(ex)) {
				double tEx = exDAO.expensesSum(user);
				request.getSession().setAttribute("totalEx", tEx);
				request.getSession().setAttribute("message", "Expense updated successfully!");
			} else {
				request.getSession().setAttribute("message", "Failed to update expense!");
			}
			response.sendRedirect("Dashboard?page=history");
		} else if (("delete").equals(action)) {
			int expId = Integer.parseInt(request.getParameter("expenseId"));
			if (exser.deleteExpense(expId)) {
				double tEx = exDAO.expensesSum(user);
				request.getSession().setAttribute("totalEx", tEx);
				request.getSession().setAttribute("message", "Expense deleted successfully!");
			} else {
				request.getSession().setAttribute("message", "Failed to delete expense!");
			}
			response.sendRedirect("Dashboard?page=history");
		}
	}

}
