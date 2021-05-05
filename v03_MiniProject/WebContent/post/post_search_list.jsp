<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "kr.or.miniproject.dao.Pdao" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "kr.or.miniproject.dto.Post" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>육아 커뮤니티</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/css/style.css?var=1" media="screen" />
</head>
<body>
    <%@ include file="/module/top.jsp" %>		
    <%@ include file="/module/left.jsp" %>	
    <%@ include file = "/post/post_search_form.jsp" %>
<table>
	<thead>
		<tr>
			<th class="post_number">번호</th>
			<th class="post_cate">분류</th>
			<th class="post_title">제목</th>
			<th class="post_id">작성자</th>
			<th class="post_reg_date">작성일시</th>
		</tr>
	</thead>
<%
	request.setCharacterEncoding("UTF-8");
	String sk = request.getParameter("sk");
	String sv = request.getParameter("sv");
	System.out.println(sk + "<-- sk");
	System.out.println(sv + "<-- sv");
	
    Post p = new Post();
    Pdao post = new Pdao();
    ArrayList<Post> getAlm = new ArrayList<Post>();
	getAlm = post.pSearch(sk, sv);
	for(int i=0; i<getAlm.size(); i++){
		p = getAlm.get(i);
%>
<tbody>
<tr>
	<td class="post_number"><%= p.getPost_code()%></td>
	<td class="post_cate"><%= p.getPost_cate() %></td>
	<td class="post_title"><a href="<%= request.getContextPath()%>/post/post_contents_form.jsp?post_code=<%= p.getPost_code()%>"><%= p.getPost_title() %></a></td>
	<td class="post_id"><%= p.getPost_id() %></td>
	<td class="post_reg_date"><%= p.getPost_reg_date() %></td>
</tr>

<%
    }
%>

</tbody>
</table>   
    <form action="<%=request.getContextPath()%>/post/post_insert_form.jsp">
		<button type="submit">글쓰기</button>
	</form>
    <%@ include file="/module/bottom.jsp" %>  
    </html>