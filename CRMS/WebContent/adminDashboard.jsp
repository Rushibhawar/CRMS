<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,helper.*,dao.*;" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Dashboard</title>
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
		<div class="home p-5">
			<div class="home-content jumbotron " id="home">
				<div class="home-main-content p-4  text-center" >
					<h1 class="">Admin Dashboard</h1>
					
					</div>
					
					<!-- table job openings -->
					<div class="applied-jobs-table mt-5 mb-4 text-center bg-light">
						<h2 class=" pt-5" >View Students</h2>
						<hr class="my-4">
						<div class="table-responsive p-4">
						  <table class="table ">
						    <thead class="bg-info text-white">
						      <tr>
						        <th scope="col">#</th>
						        <th scope="col">Student Name</th>
						        <th scope="col">Student Email</th>
						        <th scope="col">Student College</th>
						        <th scope="col">Student Course</th>
						        <th scope="col">Student Contact</th>
						        <th scope="col">Student Address</th>
								<th scope="col">Delete</th>
						      </tr>
						    </thead>
						    <tbody>
						      <%
						  			StudentDao studentDao = new StudentDao(con);
						    		ResultSet rs = studentDao.getStudentDetails();
									while(rs.next())
									{
										int student_id = rs.getInt("student_id");
										String student_name = rs.getString("student_name");
										String student_email = rs.getString("student_email");
										String student_college = rs.getString("student_college");
										String student_course = rs.getString("student_course");
										String student_contact = rs.getString("student_contact");
										String student_address = rs.getString("student_address");
							  %>
						      <tr class="table-info"	>
						      	<td><%=student_id %></td>
						      	<td><%=student_name %></td>
						        <td><%=student_email %></td>
						        <td><%=student_college %></td>
						        <td><%=student_course %></td>
						        <td><%=student_contact %></td>
						         <td><%=student_address %></td>
						        <td><a href="DeleteStudentServlet?student_id=<%=student_id %>"><button type="button" id="deleteStudentServlet" class="btn btn-danger">Delete</button></a></td>
						      </tr>
						      <%
								}
						    %>
						    </tbody>
						  </table>
						</div>
					</div>
					<div class="vacant-jobs-table mt-4 mb-4 text-center bg-light">
						<h2 class=" pt-5" >View Coordinator</h2>
						<hr class="my-4">
						<div class="table-responsive p-4">
						  <table class="table">
			 <thead class="bg-info text-white">
						      <tr>
						        <th scope="col">Coordinator ID</th>
						        <th scope="col">Coordinator Name</th>
						        <th scope="col">Coordinator Email</th>
						       <th scope="col">Coordinator Contact</th>
						       <th scope="col">Coordinator Address</th>
						       <th scope="col">Delete Coordinator</th>
						      </tr>
						    </thead>
						    <tbody>
						      <%
						  			coordinatorDao cooDao = new coordinatorDao(con);
						    		 rs = cooDao.getAllCoordinatorDetails();
									while(rs.next())
									{
										int coordinator_id = rs.getInt("coordinator_id");
										String coordinator_name = rs.getString("coordinator_name");
										String coordinator_email = rs.getString("coordinator_email");
										String coordinator_address = rs.getString("coordinator_address");
										String coordinator_contact = rs.getString("coordinator_contact");
							  %>
						      <tr class="table-info"	>
						      	<td><%=coordinator_id %></td>
						      	<td><%=coordinator_name %></td>
						        <td><%=coordinator_email %></td>
						        <td><%=coordinator_contact %></td>
						        <td><%=coordinator_address %></td>
						        <td><a href="DeleteCoordinatorServlet?coordinator_id =<%=coordinator_id %>"><button type="button" id="deleteCoordinatorServlet" class="btn btn-danger">Delete</button></a></td>
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
	
		
</body>
</html>