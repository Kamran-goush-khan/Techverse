<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entity.Message"%>
<%@page import="com.tech.blog.entity.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="Error_page.jsp"%>

<%
User user = (User) session.getAttribute("current_user");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>
<%
int postId = Integer.parseInt(request.getParameter("post_id"));

PostDao dao = new PostDao(ConnectionProvider.getConnection());
Post post = dao.getPostById(postId);
%>

<%
UserDao ud = new UserDao(ConnectionProvider.getConnection());
User u = (User) ud.getUserByUserId(post.getUserId());
%>
<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#">
<head>
<meta charset="ISO-8859-1">
<meta property="fb:app_id" content="xxxxx" />
<meta property="fb:admins" content="xxx" />
<meta property="og:url" content="URL" />
<meta property="og:title" content="TITLE" />
<meta property="og:description" content="DESC" />
<meta property="og:image" content="IMG" />
<title><%=post.getpTitle()%></title>
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

.post-title {
	font-size: 36px;
	font-weight: 400;
	margin-bottom: 10px;
}

.post-content {
	font-weight: 100;
	font-size: 24px;
}

.post-user-info {
	font-style: italic;
	font-weight: bold;
}

.post-date {
	font-weight: bold;
}

body {
	background-image: url("img/bg2.jpg");
	background-attachment: fixed;
	background-size: cover;
}
</style>



</head>
<body>

	<div id="fb-root"></div>
	<script async defer crossorigin="anonymous"
		src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v18.0"
		nonce="LectRwaM"></script>

	<!-- start of navbar -->


	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"> <img
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

					<li class="nav-item"><a class="nav-link active" href="Mypost.jsp">
							<span class="fa fa-address-card"></span> My Post
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
						class="nav-link active	" href="LogoutServlet"> <span
							class="fa fa-user-o"></span> Logout
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- end of navbar -->

	<!-- main content of the body -->

	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header primary-background text-white">

						<h4 class="post-title">
							<%=post.getpTitle()%></h4>

					</div>



					<div class="card-body">

						<img src="post_pics/<%=post.getpPic()%>"
							class=" img-fluid my-2 p-3" style="object-fit: fill;">

						<div class="row">
							<div class="col-md-8">
								<p class="post-user-info">
									<i><a data-bs-toggle="modal" data-bs-target="#user_modal"
										href="#!"><%=u.getName()%>,</a> has posted </i>
								</p>
							</div>

							<div class="col-md-4">
								<p class="post-date">
									<i><%=post.getpDate().toLocaleString()%></i>
								</p>
							</div>
						</div>

						<p class="post-content">
							<%=post.getpContent()%>
						</p>
						<br> <br>
						<div class="post-code">
							<pre><%=post.getpCode()%></pre>
						</div>


					</div>

					<div class="card-footer primary-background"
						style="display: flex; justify-content: space-between;">

						<div>

							<%
							LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
							%>

							<a onclick="doLike(<%=post.getpId()%> , <%=user.getId()%>)"
								href="#!" class="btn btn-outline-light btn-sm mr-1"> <i
								id="liked-count" class="fa fa-solid fa-thumbs-o-up"> </i> <span
								class="liked-count"><%=ld.countLikeOnPost(post.getpId())%></span>
							</a> <a onclick="toggleComment()" href="#!"
								class="btn btn-outline-light btn-sm ml-1"> <i
								class="fa fa-solid fa-commenting-o"> </i> <span
								class="fb-comments-count"
								data-href="https://kamran-goush-khan.github.io/KBC?post_id=<%=post.getpId()%>"></span>
							</a>


						</div>
					</div>

					<div id="comment-section" class="card-footer">
						<div class="fb-comments"
							data-href="https://kamran-goush-khan.github.io/KBC?post_id=<%=post.getpId()%>"
							data-width="" data-numposts="5"></div>
					</div>
				</div>
			</div>
		</div>


		<!-- end of main content of the body -->

		<%
		Message msg = (Message) session.getAttribute("msg");
		if (msg != null) {
		%>

		<div class="alert <%=msg.getCssClass()%>" role="alert">
			<%=msg.getContent()%>
		</div>

		<%
		}

		session.removeAttribute("msg");
		%>

		<!-- start of user model -->



		<!-- Modal -->
		<div class="modal fade" id="user_modal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header primary-background text-white">
						<h1 class="modal-title fs-5" id="exampleModalLabel">About
							Author</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">

						<div class="container text-center">
							<img src="pics/<%=u.getProfile()%>"
								style="height: 150px; border-radius: 50%" />
							<h1 class="modal-title fs-5 " id="exampleModalLabel">
								<%=u.getName()%>
							</h1>

							<table class="table mt-2">
								<tbody>
									<tr>
										<th scope="row">Email :</th>
										<td><%=u.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Status :</th>
										<td><%=u.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Number of Post :</th>
										<td><%= dao.getPostCount(u.getId()) %></td>
									</tr>
								</tbody>
							</table>

						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-outline-primary btn-large"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


		<!-- end of user model -->


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
										<button type="submit"
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
									<option value="0" selected="selected" disabled="disabled">---Select
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
								<label>Select your picture : </label> <br> <input
									name="pic" type="file">
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
		
		$('#comment-section').hide();
		
		function toggleComment() {
			$('#comment-section').toggle();
		}

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
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						//success

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

		<script type="text/javascript">
	
	function logout() {
		sessionStorage.removeItem("isLogin");
	}
	
	setInterval(() => {
		if(sessionStorage.getItem("isLogin") === null){
			window.location.href = "login_page.jsp";
		}
	}, 100);
	
	</script>
</body>
</html>