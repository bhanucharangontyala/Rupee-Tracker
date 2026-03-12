package et.controller;

import java.io.IOException;

import et.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.CategoryService;
import service.UserService;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterController() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// fetching the data from front-end
		String username = request.getParameter("username");
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		// setting the data to model class
		User u = new User();
		u.setUserName(username);
		u.setFullName(fullname);
		u.setEmail(email);
		u.setPassword(password);
		// call the service
		UserService us = new UserService();
		String res = us.registerUser(u);
		// setting the default categories for every user
		CategoryService cs = new CategoryService();
		cs.insertDefaultCategories(u.getUserId());
		if (res.equals("success")) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}

	}

}
