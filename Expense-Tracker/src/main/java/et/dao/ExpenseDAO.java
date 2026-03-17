package et.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import et.model.Expenses;
import et.model.User;
import et.utility.ET_DBConnection;

public class ExpenseDAO implements ExpenseDAOInterface {
	Connection con = null;

	@Override
	public String insertExpense(Expenses e) {
		String status = "fail";
		try {
			con = ET_DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("insert into expenses"
					+ "(user_id,category_id,amount,expense_date,description) " + "values (?,?,?,?,?);");
			ps.setInt(1, e.getUserId());
			ps.setInt(2, e.getCategoryId());
			ps.setDouble(3, e.getAmount());
			ps.setDate(4, e.getExpenseDate());
			ps.setString(5, e.getDescription());
			int n = ps.executeUpdate();
			if (n > 0) {
				status = "success";
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	@Override
	public List<Expenses> selectUserExpenses(int userId) {
		List<Expenses> expenses = new ArrayList<>();
		Connection con = null;
		try {
			con = ET_DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT e.expense_id,\r\n" + "		       e.amount,\r\n"
					+ "		       e.expense_date,\r\n" + "		       e.description,\r\n"
					+ "		       c.category_name,e.is_active\r\n" + "		FROM expenses e\r\n"
					+ "		JOIN categories c\r\n" + "		ON e.category_id = c.category_id\r\n"
					+ "		WHERE e.user_id = ? and e.is_active = 1\r\n" + "		ORDER BY e.expense_date DESC;");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Expenses e = new Expenses();
				e.setExpenseId(rs.getInt(1));
				e.setAmount(rs.getDouble(2));
				e.setExpenseDate(rs.getDate(3));
				e.setDescription(rs.getString(4));
				e.setCatName(rs.getString(5));
				e.setIs_active(rs.getInt(6));
				expenses.add(e);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return expenses;
	}

	@Override
	public boolean updateExpense(Expenses e) {
		boolean status = false;
		try {
			con = ET_DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("update expenses set amount=?,expense_date=?,description=? where expense_id =?");
			ps.setDouble(1, e.getAmount());
			ps.setDate(2, e.getExpenseDate());
			ps.setString(3, e.getDescription());
			ps.setInt(4, e.getExpenseId());
			int n = ps.executeUpdate();
			if (n > 0) {
				status = true;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return status;
	}

	@Override
	public boolean deleteExpense(int expenseId) {
		boolean status = false;
		try (Connection con = ET_DBConnection.getConnection()) {
			String sql = "update expenses set is_active = ? where expense_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setInt(2, expenseId);
			int n = ps.executeUpdate();
			if (n > 0) {
				status = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public double expensesSum(User u) {
		double totalEx = 0;
		try (Connection con = ET_DBConnection.getConnection()) {
			String sql = "select sum(amount) from expenses where user_id = ? and is_active =1;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, u.getUserId());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				totalEx = rs.getDouble(1);
				u.setTotalExpenses(rs.getDouble(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totalEx;
	}

	@Override
	public Expenses getExpenseById(int expenseId) {
		Expenses exp = null;
		try (Connection con = ET_DBConnection.getConnection()) {
			String sql = "select * from expenses where expense_id = ?;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, expenseId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				exp = new Expenses();
				exp.setExpenseId(rs.getInt("expense_id"));
				exp.setUserId(rs.getInt("user_id"));
				exp.setCategoryId(rs.getInt("category_id"));
				exp.setAmount(rs.getDouble("amount"));
				exp.setExpenseDate(rs.getDate("expense_date"));
				exp.setDescription(rs.getString("description"));
				exp.setIs_active(rs.getInt("is_active"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return exp;
	}

}
