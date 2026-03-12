package et.dao;

import et.model.User;

public interface UsersDAOInterface {
	public String userRegistration(User u);
	public String userLogin(User u);
	
}
