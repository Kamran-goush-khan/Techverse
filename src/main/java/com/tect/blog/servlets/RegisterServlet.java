package com.tect.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.x.protobuf.MysqlxCursor.Fetch;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entity.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
//		Fetch all form data
		
		PrintWriter out = response.getWriter();
		
		String check = request.getParameter("check");
		
		if (check == null) {
			out.println("Please check the box");
		}
		else {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");
			
			//checking whether emial is ending with @gmail.com
			if(!email.endsWith("@gmail.com")) {
				out.println("Email should be end with @gmail.com");
				return;
			}
			
			if(password.trim().length() <= 6) {
				out.println("Your Password should be atleast 7 character long");
				return;
			}
			
			if (name.trim().length() <= 0) {
				out.println("Name cannot be empty");
				return;
			}
			
			if(gender == null) {
				out.println("Please select Gender");
				return;
			}
			
			// creating user object
			User user = new User(name , email , password , gender , about);
			
			// create user dao object 
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			
			if(dao.saveUser(user)) {
				out.println("done");
			}
			else {
				out.println("error");
			}
		}
	}

}
