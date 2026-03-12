package service;

import et.dao.ExpenseDAO;
import et.model.Expenses;

public class ExpenseService {
	String status = "fail";
	public String addExpense(Expenses e) {
		ExpenseDAO dao = new ExpenseDAO();
		String res = dao.insertExpense(e);
		if(res.equals("success")) {
			status = res;
		}
		return status;
	}
	
	public boolean updateExpense(Expenses e) {
		ExpenseDAO dao = new ExpenseDAO();
		if(dao.updateExpense(e)) {
			return true;
		}
		return false;
	}
	
	public boolean deleteExpense(int expId) {
		ExpenseDAO dao = new ExpenseDAO();
		if(dao.deleteExpense(expId)) {
			return true;
		}
		return false;
	}
}
