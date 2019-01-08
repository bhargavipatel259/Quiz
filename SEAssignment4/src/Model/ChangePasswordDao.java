package Model;

import java.sql.DriverManager;

import Bean.ChangePasswordBean;

public class ChangePasswordDao {
	public String storevalues(ChangePasswordBean s) {
		String newpassword = s.getpassword();
		String cnfpswd = s.getcnfpswd();
		java.sql.Connection con = null;
		java.sql.PreparedStatement statement = null;
		java.sql.ResultSet resultSet = null;
					
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/icsi518_hw4", "icsi518", "secretICSI518");
			statement = con.prepareStatement("UPDATE User SET password=? where userName=?");
			statement.setString(1, newpassword);
			statement.executeUpdate();
			return "SUCCESS";
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	return "Cannot change Password";
	}

}
