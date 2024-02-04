package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

	private Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean insertLike(int pId, int uId) {

		boolean f = false;

		try {

			String query = "insert into liked(pId , uId) values(? , ?)";

			PreparedStatement pstmt = this.con.prepareStatement(query);

			pstmt.setInt(1, pId);
			pstmt.setInt(2, uId);

			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public int countLikeOnPost(int pId) {

		int count = 0;

		try {

			String query = "select count(*) from liked where pId = ?";

			PreparedStatement pstmt = this.con.prepareStatement(query);

			pstmt.setInt(1, pId);

			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				count = set.getInt("count(*)");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	public boolean isLikedByUser(int pId, int uId) {
		boolean f = false;

		try {

			String query = "select * from liked where pId = ? and uId = ?";

			PreparedStatement pstmt = this.con.prepareStatement(query);

			pstmt.setInt(1, pId);
			pstmt.setInt(2, uId);

			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean deleteLike(int pId , int uId) {
		boolean f = false;

		try {

			String query = "delete from liked where pId = ? and uId = ?";

			PreparedStatement pstmt = this.con.prepareStatement(query);

			pstmt.setInt(1, pId);
			pstmt.setInt(2, uId);

			pstmt.executeUpdate();
			f = true;
	
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public int countUserLike(int userId) {
		
		int count = 0;
		
		try {
			
			String query = "select count(*) from liked where uId = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userId);
			
			ResultSet set = pstmt.executeQuery();
			
			if (set.next()) {
				count = set.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
}
