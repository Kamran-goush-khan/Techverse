<%@page errorPage="Error_page.jsp"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entity.User"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entity.Post"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User user1 = (User) session.getAttribute("current_user");
%>
<%
PostDao pDao2 = new PostDao(ConnectionProvider.getConnection());
%>

<!DOCTYPE html>
<html>
<head>

</head>
<body>

	<%
	List<Post> nl = new ArrayList<Post>();
	nl = pDao2.getByUserId(user1.getId());
	if (nl.size() == 0) {
		out.println("<h3 class='display-3 text-center text-white'> You have not posted anything till now...</h3>");
	}
	%>
	<div class="row">

		<%
		for (Post p : nl) {
		%>

		<div class="col-md-6">

			<div class="card m-3">

				<div class="class-head">
					<img src="post_pics/<%=p.getpPic()%>" class=" img-fluid"
						style="width: 100%; height: 300px; object-fit: fill;">
				</div>
				<div class="card-body">
					<strong> <%=p.getpTitle()%>
					</strong>
					<p>
						<%=p.getpContent()%>
					</p>

				</div>
				<div class="card-footer primary-background"
					style="display: flex; justify-content: space-between;">

					<div>
						<%
						LikeDao ld1 = new LikeDao(ConnectionProvider.getConnection());
						%>

						<a href="#!" class="btn btn-outline-light btn-sm mr-1 "> <i
							id="liked-count" class="fa fa-solid fa-thumbs-o-up"> </i> <span
							class="liked-count"><%=ld1.countLikeOnPost(p.getpId())%></span>
						</a>
						<!-- 		 				<a href="#!" class="btn btn-outline-light btn-sm ml-1"> <i class="fa fa-solid fa-commenting-o">  </i> <span>20</span> </a>
					 -->
					</div>

					<div
						style="display: flex; justify-content: space-around; padding-left: 2px;">
						<a href="showBlogPage.jsp?post_id=<%=p.getpId()%>"
							class="btn btn-outline-light btn-sm">Read more...</a>
						<form onsubmit="submitDeleteformHandler()"
							action="DeletePostServlet" method="post">
							<input type="hidden" name="deletePostId"
								value="<%=p.getpId()%>">
							<button type="sumbit" class="btn btn-outline-light btn-sm mx-1">Delete
								Post</button>
						</form>
					</div>


				</div>

			</div>

		</div>

		<%
		}
		%>

	</div>

	<%

	%>

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

	<script type="text/javascript">
		$(document).ready(function() {
			function submitDeleteformHandler(event) {
				console.log('hello');
				event.preventDefault();
			}
		})
	</script>

</body>
</html>