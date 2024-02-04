<%@page errorPage="Error_page.jsp"%>
<%@page import="com.tech.blog.entity.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User user = (User) session.getAttribute("current_user");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>
<%
 PostDao pDao1 = new PostDao(ConnectionProvider.getConnection());
%>
<%
 LikeDao lDao = new LikeDao(ConnectionProvider.getConnection());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=user.getName()%></title>
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

body {
	background-image: url("img/bg2.jpg");
	background-attachment: fixed;
	background-size: cover;
}
</style>
</head>
<body>

	<!-- start of navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><img
				src="pics/techverse.png"
				style="width: 120px; position: relative; height: 23px; margin-bottom: 2px;">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="profile.jsp"> <span
							class="fa fa-bell-o"></span> All Post
					</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="Mypost.jsp"> <span class="fa fa-address-card"></span> My
							Post
					</a></li>
					<li class="nav-item" data-bs-toggle="modal"
						data-bs-target="#doPost"><a class="nav-link active" href="#">
							<i class="fa-solid fa-pen-nib"></i> Do Post
					</a></li>



				</ul>
				<ul class="navbar-nav me-right mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active" href="#!"
						data-bs-toggle="modal" data-bs-target="#profile_modal"> <span
							class="fa fa-user-circle"></span> <%=user.getName()%>
					</a></li>

					<li onclick="logout()" class="nav-item"><a
						class="nav-link active" href="LogoutServlet"> <span
							class="fa fa-user-o"></span> Logout
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- end of navbar -->

	<!-- main content of the body -->

	<div class="container mt-5">
		<div class="row">
			<div class="col-md-3 text-white text-center" style="font-size: 20px;">
				<img src="pics/<%=user.getProfile()%>"
					style="height: 150px; border-radius: 50%" />
				<p><%= user.getName() %>
				<br>
				<%= user.getEmail() %>
				<br>
				Number of Post : <%= pDao1.getPostCount(user.getId()) %>
				<br>
				Number of Post Like : <%= lDao.countUserLike(user.getId()) %>
				</p>
				
			</div>
			
			<div class="offset-md-1 col-md-8">
					<!-- show post -->
						<%@include file="my_load_post.jsp" %>
				</div>
		</div>
	</div>

	<!-- end of the main content of the body -->


	<!-- start of profile modal -->



	<!-- Modal -->
	<div class="modal fade" id="profile_modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h1 class="modal-title fs-5 " id="exampleModalLabel">TechBlog
					</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>"
							style="height: 150px; border-radius: 50%" />
						<h1 class="modal-title fs-5 " id="exampleModalLabel">
							<%=user.getName()%>
						</h1>

						<!-- user detail -->

						<div id="profile-detail">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getDateTime().toLocaleString()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- end of user detail -->

						<!-- profile edit -->

						<div id="profile-edit" style="display: none;">
							<h3 class="mt-3">Edit Here</h3>

							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Name :</th>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>" /></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>" /></td>
									</tr>
									<tr>
										<th scope="row">Password :</th>
										<td><input id="password" type="password"
											class="form-control" name="user_password"
											value="<%=user.getPassword()%>" />
											<div class="container text-left">
												<input type="checkbox" onclick="myFunction()">
												&nbsp; Show Password
											</div></td>
									</tr>
									<tr>

										<th scope="row">Gender :</th>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<th scope="row">About :</th>
										<td><textarea class="form-control" name="user_about"
												rows="4"><%=user.getAbout()%>
				</textarea></td>
									</tr>
									<tr>
										<th scope="row">Select Profile Picuture :</th>
										<td><input type="file" class="form-control" name="image"
											value="<%=user.getProfile()%>"></td>
									</tr>

								</table>

								<div class="container text-center">
									<button id="profile-edit-button" type="submit"
										class="btn btn-large btn-outline-primary">Confirm</button>
								</div>
							</form>
						</div>

					</div>
					<!-- end of profile edit -->

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-outline-primary">Edit Details</button>
				</div>
			</div>
		</div>
	</div>

	<!-- end of profile modal  -->


	<!-- start of post modal  -->


	<!-- Modal -->
	<div class="modal fade" id="doPost" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h1 class="modal-title fs-5 " id="exampleModalLabel">Provide
						Post Detail</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="AddPostServlet" method="post">



						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected="selected" disabled="disabled">---Select
									Category---</option>

								<%
								PostDao pDao = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = pDao.getAllCategories();

								for (Category c : list) {
								%>

								<option value="<%=c.getcId()%>">
									<%=c.getName()%>
								</option>
								<%
								}
								%>

							</select>
						</div>

						<div class="form-group mt-2">
							<input name="pTitle" type="text" placeholder="Enter post title"
								class="form-control" required="required">
						</div>

						<div class="form-group mt-2">
							<textarea name="pContent" class="form-control"
								placeholder="Enter your content" style="height: 150px" required="required"></textarea>
						</div>

						<div class="form-group mt-2">
							<textarea name="pCode" class="form-control"
								placeholder="Enter your program (if any)" style="height: 150px"></textarea>
						</div>

						<div class="form-group mt-2">
							<label>Select your picture : </label> <br> <input name="pic"
								type="file">
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-outline-primary">POST</button>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>

	<!-- end of post modal -->


	<script src="https://code.jquery.com/jquery-3.6.4.min.js"
		integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8="
		crossorigin="anonymous"></script>

	<script src="https://kit.fontawesome.com/0969aeb027.js"
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

	<script type="text/javascript" src="js/my.js"></script>



	<script type="text/javascript">
	

	
	function logout() {
		sessionStorage.removeItem("isLogin");
	}
	
	
	setInterval(() => {
		if(sessionStorage.getItem("isLogin") === null){
			window.location.href = "login_page.jsp";
		}
	}, 1000);
	
		let editStatus = false;

		$(document).ready(function() {
			
			
			
			$('#edit-profile-button').click(function() {

				if (!editStatus) {
					$('#profile-detail').hide();
					$('#profile-edit').show();
					$('#edit-profile-button').text('Back');
					editStatus = !editStatus;
				} else {
					$('#profile-detail').show();
					$('#profile-edit').hide();
					$('#edit-profile-button').text('Edit Details');
					editStatus = !editStatus;
				}
			})
			
			
		});

		function myFunction() {
			var x = document.getElementById("password");
			if (x.type === "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}
	</script>

	<!-- now add post js -->
	<script type="text/javascript">
		$(document).ready(function(e) {
			$('#add-post-form').on('submit', function(event) {
				// this event is called when form is submitted

				event.preventDefault();
				console.log('You have submitted the form');

				let form = new FormData(this);

				// now requesting to server

				$.ajax({
					url : 'AddPostServlet',
					method : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						//success
						console.log('hello');

						if (data.trim() === 'done') {
							Swal.fire({
								position : 'top-end',
								icon : 'success',
								title : 'Your work has been saved',
								showConfirmButton : false,
								timer : 1500
							})
						}

						else {
							Swal.fire({
								icon : 'error',
								title : 'Oops...',
								text : 'Something went wrong!',
							})
						}
							setTimeout(() => {
								window.location.reload();
							}, 2000);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						// error
						Swal.fire({
							icon : 'error',
							title : 'Oops...',
							text : 'Something went wrong!',
						})
					},

					processData : false,
					contentType : false,
				})
			})
		})


	</script>

	<!-- loading post -->
	<script type="text/javascript">
	
	function  getPosts(catId , temp) {
		
		$('#mypost-loader').show();
		$('#mypost-container').hide();
		
		$('.c-link').removeClass('active');
		
		$.ajax({
			url : 'myLoadPost.jsp',
			method : 'get',
			success : function(data , textStatus , jqXHR) {
			/* 	console.log(data); */
				$('#mypost-loader').hide();
				$('#mypost-container').show();
				$('#mypost-container').html(data);
				$(temp).addClass('active');
			},
			error : function(jqXHR , textStatus , errorThrown) {
				
			},
		})
	}
	
	$(document).ready(function(e) {
	
		let allPostRef = $('.c-link')[0];
		getPosts(0 , allPostRef);
		
	})
	
	</script>



</body>
</html>