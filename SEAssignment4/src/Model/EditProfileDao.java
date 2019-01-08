package Model;

import java.sql.DriverManager;

import Bean.EditProfileBean;

public class EditProfileDao {
	
	public String storevalues(EditProfileBean s) {
		String firstname = s.getFirstname();
		String lastname = s.getFirstname();
		java.sql.Connection con = null;
		java.sql.PreparedStatement statement = null;
		java.sql.ResultSet resultSet = null;
					
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/icsi518_hw4", "icsi518", "secretICSI518");
			statement = con.prepareStatement("UPDATE userprofile SET firstName=?, lastName=? where userName=?");
			statement.setString(1, firstname);
			statement.setString(2, lastname);
			statement.executeUpdate();
			return "SUCCESS";
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	return "Cannot edit profile";
	}

}
