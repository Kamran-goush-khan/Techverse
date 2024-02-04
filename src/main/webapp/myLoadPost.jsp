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

				<div>
					<a href="showBlogPage.jsp?post_id=<%=p.getpId()%>"
						class="btn btn-outline-light btn-sm">Read more...</a>
				</div>
				<form action="deletePostServlet" method="post">
				 <input type="hidden" value="<%= p.getpId() %>">
				 <button type="submit" class="">Delete Post</button>
				</form>

			</div>

		</div>

	</div>

	<%
	}
	%>

</div>

<%

%>