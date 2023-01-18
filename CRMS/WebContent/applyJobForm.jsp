<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job Application</title>
<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="CSS/logInStyle.css">

</head>
<body>

	<%@include file="navbar.jsp" %>
	
	<%
		int jobId = Integer.parseInt(request.getParameter("jobId"));
		String jobCompany = request.getParameter("jobCompany");
		String jobTitle = request.getParameter("jobTitle");
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		String studentName = request.getParameter("studentName");
		String studentPhone = request.getParameter("studentPhone");
		String studentEmail = request.getParameter("studentEmail");
		String studentCourse = request.getParameter("studentCourse");
	%>
	<div class="register-card container-fluid p-5 mt-5">

		 <form id="myForm" name="myForm"  method="post">
			<header>
				<h1>
					Job Application For <span class="text-warning"><%=jobCompany %></span>
				</h1>
			</header>
<!-- 			<div class="alert alert-success" role="alert"
				id="successfully-registered">
				<strong>Success! </strong> Successfully registered.
			</div>

			<div class="alert alert-danger" role="alert" id="wrong-details-alert">
				<strong>ERROR!</strong> Please enter your details properly.
			</div> -->
				<div class="form-group">
					    <label for="jobTile">Job Title</label>
					    <input type="text" class="form-control" id="jobTile" placeholder="<%=jobTitle%>" value="<%=jobTitle%>" disabled>
					  </div>
					    <div class="form-group">
					    <label for="jobCompanyName">Company Name</label>
					    <input type="text" class="form-control" id="jobCompanyName" placeholder="<%=jobCompany%>" value="<%=jobCompany%>" disabled>
					  </div>
				<div class="form-group">
					<label for="inputEmail">Enter Email</label> <input type="email"
						class="form-control" id="studentEmail" name="studentEmail" value="<%=studentEmail %>"
						placeholder="abc@gmail.com" required>
				</div>
			<div class="mt-4 mb-4  form-group">
				<label for="Student">Enter Student Name</label> 
				<input type="text"class="form-control" placeholder="<%=studentName %>" value="<%=studentName %>" name="studentName" id="studentName" required>
			</div>
			<div class="mt-4 mb-4 form-group">
				<label for="inputCourse">Course</label> 
				<select
					class="form-control " id="studentCourse" name="studentCourse" required>
					<option selected="" value="<%=studentCourse%>"><%=studentCourse%></option>
					<option value="BCA">BCA</option>
					<option value="BSc">BSc</option>
					<option value="MCA">MCA</option>
					<option value="MSC">MSC</option>
					<option value="BTech">BTech</option>
					<option value="MTech">MTech</option>
				</select>
			</div>

			<div class="mt-4 mb-4 form-group">
				<label for="inputCollage">College</label> <select
					class="form-control " id="studentCollege" name="studentCollege" required>
					<option selected=""
						value="Feroze Gandhi Institute of Engg. & Technology , Rae bareli">Feroze
						Gandhi Institute of Engg. & Technology , Rae bareli</option>

				</select>
			</div>
			<div class="mt-4 mb-4 form-group">
			<label for="inputPhone">Phone</label>
	      		<input type="tel" class="form-control" id="studentPhone" name="studentPhone" value="<%=studentPhone %>" placeholder="xxx-xxx-xxxx" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" maxlength="12">
	      		<small>Format : 123-456-7891</small>

			</div>
			<div class="mt-4 mb-4 form-group">
				<label for="aboutYourself">Tell about yourself</label> <textarea
					class="form-control" placeholder="Tell about yourself" name="aboutYourself" id="aboutYourself"
					required></textarea>
				</div>

			<button type="submit" class="btn btn-success ">
				Apply <span class="fa fa-send-o"></span>
			</button>
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
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ajaxy/1.6.1/scripts/jquery.ajaxy.js"></script>
	
	
	<!-- Javascript -->
	<!-- <script src="javascript/script.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	


	<!-- JavaScript -->
	<script>
	$(document).ready(function() {
		$("#myForm").submit(function(){
			event.preventDefault();
			var studentEmail = $("#studentEmail").val();
			var studentName = $("#studentName").val();
			var studentCourse = $("#studentCourse").val();
			var studentCollege = $("#studentCollege").val();
			var studentPhone = $("#studentPhone").val();
			var aboutYourself = $("#aboutYourself").val();
			var jobId = <%=jobId%>;
			var jobCompany = "<%=jobCompany%>";
			var jobTitle = "<%=jobTitle%>";
			var studentId = "<%=studentId%>";

			console.log(""+studentEmail+" "+jobId+""+jobCompany);
			
				$.ajax({
					url: "ApplyJobForm",
					type: "POST",
					data: {
						"studentEmail": studentEmail,
						"studentName": studentName,
						"studentCourse": studentCourse,
						"studentCollege": studentCollege,
						"studentPhone": studentPhone,
						"aboutYourself": aboutYourself,
						"jobId" : jobId,
						"jobCompany" :jobCompany,
						"jobTitle":jobTitle,
						"studentId":studentId
					},
					success : function(data) {
						console.log(data);
						if(data == "1"){
							alert("Applied successfully.");
							window.location.href = "http://localhost:8080/CRMS/studentDashBoard.jsp?studentId="+studentId+"&studentName="+studentName;
						}
						else{
							alert("Some error occured while applying");
							
						}
					},
					  error: function () {
					        console.log(arguments);
					        alert(" Error! Not able to apply ");
					    }
				});
			
		});
	});
	</script>
</body>
</html>