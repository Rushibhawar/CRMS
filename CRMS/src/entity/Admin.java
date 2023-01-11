package entity;

public class Admin {
	private String adminName;
	private String adminEmail;
	private String adminPassword;
	private String adminContact;
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(String adminName, String adminEmail, String adminPassword,
			String adminContact) {
		super();
		this.adminName = adminName;
		this.adminEmail = adminEmail;
		this.adminPassword = adminPassword;
		this.adminContact = adminContact;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public String getAdminContact() {
		return adminContact;
	}
	public void setAdminContact(String adminContact) {
		this.adminContact = adminContact;
	}
	@Override
	public String toString() {
		return "Admin [adminName=" + adminName + ", adminEmail=" + adminEmail
				+ ", adminPassword=" + adminPassword + ", adminContact="
				+ adminContact + "]";
	}
	
	
}
