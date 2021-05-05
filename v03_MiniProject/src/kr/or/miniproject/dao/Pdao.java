package kr.or.miniproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.miniproject.driverdb.DriverDB;
import kr.or.miniproject.dto.Post;
import kr.or.miniproject.dto.Member;

public class Pdao {
	ArrayList<Post> alm = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	

//게시판 글
	public Post mPostContents (String post_code) throws SQLException, ClassNotFoundException {
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		
		pstmt = conn.prepareStatement("SELECT post_title, post_cate, post_id, post_reg_date, post_like, post_view_num FROM post WHERE post_code = ?");
		pstmt.setString(1, post_code);
		System.out.println(pstmt + "<--pstmt mPostContents Pdao");
		rs = pstmt.executeQuery();
		System.out.println(rs + "<--rs mPostContents Pdao");
		return null;


	}
	
//게시판 첫페이지 검색
    public ArrayList<Post> pSearch(String sk, String sv) throws ClassNotFoundException, SQLException{
		System.out.println(sk + sv + "이벤트 페이지 검색");
		alm = new ArrayList<Post>();
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		String selectQuery = "select * from post";
		if(sk == null & sv == null){
			System.out.println("sk, sv 둘다 null");
			pstmt = conn.prepareStatement(selectQuery);
		}else if(sk != null & sv.equals("")){
			System.out.println("sk null sv 공백");
			pstmt = conn.prepareStatement(selectQuery);
		}else if(sk != null & sv != null){
			System.out.println("sk,sv 둘다 null 아님");
			pstmt = conn.prepareStatement(selectQuery+" WHERE "+sk+"=?");
			pstmt.setString(1, sv);
		}
		System.out.println(pstmt + "<-- pstmt");
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Post p = new Post();
			p.setPost_code(rs.getString("post_code"));
			p.setPost_title(rs.getString("post_title"));;
			p.setPost_cate(rs.getString("post_cate"));;
			p.setPost_id(rs.getString("post_id"));;
			alm.add(p);
			System.out.println(alm + "<-- alm pSearch Mdao.java");
		}
		pstmt.close();
		rs.close();
		conn.close();
		
		return alm;
    }
}