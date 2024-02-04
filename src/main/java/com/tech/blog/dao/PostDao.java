package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entity.Category;
import com.tech.blog.entity.Post;

public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>(); // Initialize the ArrayList

		try {
			String query = "Select * from categories";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				int cid = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");
				Category c = new Category(cid, name, description);
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean savePost(Post post) {
		boolean flag = false;

		try {

			String query = "insert into post(pTitle , pContent , pCode , pPic , catId , userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setString(1, post.getpTitle());
			pstmt.setString(2, post.getpContent());
			pstmt.setString(3, post.getpCode());
			pstmt.setString(4, post.getpPic());
			pstmt.setInt(5, post.getCatId());
			pstmt.setInt(6, post.getUserId());

			pstmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

	public List<Post> getAllPosts() {
		List<Post> list = new ArrayList<Post>();

		try {
			// fetch all posts

			String query = "Select * from post order by pid";

			PreparedStatement pstmt = con.prepareStatement(query);

			ResultSet set = pstmt.executeQuery();

			while (set.next()) {
				int pId = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");

				Post p = new Post(pId, pTitle, pContent, pCode, pPic, date, catId, userId);
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Post> getPostByCatId(int catId) {
		List<Post> list = new ArrayList<Post>();

		try {
			// fetch all posts

			String query = "Select * from post where catId = ?";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, catId);

			ResultSet set = pstmt.executeQuery();

			while (set.next()) {
				int pId = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int userId = set.getInt("userId");

				Post p = new Post(pId, pTitle, pContent, pCode, pPic, date, catId, userId);
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Post getPostById(int postId) {

		Post p = null;

		try {
			String query = "select * from post where pid = ?";

			PreparedStatement pstmt = this.con.prepareStatement(query);

			pstmt.setInt(1, postId);

			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				int pId = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");

				p = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;
	}

	public int getPostCount(int userId) {

		int count = 0;

		try {

			String q = "select count(*) from post where userId = ?";
			PreparedStatement pstmt = con.prepareStatement(q);

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

	public List<Post> getByUserId(int uId) {

		List<Post> list = new ArrayList<Post>();

		try {

			String query = "select * from post where userId = ?";
			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, uId);

			ResultSet set = pstmt.executeQuery();

			while (set.next()) {
				int pId = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int catId = set.getInt("catId");
				int userId = set.getInt("userId");

				Post p = new Post(pId, pTitle, pContent, pCode, pPic, date, catId, userId);
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public boolean deletePostByPostId(int pid) {
		boolean f = false;
		
		try {
			
			String query = "delete from post where pid = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, pid);
			pstmt.executeUpdate();
			f = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

}
