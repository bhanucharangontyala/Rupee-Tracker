package et.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import et.model.User;
import et.model.User_income;
import et.utility.ET_DBConnection;

public class IncomeDAO implements IncomeDAOInterface {

	Connection con = null;

	@Override
	public String addIncome(int userid, double income) {
		String status = "fail";
		try {
			con = ET_DBConnection.getConnection();
			// Check income already exists
			PreparedStatement check = con.prepareStatement("select * from user_income where user_id=?");
			check.setInt(1, userid);
			ResultSet rs = check.executeQuery();
			if (rs.next()) {
				// UPDATE income
				PreparedStatement update = con.prepareStatement("update user_income set m_income=? where user_id=?");
				update.setDouble(1, income);
				update.setInt(2, userid);
				update.executeUpdate();
			} else {
				// INSERT income
				PreparedStatement insert = con
						.prepareStatement("insert into user_income(user_id,m_income) values(?,?)");
				insert.setInt(1, userid);
				insert.setDouble(2, income);
				insert.executeUpdate();
			}
			status = "success";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public boolean updateIncome(User_income user) {
		boolean status = false;
		try {
			con = ET_DBConnection.getConnection();
			PreparedStatement update = con.prepareStatement("update user_income set m_income = ? where user_id=?");
			update.setDouble(1, user.getMon_income());
			update.setInt(2, user.getUser_id());
			int n = update.executeUpdate();
			if (n > 0) {
				status = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public boolean deleteIncome(User_income user) {
		boolean status = false;
		try {
			con = ET_DBConnection.getConnection();
			PreparedStatement update = con.prepareStatement("update user_income set m_income = ? where user_id=?");
			update.setDouble(1, 0);
			update.setInt(2, user.getUser_id());
			int n = update.executeUpdate();
			if (n > 0) {
				status = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public User_income isIncomeSet(User u) {
		User_income ui = null;
		try {
			con = ET_DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from user_income where user_id=?");
			ps.setInt(1, u.getUserId());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ui = new User_income();
				ui.setIncome_id(rs.getInt(1));
				ui.setUser_id(rs.getInt(2));
				ui.setMon_income(rs.getDouble(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ui;
	}

}
