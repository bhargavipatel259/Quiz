package Bean;

public class ChangePasswordBean {
	
	private String new_password;
	private String confirm_new_password;
		

	public String getpassword() {
	return new_password;
	}
	public void setpassword(String new_password) {
	this.new_password = new_password;
	}
	public String getcnfpswd() {
	return confirm_new_password;
	}
	public void setcnfpswd(String confirm_new_password) {
	this.confirm_new_password = confirm_new_password;
	}


}
