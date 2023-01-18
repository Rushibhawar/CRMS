<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="CSS/styleHome.css">
	
	<!-- Font Awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
</head>
<body>
	
		
		
		<!-- navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark ml-3 mr-3" >
		    <a class="navbar-brand" href="index.jsp">
			  		<div class=" text-center text-info text-center ">
						<img class="crms-logo " alt="crms logo" src="images/CRMS-1 (1).png" id="crms-logo" style="max-width: 100px;" >
					</div>
			  </a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav mr-auto">
		      <li class="nav-item ">
		        <a class="nav-link d-block" href="#home">Home <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link d-block" href="#about-us">About Us</a>
		      </li>
			  <li class="nav-item">
		        <a class="nav-link d-block" href="#contact-us">Contact Us</a>
		      </li>
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle d-block" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
		
		<div class="home p-5">
			<div class="home-content jumbotron " id="home">
				<header class="home-main-content p-4 text-dark" >
				  <h1 class="display-4">Campus Recruitment System</h1>
				  <hr class="my-4">
				  <div class="row">
				  	<div class="col-lg-10 col-md-10 col-sm-12">
				  		<p>Campus Recruitment Software is a tool recruiters and student used to simplify the campus recruitment process. 
					  		Companies go for Campus Hiring every year to source young new talent for multiple roles in the company. 
					  		Campus recruitment software facilitates the process, paving way for easy hiring.
					  	</p>
					  	<p class="">
					    <a class="btn btn-success " href="#portals" role="button">Get Started &nbsp;<span class="	fa fa-send-o"> </span> </a>
					  </p>
				  	</div>
				  	<div class="col-lg-2 col-md-2 ">
				  		<img class="company-png " alt="company_3d_png" src="images/company_png.png">
				  	</div>
				  </div>
				  
				</header>
				
				<div class=" about-us bg-dark text-white text-center mt-4 mb-4 " id="about-us">
					<div class="about-us-content">
						<h2 class=" pt-5" >About Us</h2>
						<hr class="my-4">
						<div class="about-us-main-content p-3">
							<p>
								Campus Selection System is a platform that provide interface between students and company. System
								provides the list of suitable companies to the students, according to their educational qualification, experience
								and their preferences. System provides the list of eligible students from a pool according to required skill for
								vacancy of company. The aim is to provide services to both the Employer and the Graduate by recruiting
								Graduates according to the employer specifications. 
							</p>
						</div>
					</div>
				</div>
				
				<div class=" portals text-center mt-2 mb-4 " >
					<div class="portals-content" id="portals">
						<h2 class=" pt-5" >Portals</h2>
						<hr class="my-4">
						<div class="portals-main-content p-3">
							<div class="card-group">
							  <div class="card mr-lg-2 mr-md-2">
							    <div class="card-body">
							      <h5 class="card-title header">Admin Portal</h5>
							      <img class="card-img-top portal-pngs mw-100" src="images/college.png" alt="admin portal png">
							      <div class="student-button mt-4 mb-2" >
							      <a href="adminLogin.jsp"><button type="button" class="btn btn-info">Admin</button></a>
							      </div>
							    </div>
							  </div>
							  <div class="card">
							    <div class="card-body">
							      <h5 class="card-title header">Coordinator Portal</h5>
							      <img class="card-img-top portal-pngs mw-100" src="images/coordinator.png" alt="coordinator portal png">
							      <div class="student-button mt-4 mb-2">
							      <a href="companyLogin.jsp"><button type="button" class="btn btn-info">Coordinator</button></a>
							      </div>
							    </div>
							  </div>
							  <div class="card ml-lg-2 ml-md-2">
							    <div class="card-body">
							      <h5 class="card-title header">Student Portal</h5>
							      <img class="card-img-top portal-pngs mw-100" src="images/student.png" alt="student portal png">
							      <div class="student-button mt-4 mb-2">
							      <a href="studentlogin.jsp"><button type="button" class="btn btn-info">Student</button></a>
							      </div>
							    </div>
							  </div>
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
									<div class="col-lg-4 col-sm-6">
										<h5 class="text-uppercase">Address</h5>
										<div class="address-coloumn">
											<p>
												Radha TechSpace, Baner,
												Pune,423604.
											</p>
										</div>
									</div>
									<div class="col-lg-4 col-sm-6">
										<h5 class="">Useful Links</h5>
										<div class="address-coloumn">
											<p><a href="adminLogin.jsp" class="">Admin Portal</a></p>
											<p><a href="companyLogin.jsp" class="">Coordinator Portal</a></p>
											<p><a href="studentlogin.jsp" class="">Student Portal</a></p>
										</div>
									</div>
									<div class="col-lg-4 col-sm-12">
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
	
	
</body>
</html>