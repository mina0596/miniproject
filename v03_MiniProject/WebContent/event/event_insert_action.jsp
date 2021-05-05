 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<!DOCTYPE html >
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
PreparedStatement pstmt_insert = null;
String event_code = request.getParameter("event_code");
String event_id =request.getParameter("event_id");
String event_cate = request.getParameter("event_cate");
String event_title = request.getParameter("event_title");
String event_content = request.getParameter("event_content");
String event_post_filecode = request.getParameter("event_post_filecode");

System.out.println(event_id +"<--event_id");
System.out.println(event_cate +"<--event_cate");
System.out.println(event_title +"<--event_title");
System.out.println(event_content +"<--event_content");
System.out.println(event_post_filecode +"<--event_post_filecode");
Class.forName("com.mysql.jdbc.Driver");
try{
	String jdbcDriver = "jdbc:mysql://localhost:3306/test?" +
			"useUnicode=true&characterEncoding=euckr";
	String dbUser = "testid";
	String dbPass = "testpw";
	conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(conn + "<-- conn");
	System.out.println(conn.getClass() + "<-- conn.getClass()");

	pstmt_insert = conn.prepareStatement("INSERT INTO event_board VALUES (?, ?, ?, ?, ?, ?, NOW())");
	pstmt_insert.setString(1, event_code);
	pstmt_insert.setString(2, event_id);
	pstmt_insert.setString(3, event_title);
	pstmt_insert.setString(4, event_cate);
	pstmt_insert.setString(5, event_content);
    pstmt_insert.setString(6, event_post_filecode);

	
int result = pstmt_insert.executeUpdate();
		System.out.println(result + "<-- result");
//04단계 :Query실행 끝
//05단계 :Query실행결과 사용 (insert의 경우 생략 가능단계)

	}finally{
		//06단계 :statement 또는 prepareStatement객체 종료(close())
		if (pstmt_insert != null) try { pstmt_insert.close(); } catch(SQLException ex) {}
		//07단계 :Connection 객체 종료(close())
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}

%>