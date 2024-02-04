package com.tect.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entity.Message;
import com.tech.blog.entity.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		PrintWriter out = response.getWriter();

		// fetch all data
		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
//		String gender = request.getParameter("gender");
		String about = request.getParameter("user_about");
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();

		// get user data from session

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("current_user");

		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
//		user.setGender(gender);
		user.setAbout(about);
		String oldProfile = user.getProfile();
		user.setProfile(imageName);

		// update database
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		boolean ans = dao.updateUser(user);

		if (ans) {

			String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();

			// delete file code
			String oldPath = request.getRealPath("/") + "pics" + File.separator + oldProfile;
			if (!oldPath.equals("default.png")) {
				Helper.deleteFile(oldPath);
			}

			if (Helper.saveFile(part.getInputStream(), path)) {
				out.println("Updated");

				Message msg = new Message("Profile Updated", "success", "alert-success");
				session.setAttribute("msg", msg);

			} else {
				Message msg = new Message("File not saved", "error", "alert-danger");
				session.setAttribute("msg", msg);
			}

		} else {
			Message msg = new Message("Something went wrong...", "error", "alert-danger");
			session.setAttribute("msg", msg);
		}

		response.sendRedirect("profile.jsp");
	}

}
