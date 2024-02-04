<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="Error_page.jsp"%>
<%@ page import="java.sql.*"%>
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
<script src="https://kit.fontawesome.com/0969aeb027.js"
	crossorigin="anonymous"></script>
</head>
<body>

	<!-- navbar -->
	<%@ include file="Normal_navbar.jsp"%>


	<!-- banner -->

	<div class="container-fluid p-0 m-0 pb-5 ">
		<div class="jumbotron primary-background text-white banner-design">
			<div class="container pb-5">
				<h3 class="display-3">Welcome, Friends to TechVerse</h3>

				<p>Welcome to technical blog, world of technology A programming
					language is a system of notation for writing computer programs.
					Most programming languages are text-based formal languages, but
					they may also be graphical. They are a kind of computer language.</p>

				<p>The description of a programming language is usually split
					into the two components of syntax (form) and semantics (meaning),
					which are usually defined by a formal language.</p>

				<a class="btn btn-outline-light btn-lg m-1"> <span
					class="	fa fa-bolt"></span> Start, it's free
				</a> <a href="profile.jsp" class="btn btn-outline-light btn-lg"> <span><i
						class="fa-solid fa-p fa-spin"></i></span> See Post
				</a>
			</div>
		</div>


	</div>

	<!-- Creating Card  -->

	<div class="container">

		<div class="row mb-4">

			<div class="col-md-4 mb-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java Programming</h5>
						<p class="card-text">It is a versatile, object-oriented
							language. It's platform-independent, widely used for web, mobile,
							and enterprise applications due to its robustness
							and portability.</p>
						<a href="#" class="btn primary-background text-white">Read
							More...</a>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">C/C++ Programming</h5>
						<p class="card-text">C/C++ are powerful, low-level programming
							languages. C is procedural, C++ is object-oriented, both used in
							system-level and performance-critical applications.</p>
						<a href="#" class="btn primary-background text-white">Read
							More...</a>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">AI/ML</h5>
						<p class="card-text">Artificial Intelligence makes machines
							smart like humans. Machine Learning, a subset of AI, enables
							machines to learn and improve through experiences, akin to human
							practice.</p>
						<a href="#" class="btn primary-background text-white">Read
							More...</a>
					</div>
				</div>
			</div>

		</div>

		<div class="row">

			<div class="col-md-4 mb-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Python Programming</h5>
						<p class="card-text">Python is a versatile, high-level
							programming language known for its simplicity, readability, and
							wide applicability in web development, scientific computing,
							automation, and AI.</p>
						<a href="#" class="btn primary-background text-white">Read
							More...</a>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Web development</h5>
						<p class="card-text">Creating, maintaining websites or
							applications. Involves design, coding, and optimization for
							online platforms, enabling user interaction and functionality.</p>
						<a href="#" class="btn primary-background text-white">Read
							More...</a>
					</div>
				</div>
			</div>

			<div class="col-md-4 mb-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Database Programming</h5>
						<p class="card-text">Database programming is crafting digital
							systems to store and manage data effectively, ensuring
							information is organized, accessible, and secure for applications
							and users.</p>
						<a href="#" class="btn primary-background text-white">Read
							More...</a>
					</div>
				</div>
			</div>

		</div>



	</div>


	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>

	<script type="text/javascript" src="js/my.js"></script>
</body>
</html>