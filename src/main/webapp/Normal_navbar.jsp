<%@page errorPage="Error_page.jsp"%>

<%@page import="com.tech.blog.entity.User"%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><img
			src="pics/techverse.png"
			style="width: 120px; position: relative; height: 23px; margin-bottom: 2px;">
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
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

				<%
				User user = (User) session.getAttribute("current_user");
				if (user != null) {
				%>

				<li class="nav-item"><a class="nav-link active"
					href="Mypost.jsp"> <span class="fa fa-address-card"></span> My
						Post
				</a></li>

				<!-- <li class="nav-item" data-bs-toggle="modal" data-bs-target="#doPost"><a
					class="nav-link active" href="#"> <i
						class="fa-solid fa-pen-nib"></i> Do Post
				</a></li> -->

				<%
				}
				%>

				<%
				if (user == null) {
				%>

				<li class="nav-item"><a class="nav-link" href="login_page.jsp">
						<span class="fa fa-user-o"></span> Login
				</a></li>

				<li class="nav-item"><a class="nav-link"
					href="register_page.jsp"> <span class="fa fa-user-plus"></span>
						Sign up
				</a></li>

				<%
				}
				%>
			</ul>

			<%
			if (user != null) {
			%>
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
			<%
			}
			%>

		</div>
	</div>
</nav>