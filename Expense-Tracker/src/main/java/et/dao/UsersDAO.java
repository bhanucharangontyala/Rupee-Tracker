package et.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import et.model.User;
import et.utility.ET_DBConnection;

public class UsersDAO implements UsersDAOInterface {
	Connection con = null;

	@Override
	public String userRegistration(User u) {
		String status = "fail";
		int genUserId = 0;
		try {
			con = ET_DBConnection.getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into users(username,fullname,email,upassword) values(?,?,?,?);",Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, u.getUserName());
			ps.setString(2, u.getFullName());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			int n = ps.executeUpdate();
			if (n > 0) {
				status = "success";
				ResultSet rs = ps.getGeneratedKeys();
				if (rs.next()) {
					genUserId = rs.getInt(1);
					u.setUserId(genUserId);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	@Override
	public String userLogin(User u) {
		String status = "fail";
		try {
			con = ET_DBConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("Select * from users where email = ? and upassword = ?;");
			ps.setString(1, u.getEmail());
			ps.setString(2, u.getPassword());
			ResultSet rs = ps.executeQuery();
			int c = 0;
			while (rs.next()) {
				u.setUserId(rs.getInt(1));
				u.setUserName(rs.getString(2));
				u.setFullName(rs.getString(3));
				u.setEmail(rs.getString(4));
				c++;
			}
			if (c > 0) {
				status = "success";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

}
