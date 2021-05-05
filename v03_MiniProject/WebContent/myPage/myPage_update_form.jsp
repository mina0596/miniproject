<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import = "kr.or.miniproject.dao.Mdao" %>
<%@ page import = "kr.or.miniproject.dto.Member" %>
<html lang="ko">
<head>
   
    <title>Fixed 1-column #2 layout (basic)</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resource/css/reset.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resource/css/style.css" media="screen" />
</head>
<body>
    <%@ include file="/module/top.jsp" %>		
    <%@ include file="/module/left.jsp" %>		 
   
<%	
    String send_id = request.getParameter("send_id");
    
    Mdao mdao = new Mdao();
    Member m = mdao.mSelect(S_ID);

%>
    <form action="<%= request.getContextPath() %>/myPage/myPage_update_action.jsp" method="post">
        
    </form>
     <table width = "70%" border="3">
         <tr>
             <td>아이디</td>
             <td><input type="text" name="m_id" size="20"></td>
         </tr>
         