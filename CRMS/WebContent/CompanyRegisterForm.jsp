<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Coordinator Register</title>
	<!-- CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="CSS/companyLogInStyle.css">

</head>
<body>

	<%@include file="navbar.jsp" %>
	 <div class="register-card container-fluid p-5 mt-5">
	 	
		<form id="myForm" name="myForm" method="post">
			<h1>Coordinator Registration From<span class="fa fa-user-plus ml-2"></span> </h1>
			  <div class="row mt-4 mb-4">
			    <div class="col form-group">
			    	<label for="coordinatorname">Coordinator Name</label>
			    	<input type="text" class="form-control" placeholder="Coordinator name" name="CoordinatorName" id="CoordinatorName"   maxlength="20" required>
			    </div>
			  
			    <div class="col form-group">
			    	<label for="email"> Email</label>
			    	<input type="email" class="form-control" placeholder="Enter email" name="email" id="email"  maxlength="30" required >
			    </div>
			  </div>
				
				<div class="mt-4 mb-4 form-group">
			  	<label for="inputpassword">Password</label>
	      		<input type="password" class="form-control" id="inputpassword" name="inputPassword" placeholder="Enter password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" oninvalid="setCustomValidity('Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters ')"  maxlength="20" min="6" required>
	      		<small>Format : password between 6 to 20 characters which contain at least one numeric digit, one uppercase and one lowercase letter</small>
	      	 </div>
			  
			    <div class=" mt-4 mb-4 form-group">
			    	<label for="Address">Address :</label>
			    	<input type="text" class="form-control" placeholder=" Enter Address" name="Address" id="Address"  maxlength="100" required>
			    </div>
			  
			  <div class="mt-4 mb-4 form-group">
			  	<label for="inputPhone">Phone</label>
	      		<input type="phone" class="form-control" id="inputPhone" name="inputPhone" placeholder="xxx-xxx-xxxx" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" maxlength="12" required>
	      		<small>Format : 123-456-7891</small>
	      		
			  </div>
		  
		  	<button type="submit" class="btn btn-success " >Add Coordinator <span class="fa fa-send-o"></span> </button>
		<!--   	<a href="companyLogin.jsp">
				<button type="button" class="btn btn-primary ">Sign In<span class="fa fa-user-plus ml-2"></span></button>
			</a> -->
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
	 <script>
	 $(document).ready(function(){
		 $("#myForm").submit(function(){
			 event.preventDefault();
			 var coordinatorName = $("#CoordinatorName").val();
			 var coordinatorEmail = $("#email").val();
			 var coordinatorPassword = $("#inputpassword").val();
			 var coordinatorAddress = $("#Address").val();
			 var coordinatorContact = $("#inputPhone").val();
			 console.log("sdjjnda" +coordinatorName);
			 //var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;
			 
			 if(coordinatorName == "" || coordinatorEmail == "" || coordinatorPassword == "" ||  coordinatorAddress == "" || coordinatorContact == "") {
				
				alert("Please enter the details properly");
			 }
			 else {
				 console.log("go");
					$.ajax({
						url: "CoordinatorServlet",
						type: "POST",
						data: {
							"coordinatorName": coordinatorName,
							"coordinatorEmail": coordinatorEmail,
							"coordinatorPassword": coordinatorPassword,
							"coordinatorAddress": coordinatorAddress,
							"coordinatorContact": coordinatorContact
						},
						success : function(data) {
							alert("Data stored successfully. Please Login");
							window.location.href = "http://localhost:8080/CRMS/companyLogin.jsp";
						},
						  error: function () {
						        console.log(arguments);
						        alert(" Error! Not able to register ");
						    }
					});
				 //document.getElementById("successfully-registered").style.display = "block";
			 }
			 
			/* else if(!regName.test(firstName) || !regName.test(lastName)){
				 //alert("Invalid name");
				 document.getElementById("invalid-name").style.display = "block";
				}*/
			 
			 
		 }
		 );
	 });
	 
	 </script>

</body>
</html>