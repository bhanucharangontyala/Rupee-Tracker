package et.dao;

import et.model.User;
import et.model.User_income;

public interface IncomeDAOInterface {
	public User_income isIncomeSet(User u);
	public String addIncome(int user_id, double income);
	public boolean updateIncome(User_income user);
	public boolean deleteIncome(User_income user);
}
