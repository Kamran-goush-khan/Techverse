<!DOCTYPE unspecified PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.tech.blog.entity.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entity.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>

	<div class="row">

<% 
	User u1 = (User) session.getAttribute("current_user");

 	PostDao dao = new PostDao(ConnectionProvider.getConnection());

	List<Post> list = new ArrayList<>();
	
	int catId = Integer.parseInt(request.getParameter("cId"));
	
	if(catId == 0) {
	list = dao.getAllPosts();		
	}
	else {
		list = dao.getPostByCatId(catId);
	}
	
	if(list.size() == 0) {
		out.println("<h3 class='display-3 text-center text-white'> No Post In This Category... </h3>");
	}
	
	
	for(Post p : list ) {
		
		 %>
		 
		 	<div class="col-md-6">
		 	
		 		<div class="card m-3">

						<div class="class-head">
							 <img src="post_pics/<%= p.getpPic() %>" class=" img-fluid" style="width : 100%; height:300px; object-fit : fill;">
						</div>		 		
		 			<div class="card-body">
		 				<strong> <%= p.getpTitle() %> </strong>
		 				<p> <%= p.getpContent() %> </p>
		 				
		 			</div>
		 			<div class="card-footer primary-background" style="display: flex; justify-content : space-between;">
		 			
		 			<div>
		 			<%
		 				LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
	
		 			%>
		 			
		 				<a href="#!" class="btn btn-outline-light btn-sm mr-1 "> <i id="liked-count" class="fa fa-solid fa-thumbs-o-up">  </i> <span class="liked-count"><%= ld.countLikeOnPost(p.getpId()) %></span> </a>
<!-- 		 				<a href="#!" class="btn btn-outline-light btn-sm ml-1"> <i class="fa fa-solid fa-commenting-o">  </i> <span>20</span> </a>
 -->		 			</div>
		 			
		 			<div>
		 				<a href="showBlogPage.jsp?post_id=<%= p.getpId() %>" class="btn btn-outline-light btn-sm">Read more...</a>
		 			</div>

		 			</div>
		 			
		 		</div>
		 	
		 	</div>
		 
		 <%
	}
%>

</div>