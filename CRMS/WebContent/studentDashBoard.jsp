<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,helper.*,dao.*,entity.*;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- Links -->
	<%@include file="allLinks.jsp" %>
	
	<!-- CSS -->
	<link rel="stylesheet" href="CSS/studentDashboardStyle.css">
	
</head>
<body>
		
		 
		 <!-- navbar -->
		<nav class="navbar navbar-expand-lg  navbar-dark bg-dark ml-3 mr-3" >
		   <a class="navbar-brand" href="index.jsp">
		  		<div class=" text-center text-info text-center ">
					<img class="crms-logo " alt="crms logo" src="images/CRMS-1 (1).png" id="crms-logo" style="max-width: 100px;" >
				</div>
		  </a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav ">
		      <li class="nav-item ">
		        <a class="nav-link " href="index.jsp">Home page<span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link " href="#appliedJobstable">Applied jobs</a>
		      </li>
			  <li class="nav-item">
		        <a class="nav-link " href="#jobopeningtable">Job openings</a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link " href="index.jsp"><button type="button" id="Logout" class="btn btn-danger btn-sm">Logout</button></a>
		      </li>
		    </ul>
		  </div>
		</nav>
		
		<!-- Establish connection -->
		<%
			Connection con = ConnectionProvider.getMysqlConnection();
		%>
		<%
		Student student = (Student)session.getAttribute("currentUser");
		int studentId = student.getStudentId();
		String studentName = student.getStudentName();
		String studentPhone = student.getStudentPhone();
		String studentEmail = student.getStudentEmail();
		String studentCourse =student.getStudentCourse();
		%>
		<div class="home p-5">
			<div class="home-content jumbotron " id="home">
				<div class="home-main-content p-4  text-center" >
					<header>
						<h1 class="text-dark" >Student Dashboard</h1>
					</header>
					<hr class="my-4">
					<div class="card-deck ">
					  <div class="card text-white text-center bg-primary">
					    <div class="card-body">
					      <h5 class="card-title">Applied Jobs</h5>
					      <%
						      	JobDao jobDao = new JobDao(con);
						  		int appliedJobCount = jobDao.getAllAppliedJobCountForStudentId(studentId);
					      %>
					      <p class="card-text "><%=appliedJobCount %></p>
					    </div>
					    <div class="card-footer">
					      <a href="#appliedJobstable"><button type="button" class="btn btn-dark">View</button></a>
					    </div>
					  </div>
			 		  <div class="card text-white text-center bg-primary">
					    <div class="card-body">
					      <h5 class="card-title">Job openings</h5>
					      <%
						  		int vacantJobCount = jobDao.getAllJobCount();
					      %>
					      <p class="card-text "><%=vacantJobCount %></p>
					    </div>
					    <div class="card-footer">
					      <a href="#jobopeningtable"><button type="button" class="btn btn-dark">View</button></a>
					    </div>
					  </div>
					</div>
					
					<!-- table jobs applied -->
					<div class="applied-jobs-table mt-5 mb-4 text-center bg-light"  id="appliedJobstable">
						<h2 class=" pt-5" >Applied jobs</h2>
						<hr class="my-4">
						<div class="table-responsive p-4">
						  <table class="table ">
						    <thead class="bg-info text-white">
						      <tr>
								<th scope="col">Job Application ID</th>
						        <th scope="col">Company</th>
						        <th scope="col">Position</th>
						        <th scope="col">Student Name</th>
						        <th scope="col">Student Email</th>
						        <th scope="col">Student Phone</th>
						        <th scope="col"> About Student</th>
						        <th scope="col">Withdraw Job Application</th>
						      </tr>
						    </thead>
						     <tbody>
						     <%
						    		ResultSet rs = jobDao.getAllAppliedJobDetailsForStudentId(studentId);
									while(rs.next())
									{
										int applied_job_id = rs.getInt("applied_job_id");
										int student_id = rs.getInt("student_id");
										String applied_job_title = rs.getString("applied_job_title");
										String applied_job_company = rs.getString("applied_job_company");
										String applied_job_student_name = rs.getString("applied_job_student_name");
										String applied_job_student_email = rs.getString("applied_job_student_email");
										String applied_job_student_phone = rs.getString("applied_job_student_phone");
										String applied_job_student_about = rs.getString("applied_job_student_about");
							  %>
						      <tr class="table-info"	>
						      	<td><%=applied_job_id %></td>
						        <td><%=applied_job_company %></td>
						        <td><%=applied_job_title %></td>
						        <td><%=applied_job_student_name %></td>
						        <td><%=applied_job_student_email %></td>
						        <td><%=applied_job_student_phone %></td>
						         <td><%=applied_job_student_about %></td>
						        <td>
						        	<%-- <a href="DeleteApplyJobFormServlet?applied_job_id=<%=applied_job_id %>&studentId=<%=student_id %>&studentName=<%=applied_job_student_name %>"><button type="button" class="btn btn-danger" onclick="confirmDelete()">Delete</button></a> --%>
									<button type="button" class="btn btn-danger" onclick="confirmAppliedJobWithdraw('<%=applied_job_id %>','<%=student_id %>','<%=applied_job_student_name %>')">Withdraw</button>
						        </td>
						      </tr>
						      <%
								}
						    %>
						    </tbody>
						  </table>
						</div>
					</div>
					<div class="vacant-jobs-table mt-4 mb-4 text-center bg-light" id="jobopeningtable">
						<h2 class=" pt-5" >Job  openings</h2>
						<hr class="my-4">
						<div class="table-responsive p-4">
						  <table class="table">
					 		<thead class="bg-info text-white">
						      <tr>
						        <th scope="col">Job ID</th>
						        <th scope="col">Company</th>
						        <th scope="col">Position</th>
						        <th scope="col">Job Description</th>
						        <th scope="col">Apply</th>
						      </tr>
						    </thead>
						    <tbody>
						     <%
						    		 rs = jobDao.getAllJobDetails();
									while(rs.next())
									{
										int jobId = rs.getInt("job_id");
										String coordinator_name = rs.getString("coordinator_name");
										String jobCompany = rs.getString("job_company");
										String jobTitle = rs.getString("job_title");
										String jobDescription = rs.getString("job_description");
										System.out.println(jobCompany+""+jobTitle);
							  %>
						      <tr class="table-info"	>
						      	<td><%=jobId %></td>
						        <td><%=jobCompany %></td>
						        <td><%=jobTitle %></td>
						        <td><%=jobDescription %></td>
						        <td>
						        	<a href="applyJobForm.jsp?jobId=<%=jobId %>&jobCompany=<%=jobCompany %>&jobTitle=<%=jobTitle %>&studentId=<%=studentId%>&studentName=<%=studentName%>&studentPhone=<%=studentPhone%>&studentEmail=<%=studentEmail%>&studentCourse=<%=studentCourse%>"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#applyModal">Apply</button></a>
						        </td>
						      </tr>
						      <%
								}
						    %>
						    </tbody>
						  </table>
						</div>
					</div>
					
					<!-- Withdrawn appliaions -->
					<div class="applied-jobs-table mt-5 mb-4 text-center bg-light"  id="appliedJobstable">
						<h2 class=" pt-5" ><span class="text-danger">Withdrawn</span>  Job Applications</h2>
						<hr class="my-4">
						<div class="table-responsive p-4">
						  <table class="table ">
						    <thead class="bg-info text-white">
						      <tr>
						        <th scope="col">Job Application ID</th>
						        <th scope="col">Company</th>
						        <th scope="col">Position</th>
						        <th scope="col">Student Name</th>
						        <th scope="col">Student Email</th>
						        <th scope="col">Student Phone</th>
						        <th scope="col"> About Student</th>
						        <th scope="col">Delete Application</th>
						      </tr>
						    </thead>
						     <tbody>
						     <%
						    		rs = jobDao.getAllWithdrawnJobDetailsForStudentId(studentId);
									while(rs.next())
									{
										int applied_job_id = rs.getInt("applied_job_id");
										int student_id = rs.getInt("student_id");
										String applied_job_title = rs.getString("applied_job_title");
										String applied_job_company = rs.getString("applied_job_company");
										String applied_job_student_name = rs.getString("applied_job_student_name");
										String applied_job_student_email = rs.getString("applied_job_student_email");
										String applied_job_student_phone = rs.getString("applied_job_student_phone");
										String applied_job_student_about = rs.getString("applied_job_student_about");
							  %>
						      <tr class="table-info"	>
						      	<td><%=applied_job_id %></td>
						        <td><%=applied_job_company %></td>
						        <td><%=applied_job_title %></td>
						        <td><%=applied_job_student_name %></td>
						        <td><%=applied_job_student_email %></td>
						        <td><%=applied_job_student_phone %></td>
						         <td><%=applied_job_student_about %></td>
						        <td>
						        	<%-- <a href="DeleteApplyJobFormServlet?applied_job_id=<%=applied_job_id %>&studentId=<%=student_id %>&studentName=<%=applied_job_student_name %>"><button type="button" class="btn btn-danger" onclick="confirmDelete()">Delete</button></a> --%>
									<button type="button" class="btn btn-danger" onclick="confirmWithdrawnJobDelete('<%=applied_job_id %>','<%=student_id %>','<%=applied_job_student_name %>')">Delete</button>
						        </td>
						      </tr>
						      <%
								}
						    %>
						    </tbody>
						  </table>
						</div>
					</div>
					
				</div>
			</div>
		</div>	
					<!--  footer -->
					<footer class="bg-dark text-center  text-white">
						<div class="contact-us container p-4" id="contact-us">
							<h2 class="mt-2 mb-2" >Contact Us</h2>
							<hr class="my-4">
							<div class="contact-us-content">
								<div class="row">
									<div class="col-lg-6 col-sm-12">
										<h5 class="text-uppercase">Address</h5>
										<div class="address-coloumn">
											<p>
												Radha TechSpace, Baner,
												Pune,423604.
											</p>
										</div>
									</div>
									<div class="col-lg-6 col-sm-12">
										<h5 class="text-uppercase">Reach Us</h5>
										<div class="address-coloumn">
											<p><a href="mailto:someone@example.com" class="text-white">campusrecsystem@gmail.com</a></p>
											<p><a href="tel:+4733378901" class="text-white">+47 333 78 901</a></p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="copyright bg-info text-light p-2  text-center ">
							Copyright &copy; 2023. All rights reserved.
						</div>
					</footer>


	<script>
	/*withdraw job application*/	
	   function confirmAppliedJobWithdraw(applied_job_id,student_id,applied_job_student_name) {
	              var conf =  confirm("Do you really want to withdraw the job application ?");
	              if (conf) {
	          	    window.location.href = "WithdrawApplyJobFormServlet?applied_job_id="+applied_job_id+"&studentId="+student_id+"&studentName="+applied_job_student_name;
	              }
	            }
	
	/*confirm applied job delete*/
	   function confirmWithdrawnJobDelete(applied_job_id,student_id,applied_job_student_name) {
	              var conf =  confirm("Do you really want to delte the job application permenantly ?");
	              if (conf) {
	          	    window.location.href = "DeleteAppliedJobFormServlet?applied_job_id="+applied_job_id+"&studentId="+student_id+"&studentName="+applied_job_student_name;
	              }
	            }
    </script>

		
</body>
</html>