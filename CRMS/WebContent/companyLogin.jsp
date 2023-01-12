<%@ page language="java"  contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="entity.*,java.sql.*;" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Coordinator	 Login</title>
	<!-- CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="CSS/companyLogInStyle.css">

</head>
<body>

	<%@include file="navbar.jsp" %>
	<%
	session.setMaxInactiveInterval(1);
	%>
	 <div class="register-card container-fluid p-5 mt-5">
	 	
		<form name="myForm" action="CoordinatorLoginCheck" method="post">
			<h1>Coordinator LogIn<span class="fa fa-user-plus ml-2"></span> </h1>
<!-- 			<div class="alert alert-success" role="alert" id="successfully-registered">
  				<strong>Success! </strong> Successfully registered.
			</div>
			
		  	<div class="alert alert-danger" role="alert" id="wrong-details-alert">
  				<strong>ERROR!</strong> Please enter your details properly.
			</div>
 -->			
 					<%
							HttpSession ss = request.getSession();
							Message msg = (Message)ss.getAttribute("message");
							if(msg!=null){
						%>
							<div class="alert <%= msg.getCssClass() %>"  role="alert" id="wrong-details-alert">
							  <%= msg.getContent() %>
							  <br>
							  New user?<a href="CompanyRegisterForm.jsp"><u>SignUp</u></a>
							</div>
						<%		
							session.removeAttribute("message");
							}
						%>
			  <div class="row mt-4 mb-4">
			    <div class="col form-group">
			    	<label for="coordinatorName">Coordinator Name</label>
			    	<input type="text" class="form-control" placeholder="Eter User name" name="coordinatorName" id="coordinatorName" maxlength="20" required>
			    </div>
			  
			    <div class="col form-group">
			    	<label for="email"> Email</label>
			    	<input type="email" class="form-control" placeholder="Enter email" name="coordinatorEmail" id="coordinatorEmail"  maxlength="30" required >
			    </div>
			  </div>
				<div class="mt-4 mb-4 form-group">
			  	<label for="inputpassword">Password</label>
	      		<input type="password" class="form-control" id="coordinatorPassword" name="coordinatorPassword" placeholder="Enter password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" oninvalid="setCustomValidity('Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters ')"   maxlength="12" required>
			  	<small>Format :password between 6 to 20 characters which contain at least one numeric digit, one uppercase and one lowercase letter</small>
			  </div>
			  
			  
			  
		  
		  	<button type="submit" class="btn btn-success " >LogIn <span class="fa fa-send-o"></span> </button>
		  	<a href="CompanyRegisterForm.jsp">
				<button type="button" class="btn btn-primary ">Sign Up<span class="fa fa-user-plus ml-2"></span></button>
			</a>
		</form>
	 </div>
	 
	 
	 <!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.js"></script>
	
	
	<!-- Javascript -->
	<script src="javascript/script.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
		
	 
	 
	 <!-- JavaScript -->
	  <script >

	 </script>

	
</body>
</html>