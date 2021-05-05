<%@page import="java.sql.ResultSet"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "kr.or.miniproject.driverdb.DriverDB" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<html>
<head>
<meta charset="UTF-8">
   <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resource/css/reset.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resource/css/style.css" media="screen" />
<title>육아 커뮤니티</title>
</head>
<body>
    <%@ include file="/module/top.jsp" %>		
    <%@ include file="/module/left.jsp" %>	
	
<% 
		String post_code = request.getParameter("post_code");
		System.out.println(post_code + "<--post_code post_search_list.jsp");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DriverDB db = new DriverDB();
		conn = db.driverDbcon();
		System.out.println(conn + "<-- conn post_search_list.jsp");
		pstmt = conn.prepareStatement("SELECT post_title, post_cate, post_id, post_reg_date, post_content, post_like, post_view_num FROM post WHERE post_code = ?");
		pstmt.setString(1, post_code);
		System.out.println(pstmt + "<-- pstmt post_search_list.jsp ");
		
		rs = pstmt.executeQuery();
		System.out.println(rs + "<-- rs post_search_list.jsp");
		
		if(rs.next()){
%>
	<h2><%= rs.getString("post_title") %></h2>
    <div>
    	<small>
    		분류 : <%= rs.getString("post_cate") %> 
    		작성자 : <%= rs.getString("post_id") %> 
    		작성일 : <%= rs.getString("post_reg_date") %>
    		조회수 : <%= rs.getString("post_view_num") %>
    		좋아요 : <%= rs.getString("post_like") %>
    	</small>
    </div>
    <div class="content">
    	<span><%= rs.getString("post_content") %>
    	</span>
    </div>
    <button type="button" onclick="back();">목록</button>
    
<%@ include file="/module/bottom.jsp" %>

<script type="text/javascript">
    function back(){
        history.back(1);
    } 
</script>
<%			
	}
%>
	

	
</body>
    <%@ include file="/module/bottom.jsp" %> 
</html>