<%@ page contentType = "text/html; charset=UTF-8" %>
<!DOCTYPE html>
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
    request.setCharacterEncoding("UTF-8");
    
    Mdao mdao = new Mdao();
    Member m = mdao.mSelect(S_ID);
    System.out.println(S_ID);

    %>


    <table width = "70%" border="3">
        <tr>
            <td>아이디</td>
            <td><%= m.getRegular_id() %></td>
        <tr>
        <tr id="myText">
            <td>비밀번호</td>
            <td><%= m.getRegular_pw() %></td>
        <tr>
        <tr>
            <td>이름</td>
            <td><%= m.getRegular_name() %></td>
        <tr>
        <tr>
            <td>성별</td>
            <td><%= m.getRegular_gender() %></td>
        <tr>
        <tr>
            <td>휴대폰번호</td>
            <td><%= m.getRegular_phone() %></td>
        <tr>
        <tr>
            <td>이메일 주소</td>
            <td><%= m.getRegular_email() %></td>
        <tr>
        <tr>
            <td>주소</td>
            <td><%= m.getRegular_addr() %></td>
        <tr> 
        <tr>
            <td>가입일</td>
            <td><%= m.getRegular_reg_date() %></td>
        <tr>
        <tr>
            <td colspan="4"><a href="<%= request.getContextPath() %>/myPage/myPage_update_form.jsp?send_id=<%=m.getRegular_id()%>">수정하기</a>
            </td>
        </tr>
    </table>
    
    <%@ include file="/module/bottom.jsp" %>  
</html>