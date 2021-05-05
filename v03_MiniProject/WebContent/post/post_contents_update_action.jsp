<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="kr.or.miniproject.driverdb.DriverDB" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String post_code = request.getParameter("post_code");
	String post_id = request.getParameter("post_id");
	System.out.println(post_code);
	System.out.println(post_id);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	DriverDB db = new DriverDB();
	
	conn = db.driverDbcon();
	System.out.println(conn + "<--conn post_contents_update.jsp");
	
	pstmt = conn.prepareStatement("UPDATE post	SET post_title=?,post_cate=?,post_content=?,post_reg_date=NOW() WHERE post_code=?");
	System.out.println(pstmt + "<--pstmt1 post_contents_update.jsp");
	
	pstmt.setString(1, )
%>