package et.controller;

import java.io.IOException;

import et.dao.ExpenseDAO;
import et.dao.ExpenseDAOInterface;
import et.dao.IncomeDAO;
import et.dao.IncomeDAOInterface;
import et.model.User;
import et.model.User_income;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.UserService;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// fetching the data from front-end
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		// setting to model class
		User u = new User();
		u.setEmail(email);
		u.setPassword(password);
		// calling service
		UserService user = new UserService();
		String res = user.loginUser(u);
		if ("success".equals(res)) {
			HttpSession s = request.getSession();
			s.setAttribute("user", u);
			s.setAttribute("message", "Login Successful!");
			// checking the user have income in out database
			IncomeDAOInterface dao = new IncomeDAO();
			User_income ui = dao.isIncomeSet(u);
			if (ui!=null) {
				s.setAttribute("income", ui.getMon_income());
				ExpenseDAOInterface ex = new ExpenseDAO();
				s.setAttribute("totalEx", ex.expensesSum(u));
				response.sendRedirect("userdashboard.jsp");
			} else {
				response.sendRedirect("addincome.jsp");
			}
		} else {
			request.setAttribute("message", "Login failed enter valid credentials");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

}
