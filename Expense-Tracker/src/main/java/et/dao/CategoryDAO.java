package et.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import et.model.Category;
import et.utility.ET_DBConnection;

public class CategoryDAO implements CategoryDAOInterface {
	public void insertDefaultCategories(int userId) {
		String[] defaults = { "Food", "Transport", "Shopping", "Bills", "Entertainment" };
		try (Connection con = ET_DBConnection.getConnection()) {
			String sql = "INSERT INTO categories (user_id, category_name) VALUES (?, ?)";
			PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			for (String name : defaults) {
				ps.setInt(1, userId);
				ps.setString(2, name);
				int n = ps.executeUpdate();
				if (n > 0) {
					ResultSet rs = ps.getGeneratedKeys();
					if (rs.next()) {
						Category cat = new Category();
						cat.setCategoryId(rs.getInt(1));
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Category> selectUserCategories(int userId) {
		List<Category> categories = new ArrayList<>();
		Connection con = null;
		try {
			con = ET_DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("select * from categories where user_id = ? and is_active = 1;");
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Category c = new Category();
				c.setCategoryId(rs.getInt(1));
				c.setUserId(rs.getInt(2));
				c.setCategoryName(rs.getString(3));
				c.setMonthlyLimit(rs.getDouble(4));
				c.setActive(rs.getInt(5));
				c.setCurrDate(rs.getDate(6));
				categories.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categories;
	}

	@Override
	public boolean insertCategory(Category c) {
		boolean status = false;
		try (Connection con = ET_DBConnection.getConnection()) {
			String sql = "INSERT INTO categories (user_id, category_name,monthly_limit) VALUES (?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, c.getUserId());
			ps.setString(2, c.getCategoryName());
			if (c.getMonthlyLimit() == null) {
				ps.setNull(3, java.sql.Types.DECIMAL);
			} else {
				ps.setDouble(3, c.getMonthlyLimit());
			}
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
	public boolean updateCategory(Category c) {
		boolean status = false;
		try (Connection con = ET_DBConnection.getConnection()) {
			String sql = "update categories set category_name = ?, monthly_limit=? where category_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, c.getCategoryName());
			if (c.getMonthlyLimit() == null) {
				ps.setNull(2, java.sql.Types.DECIMAL);
			} else {
				ps.setDouble(2, c.getMonthlyLimit());
			}
			ps.setInt(3, c.getCategoryId());
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
	public boolean deleteCategory(int catId) {
		boolean status = false;
		try (Connection con = ET_DBConnection.getConnection()) {
			String sql = "update categories set is_active = ? where category_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setInt(2, catId);
			int n = ps.executeUpdate();
			if (n > 0) {
				status = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
