package entity;

public class ApplyJobFormApplication {

	private String applied_job_title;
	private String applied_job_company;
	private String applied_job_student_name;
	private String applied_job_student_email;
	private String applied_job_student_phone;
	private String applied_job_student_about;
	private int jobId;
	public ApplyJobFormApplication() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ApplyJobFormApplication(String applied_job_title, String applied_job_company,
			String applied_job_student_name, String applied_job_student_email,
			String applied_job_student_phone, String applied_job_student_about,
			int jobId) {
		super();
		this.applied_job_title = applied_job_title;
		this.applied_job_company = applied_job_company;
		this.applied_job_student_name = applied_job_student_name;
		this.applied_job_student_email = applied_job_student_email;
		this.applied_job_student_phone = applied_job_student_phone;
		this.applied_job_student_about = applied_job_student_about;
		this.jobId = jobId;
	}
	public String getApplied_job_title() {
		return applied_job_title;
	}
	public void setApplied_job_title(String applied_job_title) {
		this.applied_job_title = applied_job_title;
	}
	public String getApplied_job_company() {
		return applied_job_company;
	}
	public void setApplied_job_company(String applied_job_company) {
		this.applied_job_company = applied_job_company;
	}
	public String getApplied_job_student_name() {
		return applied_job_student_name;
	}
	public void setApplied_job_student_name(String applied_job_student_name) {
		this.applied_job_student_name = applied_job_student_name;
	}
	public String getApplied_job_student_email() {
		return applied_job_student_email;
	}
	public void setApplied_job_student_email(String applied_job_student_email) {
		this.applied_job_student_email = applied_job_student_email;
	}
	public String getApplied_job_student_phone() {
		return applied_job_student_phone;
	}
	public void setApplied_job_student_phone(String applied_job_student_phone) {
		this.applied_job_student_phone = applied_job_student_phone;
	}
	public String getApplied_job_student_about() {
		return applied_job_student_about;
	}
	public void setApplied_job_student_about(String applied_job_student_about) {
		this.applied_job_student_about = applied_job_student_about;
	}
	public int getJobId() {
		return jobId;
	}
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	@Override
	public String toString() {
		return "ApplyJobForm [applied_job_title=" + applied_job_title
				+ ", applied_job_company=" + applied_job_company
				+ ", applied_job_student_name=" + applied_job_student_name
				+ ", applied_job_student_email=" + applied_job_student_email
				+ ", applied_job_student_phone=" + applied_job_student_phone
				+ ", applied_job_student_about=" + applied_job_student_about
				+ ", jobId=" + jobId + "]";
	}
	
	
	
}
