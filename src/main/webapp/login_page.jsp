<%@page import="com.tech.blog.entity.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page errorPage="Error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Blog</title>
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

	<!-- navbar -->
	<%@ include file="Normal_navbar.jsp" %>

	<main class="d-flex align-items-center primary-background banner-design " style="height: 82vh">

		<div class="container mb-5">

			<div class="row">

				<div class="col-md-4 offset-md-4">

					<div class="card m-3">

						<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-plus fa-2x"></span>
							<p>Login Here</p>
						</div>

						<div class="card-body">

							<form action="LoginServlet" method="post">
							
							<%
							Message msg = (Message) session.getAttribute("msg");
							if(msg != null) {
								
								%>
								
								<div class="alert <%= msg.getCssClass() %>" role="alert">
 								<%= msg.getContent() %>
</div>
								
								<%
							}
							
							session.removeAttribute("msg");
							%>
							
								<div class="mb-3">
									<label for="exampleInputEmail1" class="form-label">Email
										address</label>
										 <input name="email" required="required" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share
										your email with anyone else.</div>
								</div>
								<div class="mb-3">
									<label for="loginPassword" class="form-label">Password</label>
									<input name="password" required="required" type="password" class="form-control"
										id="loginPassword">
										<input  type="checkbox" onclick="togglePassword()">
												&nbsp; <span class="form-text">Show Password</span>
								</div>

								<div class="container text-center">
								 	<button onclick="login()" type="submit" class="btn btn-outline-primary">Submit</button>
								</div>
							</form>

						</div>

						<div class="card-footer"></div>

					</div>

				</div>

			</div>

		</div>

	</main>



	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>

	<script type="text/javascript" src="js/my.js"></script>
	
	<script type="text/javascript">
	
	function login() {
		sessionStorage.setItem("isLogin" , "hello");
	}
	
	function togglePassword() {
		var x = document.getElementById("loginPassword");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
	
	
	
	</script>
</body>
</html>