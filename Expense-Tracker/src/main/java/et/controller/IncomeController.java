package et.controller;

import java.io.IOException;

import et.dao.IncomeDAO;
import et.dao.IncomeDAOInterface;
import et.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/IncomeController")
public class IncomeController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		// ✅ Check login
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
			return;
		}
		try {
			// Logged user
			User user = (User) session.getAttribute("user");
			int userId = user.getUserId();
			// Get income from form
			double monthlyIncome = Double.parseDouble(request.getParameter("monthlyIncome"));
			// DAO call
			IncomeDAOInterface dao = new IncomeDAO();
			String status = dao.addIncome(userId, monthlyIncome);
			if ("success".equals(status)) {
				session.setAttribute("income", monthlyIncome);
				response.sendRedirect("userdashboard.jsp");
			} else {
				request.setAttribute("message", "Failed to save income");
				request.getRequestDispatcher("addincome.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
