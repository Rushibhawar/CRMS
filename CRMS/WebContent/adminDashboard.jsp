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
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle d-block" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		        	View
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		        	<a class="dropdown-item " href="#viewStudents">View Students</a>
					<a class="dropdown-item " href="#viewCoordinators">View Coordinator</a>
					<a class="dropdown-item " href="#viewDeletedStudents">View Deleted Students</a>
					<a class="dropdown-item " href="#viewDeletedCoordinators">View Deleted Coordinator</a>
		        </div>
		      </li>
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle d-block" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		        ADD
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		        	<!-- Add admin -->
					<a class="dropdown-item " href="adminRegisterForm.jsp">
						<button type="button" class="btn btn-primary ">Add Admin<span class="fa fa-user-plus ml-2"></span></button>
					</a>
					<!-- Add coordinator -->
					<a class="dropdown-item" href="CompanyRegisterForm.jsp">
						<button type="button" class="btn btn-primary ">Add Coordinator<span class="fa fa-user-plus ml-2"></span></button>
					</a>
					<!-- Add student -->
					<a class="dropdown-item"  href="studenRegister.jsp">
						<button type="button" class="btn btn-primary ">Add Student<span class="fa fa-user-plus ml-2"></span></button>
					</a>
		        </div>
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
		<div class="home p-5">
			<div class="home-content jumbotron " id="home">
				<div class="home-main-content p-4  text-center" >
					<header>
						<h1 class="text-dark">
							Admin Dashboard
						</h1>
					</header>
					<hr class="my-4">
					
					</div>
					
					
					
					<!-- table job openings -->
					<div class="applied-jobs-table mt-5 mb-4 text-center bg-light" id="viewStudents">
						<h2 class=" pt-5" >View Students</h2>
						<hr class="my-4">
						<div class="table-responsive p-4">
						  <table class="table ">
						    <thead class="bg-info text-white">
						      <tr>
						        <th scope="col">Student ID</th>
						        <th scope="col">Student Name</th>
						        <th scope="col">Student Email</th>
						        <th scope="col">Student College</th>
						        <th scope="col">Student Course</th>
						        <th scope="col">Student Contact</th>
						        <th scope="col">Student Address</th>
								<th scope="col">Delete Student</th>
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
						        <%-- <td><a href="DeleteStudentServlet?student_id=<%=student_id %>"><button type="button" id="deleteStudentServlet" class="btn btn-danger" onclick="confirmDelete()">Delete</button></a></td> --%>
						        <td><button type="button" id="deleteStudentServlet" class="btn btn-danger" onclick="confirmStudentDelete('<%=student_id %>')">Delete</button></td>
						      </tr>
						      <%
								}
						    %>
						    </tbody>
						  </table>
						</div>
					</div>
					<!-- View coordinator -->
					<div class="vacant-jobs-table mt-4 mb-4 text-center bg-light" id="viewCoordinators">
						<h2 class=" pt-5" >View Coordinators</h2>
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
						        <%-- <td><a href="DeleteCoordinatorServlet?coordinator_name=<%=coordinator_name %>&coordinator_id=<%=coordinator_id %>"><button type="button" id="deleteCoordinatorServlet" class="btn btn-danger" onclick="confirmDelete()">Delete</button></a></td> --%>
						      <td><button type="button" id="deleteCoordinatorServlet" class="btn btn-danger" onclick="confirmCoordinatorDelete('<%=coordinator_id %>')">Delete</button></td>
						      </tr>
						      <%
								}
						    %>
						    </tbody>
						  </table>
						</div>
					</div>
					
					<!-- View Deleted Students -->
					<div class="applied-jobs-table mt-5 mb-4 text-center bg-light" id="viewDeletedStudents">
						<h2 class=" pt-5" >View <span class="text-danger">Deleted</span> Students</h2>
						<hr class="my-4">
						<div class="table-responsive p-4">
						  <table class="table ">
						    <thead class="bg-info text-white">
						      <tr>
						        <th scope="col">Student ID</th>
						        <th scope="col">Student Name</th>
						        <th scope="col">Student Email</th>
						        <th scope="col">Student College</th>
						        <th scope="col">Student Course</th>
						        <th scope="col">Student Contact</th>
						        <th scope="col">Student Address</th>
								<th scope="col">Restore Student</th>
						      </tr>
						    </thead>
						    <tbody>
						      <%
						    		rs = studentDao.getDeletedStudentDetails();
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
						        <%-- <td><a href="DeleteStudentServlet?student_id=<%=student_id %>"><button type="button" id="deleteStudentServlet" class="btn btn-danger" onclick="confirmDelete()">Delete</button></a></td> --%>
						        <td><button type="button" id="restoreStudentServlet" class="btn btn-success" onclick="confirmStudentRestore('<%=student_id %>')">Restore &nbsp;<span class="fa fa-refresh"></span></button></td>
						      </tr>
						      <%
								}
						    %>
						    </tbody>
						  </table>
						</div>
					</div>
					
						<!-- View deleted coordinator -->
					<div class="vacant-jobs-table mt-4 mb-4 text-center bg-light" id="viewDeletedCoordinators">
						<h2 class=" pt-5" >View <span class="text-danger">Deleted</span> Coordinators</h2>
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
						       <th scope="col">Restore Coordinator</th>
						      </tr>
						    </thead>
						    <tbody>
						      <%
						    		 rs = cooDao.getAllDeletedCoordinatorDetails();
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
						        <%-- <td><a href="DeleteCoordinatorServlet?coordinator_name=<%=coordinator_name %>&coordinator_id=<%=coordinator_id %>"><button type="button" id="deleteCoordinatorServlet" class="btn btn-danger" onclick="confirmDelete()">Delete</button></a></td> --%>
						      <td><button type="button" id="restoreCoordinatorServlet" class="btn btn-success" onclick="confirmCoordinatorRestore('<%=coordinator_id %>')">Restore &nbsp;<span class="fa fa-refresh"></span></button></td>
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
        function confirmStudentDelete(student_id) {
          var conf =  confirm("Do you really want to delete the record?");
          if (conf) {
      	    window.location.href = "DeleteStudentServlet?student_id="+student_id;
          }
        }
        
        /*confirm delete coordinator function*/
        function confirmCoordinatorDelete(coordinator_id) {
              var conf =  confirm("Do you really want to delete the record?");
              if (conf) {
          	    window.location.href = "DeleteCoordinatorServlet?coordinator_id="+coordinator_id;
              }
            }
        
        /*restor student*/
       function confirmStudentRestore(student_id) {
          var conf =  confirm("Do you really want to restore the student record?");
          if (conf) {
      	    window.location.href = "RestoreStudent?student_id="+student_id;
          }
        }
        
       /*restor coordinator*/
       function confirmCoordinatorRestore(coordinator_id) {
      	  var conf =  confirm("Do you really want to restore  the coordinator record?");
              if (conf) {
          	    window.location.href = "RestoreCoordinator?coordinator_id="+coordinator_id;
              }
        }
      		  
    </script>
		
</body>
</html>