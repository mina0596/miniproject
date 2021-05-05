<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "kr.or.miniproject.dao.Mdao" %>
<html lang="ko">
<head>
   
    <title>Fixed 1-column #2 layout (basic)</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resource/css/reset.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resource/css/style.css" media="screen" />
</head>
<body>
    <%@ include file="/module/top.jsp" %>		
    <%@ include file="/module/left.jsp" %>		 
<%	request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="m" class="kr.or.miniproject.dto.Member"/>
<jsp:setProperty name="m" property="*"/>
<%
Mdao mdao = new Mdao();
mdao.mUpdate(m);
response.sendRedirect(request.getContextPath()+"/myPage/myPage_first_page.jsp");
%>

 <%@ include file="/module/bottom.jsp" %>	 