<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="Error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">

<link href="css/mystyle.css" rel="stylesheet" type="text/css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.banner-design {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 98% 98%, 67% 91%, 34% 100%, 0 84%, 0 0);
}
</style>
</head>
<body>

	<%@ include file="Normal_navbar.jsp"%>

	<main class="primary-background p-5 pt-2 mb-5 banner-design">

		<div class="container" style="padding-bottom: 50px">

			<div class="col-md-6 offset-md-3">

				<div class="card">

					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-3x fa-user-circle"></span>
						<p>Register Here</p>
					</div>

					<div class="card-body">

						<form id="reg_form" action="RegisterServlet" method="post">

							<div class="mb-1">
								<label for="user_name" class="form-label">User Name</label> <input
									type="text" name="user_name" class="form-control"
									id="user_name" aria-describedby="userHelp" autocomplete="off" required="required">

							</div>

							<div class="mb-1">
								<label for="exampleInputEmail1" class="form-label">Email
									address</label> <input type="email" name="user_email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" autocomplete="off" pattern="^[a-zA-Z0-9._%+-]+@gmail\.com$" required="required">
								<div id="emailHelp" class="form-text">(email must include 'gmail.com')</div>
							</div>

							<div class="mb-1">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" name="user_password" class="form-control"
									id="exampleInputPassword1" required="required">
									<input  type="checkbox" onclick="togglePassword()">
												&nbsp; <span class="form-text">Show Password</span>
									<p class="form-text">(password should be 7 character long)								
									</p>
															
							</div>

							<div class="mb-1">
								<label for="gender">Select Gender</label> <br> <input
									type="radio" id="gender_male" name="gender" value="male" required="required">
								<label for="gender_male">Male</label> <input type="radio"
									id="gender_female" name="gender" value="female" required="required"> <label
									for="gender_female">Female</label>
							</div>


							<div class="form-group">

								<textarea name="about" class="form-control" rows="5"
									placeholder="Enter something about yourself"></textarea>

							</div>

							<div class="mb-1 form-check">
								<input type="checkbox" name="check" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree term and Condition</label>
							</div>

							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-refresh fa-spin fa-4x"></span> <br> <big>Please
									Wait...</big>
							</div>
							<button id="submit-btn" type="submit"
								class="btn btn-primary mt-1">Submit</button>
						</form>

					</div>

					<div class="card-footer"></div>
				</div>

			</div>

		</div>

	</main>



	<!-- javaScript -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {
		console.log("loaded");

		$('#reg_form').on('submit', function(event) {

			event.preventDefault();
			
			let form = new FormData(this);
			
			$('#submit-btn').hide();
			$('#loader').show();
			
			

			// send register servlet
			$.ajax({
				url: 'RegisterServlet',
				type: 'POST',
				data: form,
				success: function(data, textStatus, jqXHR) {
					console.log(data);
					$('#loader').hide();
					$('#submit-btn').show();
					
					if(data.trim() === 'done') {
						Swal.fire({
							  icon: 'success',
							  title: 'Done...',
							  text: 'You are successfully register.Redirecting to login page.',
							}).then((value) => {
								window.location = 'login_page.jsp';
							})
					}
					else {
						Swal.fire(data);
					}	
					
				},
				error: function(jqXHR, textStatus, errorThrown) {
					Swal.fire({
						  icon: 'error',
						  title: 'Oops...',
						  text: 'Something went wrong!',
						  
						})
					console.log(jqXHR);
					$('#loader').hide();
					$('#submit-btn').show();
				},
				processData: false,
				contentType: false,
				
				
			});
		})
	})
	
	
	</script>
	
	<!--  for showing password -->	
	<script type="text/javascript">
	
	function togglePassword() {
		var x = document.getElementById("exampleInputPassword1");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
	
	</script>
</body>
</html>