<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>admin Login</title>
	<!-- CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="CSS/adminLoginStyle.css">

</head>
<body>
	
	<%@include file="navbar.jsp" %>
	
	 <div class="register-card container-fluid p-5 mt-5 "> 	
		<form name="myForm" onsubmit="submitForm()" action="#">
			<h1>Admin LogIn<span class="fa fa-user-plus ml-2"></span> </h1>
			<div class="alert alert-success" role="alert" id="successfully-registered">
  				<strong>Success! </strong> Successfully registered.
			</div>
			
		  	<div class="alert alert-danger" role="alert" id="wrong-details-alert">
  				<strong>ERROR!</strong> Please enter your details properly.
			</div>
			
			  <div class="row mt-4 mb-4">
			    <div class="col form-group">
			    	<label for="firstName">User Name</label>
			    	<input type="text" class="form-control" placeholder="User name" name="userName" id="firstName" pattern="[a-zA-Z]*" oninvalid="setCustomValidity('Please enter alphabets only. ')"  maxlength="20" >
			    </div>
			  
			  
			  </div>
			  	
				
				<div class="mt-4 mb-4 form-group">
			  	<label for="inputpassword">Password</label>
	      		<input type="password" class="form-control" id="inputpassword" name="inputpassword" placeholder="Enter password"  maxlength="12">
	      	
	      		
			  </div>
			  
			  
			  
		  
		  	<button type="submit" class="btn btn-success " >LogIn <span class="fa fa-send-o"></span> </button>
		</form>
	 </div>
	 
	 
	 
	 
	 <!-- JavaScript -->
	 <script >
	 function submitForm() {
		 var firstName = document.forms["myForm"]["firstName"].value;
		
		
		 var inputpassword = document.forms["myForm"]["inputpassword"].value;

		 //var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;
		 
		 if(firstName == "" ||  inputpassword == "") {
			//document.getElementById("wrong-details-alert").style.display = "block";
			alert("Please enter the details properly");
		 }
		 else {
			 alert("Successfully registered");
			 //document.getElementById("successfully-registered").style.display = "block";
		 }
		 
		/* else if(!regName.test(firstName) || !regName.test(lastName)){
			 //alert("Invalid name");
			 document.getElementById("invalid-name").style.display = "block";
			}*/
		 
		 
	 }
	 
	 </script>

	 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
</html>