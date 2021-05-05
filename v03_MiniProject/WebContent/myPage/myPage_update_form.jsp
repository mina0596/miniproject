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
    <form action="<%= request.getContextPath() %>/myPage/myPage_update_action.jsp" method="post">
         <table width = "70%" border="3">
        <tr>
            <td>아이디</td>
             <td><input type="text" name="m_id" size="20" value = <%= m.getRegular_id() %> readonly="readonly"></td>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="m_pw" size="20" value=<%= m.getRegular_pw() %>></td>
        <tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="m_name" size="20" value=<%= m.getRegular_name() %>></td>
  
        <tr>
        <tr>
            <td>성별</td>
            <td>
         	남 <input name="regular_gender" type="radio" value="남"/>
       		여 <input name="regular_gender" type="radio" value="여"/>
            </td>
        <tr>
        <tr>
            <td>휴대폰번호</td>
            <td><input type="text" name="m_phone" size="20" value=<%= m.getRegular_phone() %>></td>
        <tr>
        <tr>
            <td>이메일 주소</td>
            <td><input type="text" name="m_email" size="20" value=<%= m.getRegular_email() %>></td>

        <tr>
        <tr>
            <td>주소</td>
           <td><input type="text" name="m_addr" size="20" value=<%= m.getRegular_addr() %>></td>
        <tr> 
        <tr>
            <td>가입일</td>
            <td><input type="date" name="m_reg_date" size="20" value=<%= m.getRegular_reg_date() %> readonly="readonly"></td>
        <tr>
        <tr>
            <td colspan="4"><a href="<%= request.getContextPath() %>/myPage/myPage_update_action.jsp?send_id=<%=m.getRegular_id()%>">수정완료</a>
            </td>
        </tr>
    </table> 
    </form>
 <%@ include file="/module/bottom.jsp" %>	   
         