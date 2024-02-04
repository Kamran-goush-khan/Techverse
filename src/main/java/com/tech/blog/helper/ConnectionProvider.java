package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {

	private static Connection con;

	public static Connection getConnection() {
			
			try {

				if (con == null) {
					
					// driver class loader
					Class.forName("com.mysql.cj.jdbc.Driver");
					
					//create a connection
					con = DriverManager.getConnection("jdbc:mysql://localhost:5555/techblog","root","@123-123@");
				}
				
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			
			return con;
		}
}