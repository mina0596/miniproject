<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.or.miniproject.dao.Edao" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Fixed 1-column #2 layout (basic)</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/css/style.css" media="screen" />
</head>
<body>
<%	
    String event_code = request.getParameter("event_code");

    Edao edao = new Edao();

    String getEventContents[] = edao.mEventContents(event_code);
%>
<%@ include file="/module/top.jsp" %>	
<%@ include file="/module/left.jsp" %>	
    <h2><%= getEventContents[1] %></h2>
    <div><small>분류 : <%= getEventContents[2] %> 작성자 : <%= getEventContents[0] %> 작성일 : <%= getEventContents[4] %></small></div>
    <div class="content"><span><%= getEventContents[3] %></span></div>
    <button type="button" onclick="back();">목록</button>
<%@ include file="/module/bottom.jsp" %>
<script type="text/javascript">
    function back(){
        history.back(1);
    } 
</script>
</body>
</html>