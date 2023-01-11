<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		<!-- View Job Modal -->
		<!-- Button trigger modal -->
		
		
		
		
		
		<div class="home p-5">
			<div class="home-content jumbotron " id="home">
				<div class="home-main-content p-4  text-center" >
					<h1 class="">Admin Dashboard</h1>
					
					</div>
					
					<!-- table job openings -->
					<div class="applied-jobs-table mt-5 mb-4 text-center bg-light">
						<h2 class=" pt-5" >View Student</h2>
						<hr class="my-4">
						<div class="table-responsive p-4">
						  <table class="table ">
						    <thead class="bg-info text-white">
						      <tr>
						        <th scope="col">#</th>
						        <th scope="col">Company</th>
						        <th scope="col">Position</th>
						        <th scope="col">View</th>
						        <th scope="col">Action</th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr class="table-info"	>
						        <th scope="row">1</th>
						        <td>Quadwave</td>
						        <td>Associate Solutions Developer</td>
						        <td>
						        	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
									  View
									</button>
								</td>
						        <td><button type="button" class="btn btn-danger">Delete</button></td>
						      </tr>
						       <tr class="table-info"	>
						        <th scope="row">1</th>
						        <td>Quadwave</td>
						        <td>Associate Solutions Developer</td>
						        <td><button type="button" class="btn btn-primary">View</button></td>
						        <td><button type="button" class="btn btn-danger">Delete</button></td>
						      </tr>
						       <tr class="table-info"	>
						        <th scope="row">1</th>
						        <td>Quadwave</td>
						        <td>Associate Solutions Developer</td>
						        <td><button type="button" class="btn btn-primary">View</button></td>
						        <td><button type="button" class="btn btn-danger">Delete</button></td>
						      </tr>
						    </tbody>
						  </table>
						</div>
					</div>
					<div class="vacant-jobs-table mt-4 mb-4 text-center bg-light">
						<h2 class=" pt-5" >view Coordinator</h2>
						<hr class="my-4">
						<div class="table-responsive p-4">
						  <table class="table">
			 <thead class="bg-info text-white">
						      <tr>
						        <th scope="col">#</th>
						        <th scope="col">Company</th>
						        <th scope="col">Position</th>
						        <th scope="col">View</th>
						        <th scope="col">Action</th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr class="table-info"	>
						        <th scope="row">1</th>
						        <td>Quadwave</td>
						        <td>Associate Solutions Developer</td>
						        <td><button type="button" class="btn btn-primary">View</button></td>
						        <td><button type="button" class="btn btn-danger">Delete</button></td>
						      </tr>
						       <tr class="table-info"	>
						        <th scope="row">1</th>
						        <td>Quadwave</td>
						        <td>Associate Solutions Developer</td>
						        <td><button type="button" class="btn btn-primary">View</button></td>
						        <td><button type="button" class="btn btn-danger">Delete</button></td>
						      </tr>
						       <tr class="table-info"	>
						        <th scope="row">1</th>
						        <td>Quadwave</td>
						        <td>Associate Solutions Developer</td>
						        <td><button type="button" class="btn btn-primary">View</button></td>
						        <td><button type="button" class="btn btn-danger">Delete</button></td>
						      </tr>
						    </tbody>
						  </table>
						</div>
					</div>
				</div>
			</div>
		</div>	
	
		
</body>
</html>