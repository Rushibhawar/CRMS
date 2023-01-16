package entity;

public class Student {
	private int studentId;
	private String studentEmail;
	private String studentPassword;
	private String studentName;
	private String studentCourse;
	private String studentCollege;
	private String studentPhone;
	private String studentAddress;
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Student(int studentId, String studentEmail, String studentPassword,
			String studentName, String studentCourse, String studentCollege,
			String studentPhone, String studentAddress) {
		super();
		this.studentId = studentId;
		this.studentEmail = studentEmail;
		this.studentPassword = studentPassword;
		this.studentName = studentName;
		this.studentCourse = studentCourse;
		this.studentCollege = studentCollege;
		this.studentPhone = studentPhone;
		this.studentAddress = studentAddress;
	}

	public Student(String studentEmail, String studentPassword,
			String studentName) {
		super();
		this.studentEmail = studentEmail;
		this.studentPassword = studentPassword;
		this.studentName = studentName;
	}

	public Student(String studentEmail, String studentPassword,
			String studentName, String studentCourse, String studentCollege,
			String studentPhone, String studentAddress) {
		super();
		this.studentEmail = studentEmail;
		this.studentPassword = studentPassword;
		this.studentName = studentName;
		this.studentCourse = studentCourse;
		this.studentCollege = studentCollege;
		this.studentPhone = studentPhone;
		this.studentAddress = studentAddress;
	}
	
	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getStudentEmail() {
		return studentEmail;
	}
	public void setStudentEmail(String studentEmail) {
		this.studentEmail = studentEmail;
	}
	public String getStudentPassword() {
		return studentPassword;
	}
	public void setStudentPassword(String studentPassword) {
		this.studentPassword = studentPassword;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getStudentCourse() {
		return studentCourse;
	}
	public void setStudentCourse(String studentCourse) {
		this.studentCourse = studentCourse;
	}
	public String getStudentCollege() {
		return studentCollege;
	}
	public void setStudentCollege(String studentCollege) {
		this.studentCollege = studentCollege;
	}
	public String getStudentPhone() {
		return studentPhone;
	}
	public void setStudentPhone(String studentPhone) {
		this.studentPhone = studentPhone;
	}
	public String getStudentAddress() {
		return studentAddress;
	}
	public void setStudentAddress(String studentAddress) {
		this.studentAddress = studentAddress;
	}
	@Override
	public String toString() {
		return "Student [studentEmail=" + studentEmail + ", studentPassword="
				+ studentPassword + ", studentName=" + studentName
				+ ", studentCourse=" + studentCourse + ", studentCollege="
				+ studentCollege + ", studentPhone=" + studentPhone
				+ ", studentAddress=" + studentAddress + "]";
	}

	
	
}
