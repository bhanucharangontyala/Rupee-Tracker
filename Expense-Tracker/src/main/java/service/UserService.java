package service;

import et.dao.UsersDAO;
import et.model.User;

public class UserService {

	public String registerUser(User user) {
		UsersDAO dao = new UsersDAO();
		return dao.userRegistration(user);
	}

	public String loginUser(User user) {
		UsersDAO dao = new UsersDAO();
		
		return dao.userLogin(user);
	}
}