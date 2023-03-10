<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="entity.*;" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
	<!-- CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- <link rel="stylesheet" href="CSS/adminLoginStyle.css"> -->
	<link rel="stylesheet" href="CSS/logInStyle.css">
	
</head>
<body>
	
	<%@include file="navbar.jsp" %>
	
	 <div class="register-card container-fluid p-5 mt-5 "> 	
		<form id="myForm" name="myForm"  action="AdminLoginCheck" method="post">
			<header>
				<h1>
					Admin LogIn<span class="fa fa-user-plus ml-2"></span> 
				</h1>
			</header>
					<%
							HttpSession ss = request.getSession();
							Message msg = (Message)ss.getAttribute("message");
							if(msg!=null)
							{
						%>
							<div class="alert <%= msg.getCssClass() %>"  role="alert" id="wrong-details-alert">
								  <%= msg.getContent() %>
								  <br>
								  New user? Contact college to register as new admin<!-- <a href="adminRegisterForm.jsp"><u>SignUp</u></a> -->
							</div>
						<%		
								session.removeAttribute("message");
							}
						%>
			
			  <div class="row mt-4 mb-4">
			    <div class="col form-group">
			    	<label for="adminName">Admin Name</label>
			    	<input type="text" class="form-control" placeholder="Admin name" name="adminName" id="adminName"   maxlength="20" required >
			    </div>
			  
				<div class="col form-group">
			    	<label for="adminEmail"> Email</label>
			    	<input type="email" class="form-control" placeholder="Admin email" name="adminEmail" id="adminEmail"  maxlength="30" required >
			    </div>
			  </div>
				<div class="mt-4 mb-4 form-group">
			  	<label for="adminPassword">Password</label>
	      		<input type="password" class="form-control" id="adminPassword" name="adminPassword" placeholder="Enter password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" oninvalid="setCustomValidity('Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters ')" maxlength="20" min="6"  required>
			  	<small>Format :password between 6 to 20 characters which contain at least one numeric digit, one uppercase and one lowercase letter</small>
			  </div>
		  	<button type="submit" class="btn btn-success " >LogIn <span class="fa fa-send-o"></span> </button>
		 <!--  	<a href="adminRegisterForm.jsp">
				<button type="button" class="btn btn-primary ">Sign Up<span class="fa fa-user-plus ml-2"></span></button>
			</a> -->
		</form>
	 </div>
			<!--  footer -->
					<footer class="bg-dark text-center mt-5 text-white">
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
	 
	 
	 
	 <!-- JavaScript -->
	 <script >
	
	 </script>

	 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
</html>