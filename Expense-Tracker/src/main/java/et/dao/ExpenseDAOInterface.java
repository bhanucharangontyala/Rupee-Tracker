package et.dao;

import java.util.List;

import et.model.Expenses;
import et.model.User;

public interface ExpenseDAOInterface {
	public String insertExpense(Expenses e);
	
	public boolean updateExpense(Expenses e);
	
	public boolean deleteExpense(int expenseId);
	
	public double expensesSum(User u);

	public List<Expenses> selectUserExpenses(int userId);
}
