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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
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
		
		<%
		session.setMaxInactiveInterval(1);
		%>
		<!-- Establish connection -->
		<%
			Connection con = ConnectionProvider.getMysqlConnection();
		%>
	
		
		<!-- fetch current  coordinator id and name -->
		<%
			int coordinatorId =Integer.parseInt( request.getParameter("coordinatorId"));
			String coordinatorName = request.getParameter("coordinatorName");
		%>
		<!--Post Job Modal -->
		<div class="modal fade" id="postJob" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelPostJob" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabelPostJob">Post Job</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form id="postJobFrom" name="postJobFrom" method="POST">
			        <div class="form-group">
					    <label for="currentcoordinatorId">Coordinator ID</label>
					    <input type="text" class="form-control" id="currentcoordinatorId" placeholder="<%=coordinatorId %>" value="<%=coordinatorId %>" disabled>
					  </div>
					   <div class="form-group">
					    <label for="currentcoordinatorName">Coordinator  Name</label>
					    <input type="text" class="form-control" id="currentcoordinatorName" placeholder="<%=coordinatorName %>" value="<%=coordinatorName %>" disabled>
					  </div>
					  <div class="form-group">
					    <label for="jobTile">Job Title</label>
					    <input type="text" class="form-control" id="jobTile" placeholder="Enter Job Title" required>
					  </div>
					    <div class="form-group">
					    <label for="jobCompanyName">Company Name</label>
					    <input type="text" class="form-control" id="jobCompanyName" placeholder="Enter Job description" required>
					  </div>
					  <div class="form-group">
					    <label for="jonDescription">Job description</label>
					    <textarea class="form-control" id="jonDescription" placeholder="Enter Job description" rows=4 required></textarea>
					  </div>
					  <div class="form-group">
					  	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        		<button type="submit" class="btn btn-primary">Post</button>
					  </div>
					  	
				</form>
		      </div>
		        
		    </div>
		  </div>
		</div>
		
		
		<div class="home p-5">
			<div class="home-content jumbotron " id="home">
				<div class="home-main-content p-4  text-center" >
					<h1 class="">Coordinator Dashboard</h1>
					<hr class="my-4">
					<div class="card-deck ">
					  <div class="card text-white text-center bg-primary">
					    <div class="card-body">
					      <h5 class="card-title"> Jobs posted</h5>
					      <%
						      	JobDao jobDao = new JobDao(con);
						  		int results = jobDao.getJobCount(coordinatorId, coordinatorName);
					      %>
					      <p class="card-text "><%=results %></p>
					    </div>
					    <div class="card-footer">
					      <a href="#jobsPosted"><button type="button" class="btn btn-dark">View</button></a>
					    </div>
					  </div>
					</div>
					
					<div class="mt-4 mb-4">
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#postJob">Post Job</button>
					</div>
					
				
					
					<!-- table job posted -->
					<div class="applied-jobs-table mt-5 mb-4 text-center bg-light" id="jobsPosted">
						<h2 class=" pt-5" > Jobs posted</h2>
						<hr class="my-4">
						<div class="table-responsive p-4">
						  <table class="table ">
						    <thead class="bg-info text-white">
						      <tr>
						      	<th scope="col">Job ID</th>
						      	<th scope="col">Posted By</th>
						        <th scope="col">Company</th>
						        <th scope="col">Position</th>
						        <th scope="col">Job Description</th>
						        <th scope="col">Delete Job</th>
						      </tr>
						    </thead>
						    <tbody>
						     <%
						    		ResultSet rs = jobDao.getJobDetails(coordinatorId, coordinatorName);
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
						      	<td><%=coordinator_name %></td>
						        <td><%=jobCompany %></td>
						        <td><%=jobTitle %></td>
						        <td><%=jobDescription %></td>
						        <td><a href="DeleteJobServlet?jobId=<%=jobId %>"><button type="button" id="deleteJobServlet" class="btn btn-danger">Delete</button></a></td>
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
	
	 <!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.js"></script>
	
	
	<!-- Javascript -->
	<script src="javascript/script.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
		
	
	<script >
	 $(document).ready(function(){
		 $("#postJobFrom").submit(function(){
			//event.preventDefault();
			 var currentcoordinatorName = $("#currentcoordinatorName").val();
			 var currentcoordinatorId = $("#currentcoordinatorId").val();
			 var jobTile = $("#jobTile").val();
			 var jobCompanyName = $("#jobCompanyName").val();
			 var jonDescription = $("#jonDescription").val();
			 console.log("currentcoordinatorName" +currentcoordinatorName+"jobTile"+jobTile+"  : currentcoordinatorId : "+currentcoordinatorId);

			 
			 if(currentcoordinatorName == "" || currentcoordinatorId == "" || jobTile == "" ||  jobCompanyName == "" || jonDescription == "") {
				alert("Please enter the details properly");
			 }
			 else {
				 console.log("go post");
					$.ajax({
						url: "PostJobServlet",
						type: "POST",
						data: {
							"currentcoordinatorName": currentcoordinatorName,
							"currentcoordinatorId": currentcoordinatorId,
							"jobTile": jobTile,
							"jobCompanyName": jobCompanyName,
							"jonDescription": jonDescription
						},
						success : function(data) {
							alert("Job posted successfully.");
						window.location.href = "coordinatorDashBoard.jsp?coordinatorId="+<%=coordinatorId%>+"&coordinatorName="+<%=coordinatorName%>;
 						},
						  error: function () {
						        console.log("error posting");
						        alert(" Error! Not able to post ");
						    }
					});
			 }
			 });
	 });
	 
	</script>
		
</body>
</html>