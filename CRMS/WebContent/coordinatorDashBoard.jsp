<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
		<!-- View Job Modal -->
		<!-- Modal -->
		<div class="modal fade" id="postJob" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Post Job</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form>
				  <div class="form-group">
				    <label for="jobTile">Job Title</label>
				    <input type="text" class="form-control" id="jobTile" placeholder="Enter Job Title">
				  </div>
				    <div class="form-group">
				    <label for="companyName">Company Name</label>
				    <input type="text" class="form-control" id="companyName" placeholder="Enter Job description">
				  </div>
				  <div class="form-group">
				    <label for="jonDescription">Job description</label>
				    <textarea class="form-control" id="jonDescription" placeholder="Enter Job description" rows=4></textarea>
				  </div>
				</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Post</button>
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
					      <p class="card-text ">4</p>
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
						        <th scope="col">#</th>
						        <th scope="col">Company</th>
						        <th scope="col">Position</th>
						        <th scope="col">View</th>
						        <th scope="col">Apply</th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr class="table-info"	>
						        <th scope="row">1</th>
						        <td>Quadwave</td>
						        <td>Associate Solutions Developer</td>
						        <td>
						        	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="">
									  View
									</button>
								</td>
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