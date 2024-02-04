package com.tech.blog.dao;

import java.sql.*;

import com.tech.blog.entity.User;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

	// method to insert user to database

	boolean flag = false;

	public boolean saveUser(User user) {

		try {

			String queries = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";

			PreparedStatement pstmt = this.con.prepareStatement(queries);

			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());

			pstmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public User getUserByEmailAndPassword(String email , String password) {
		User user = null;
		
		try {
			String query = "select * from user where email = ? and password = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
			
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setName(rs.getString("name"));
				user.setId(rs.getInt("id"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

	public boolean updateUser(User user) {
		
		boolean f = false;
		
		try {
			
			String query = "update user set name = ? , email = ? , password = ? , gender = ? , about = ? , profile = ? where id = ?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			pstmt.setString(6, user.getProfile());
			pstmt.setInt(7, user.getId());
			
			pstmt.executeUpdate();
			f = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	public User getUserByUserId(int UserId) {
		User user = null;
		
		try {
			
			String query = "select * from user where id = ?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, UserId);
			
			ResultSet set = pstmt.executeQuery();
			
			if(set.next()) {
				user = new User();
				
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setName(set.getString("name"));
				user.setId(set.getInt("id"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
}
