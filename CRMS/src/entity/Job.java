package entity;

public class Job {
	
	private String jobTitle;
	private String jobCompany;
	private String jobDescription;
	private String coordinatorId;
	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Job(String jobTitle, String jobCompany, String jobDescription,
			String coordinatorId) {
		super();
		this.jobTitle = jobTitle;
		this.jobCompany = jobCompany;
		this.jobDescription = jobDescription;
		this.coordinatorId = coordinatorId;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getJobCompany() {
		return jobCompany;
	}
	public void setJobCompany(String jobCompany) {
		this.jobCompany = jobCompany;
	}
	public String getJobDescription() {
		return jobDescription;
	}
	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}
	public String getCoordinatorId() {
		return coordinatorId;
	}
	public void setCoordinatorId(String coordinatorId) {
		this.coordinatorId = coordinatorId;
	}
	@Override
	public String toString() {
		return "Job [jobTitle=" + jobTitle + ", jobCompany=" + jobCompany
				+ ", jobDescription=" + jobDescription + ", coordinatorId="
				+ coordinatorId + "]";
	}
	
	
}
