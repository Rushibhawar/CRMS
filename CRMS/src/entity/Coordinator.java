package entity;

public class Coordinator {
	private int coordinatorId;
	private String coordinatorName;
	private String coordinatorEmail;
	private String coordinatorPassword;
	private String coordinatorAddress;
	private String coordinatorContact;
	public Coordinator() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Coordinator(String coordinatorName, String coordinatorEmail,
			String coordinatorPassword, String coordinatorAddress,
			String coordinatorContact) {
		super();
		this.coordinatorName = coordinatorName;
		this.coordinatorEmail = coordinatorEmail;
		this.coordinatorPassword = coordinatorPassword;
		this.coordinatorAddress = coordinatorAddress;
		this.coordinatorContact = coordinatorContact;
	}
	public Coordinator(int coordinatorId, String coordinatorName,
			String coordinatorEmail, String coordinatorPassword,
			String coordinatorAddress, String coordinatorContact) {
		super();
		this.coordinatorId = coordinatorId;
		this.coordinatorName = coordinatorName;
		this.coordinatorEmail = coordinatorEmail;
		this.coordinatorPassword = coordinatorPassword;
		this.coordinatorAddress = coordinatorAddress;
		this.coordinatorContact = coordinatorContact;
	}
	
	public int getCoordinatorId() {
		return coordinatorId;
	}
	public void setCoordinatorId(int coordinatorId) {
		this.coordinatorId = coordinatorId;
	}
	public Coordinator(String coordinatorEmail, String coordinatorPassword) {
		super();
		this.coordinatorEmail = coordinatorEmail;
		this.coordinatorPassword = coordinatorPassword;
	}
	public String getCoordinatorName() {
		return coordinatorName;
	}
	public void setCoordinatorName(String coordinatorName) {
		this.coordinatorName = coordinatorName;
	}
	public String getCoordinatorEmail() {
		return coordinatorEmail;
	}
	public void setCoordinatorEmail(String coordinatorEmail) {
		this.coordinatorEmail = coordinatorEmail;
	}
	public String getCoordinatorPassword() {
		return coordinatorPassword;
	}
	public void setCoordinatorPassword(String coordinatorPassword) {
		this.coordinatorPassword = coordinatorPassword;
	}
	public String getCoordinatorAddress() {
		return coordinatorAddress;
	}
	public void setCoordinatorAddress(String coordinatorAddress) {
		this.coordinatorAddress = coordinatorAddress;
	}
	public String getCoordinatorContact() {
		return coordinatorContact;
	}
	public void setCoordinatorContact(String coordinatorContact) {
		this.coordinatorContact = coordinatorContact;
	}
	@Override
	public String toString() {
		return "Coordinator [coordinatorName=" + coordinatorName
				+ ", coordinatorEmail=" + coordinatorEmail
				+ ", coordinatorPassword=" + coordinatorPassword
				+ ", coordinatorAddress=" + coordinatorAddress
				+ ", coordinatorContact=" + coordinatorContact + "]";
	}
	
	
	
}
