package et.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Dashboard() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String page = request.getParameter("page");

		if (page == null) {
			page = "home";
		}

		request.setAttribute("page", page);
		request.getRequestDispatcher("userdashboard.jsp").forward(request, response);
	}

}
