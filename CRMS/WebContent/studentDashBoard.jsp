<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,helper.*,dao.*;" %>
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
		  <a class="navbar-brand" href="index.jsp">CRMS</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item ">
		        <a class="nav-link " href="index.jsp">Home <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link " href="index.jsp">About Us</a>
		      </li>
			  <li class="nav-item">
		        <a class="nav-link " href="index.jsp">Contact Us</a>
		      </li>
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		         Portal Login
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		          <a class="dropdown-item " href="adminLogin.jsp">Admin Login</a>
		          <a class="dropdown-item" href="companyLogin.jsp">Coordinator Login</a>
		          <a class="dropdown-item" href="studentlogin.jsp">Student Login</a>
		        </div>
		      </li>
		    </ul>
		  </div>
		</nav>
		
		<!-- Establish connection -->
		<%
			Connection con = ConnectionProvider.getMysqlConnection();
		%>
		<!-- fetch current  student id and name -->
<%-- 		<%
			int currentStudentId =Integer.parseInt( request.getParameter("studentId"));
			String currentStudentName = request.getParameter("studentName");
		%> --%>
		<div class="home p-5">
			<div class="home-content jumbotron " id="home">
				<div class="home-main-content p-4  text-center" >
					<h1 class="">Student Dashboard</h1>
					<hr class="my-4">
					<div class="card-deck ">
					  <div class="card text-white text-center bg-primary">
					    <div class="card-body">
					      <h5 class="card-title">Applied Jobs</h5>
					      <%
						      	JobDao jobDao = new JobDao(con);
						  		int appliedJobCount = jobDao.getAllAppliedJobCount();
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
					
					<!-- table job openings -->
					<div class="applied-jobs-table mt-5 mb-4 text-center bg-light"  id="appliedJobstable">
						<h2 class=" pt-5" >Applied jobs</h2>
						<hr class="my-4">
						<div class="table-responsive p-4">
						  <table class="table ">
						    <thead class="bg-info text-white">
						      <tr>
						        <th scope="col">#</th>
						        <th scope="col">Company</th>
						        <th scope="col">Position</th>
						        <th scope="col">Student Name</th>
						        <th scope="col">Student Email</th>
						        <th scope="col">Student Phone</th>
						        <th scope="col"> About Student</th>
						        <th scope="col">Delete</th>
						      </tr>
						    </thead>
						     <tbody>
						     <%
						    		ResultSet rs = jobDao.getAllAppliedJobDetails();
									while(rs.next())
									{
										int applied_job_id = rs.getInt("applied_job_id");
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
						        	<a href="DeleteApplyJobFormServlet?applied_job_id=<%=applied_job_id %>"><button type="button" class="btn btn-danger" >Delete</button></a>
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
						        	<a href="applyJobForm.jsp?jobId=<%=jobId %>&jobCompany=<%=jobCompany %>&jobTitle=<%=jobTitle %>"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#applyModal">Apply</button></a>
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

		
</body>
</html>