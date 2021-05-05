<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%	
    String S_ID = (String)session.getAttribute("S_ID");
    String S_NAME = (String)session.getAttribute("S_NAME");
    String S_GRADE = (String)session.getAttribute("S_GRADE");
    String S_LEVEL = (String)session.getAttribute("S_LEVEL");
%>
<div id="container">
  <div id="header">
    <h1 style="color:#417556;">육아 커뮤니티</h1>
<%
    if(S_LEVEL == null){
%>
<div id="login"> 
    <form method="post" action="<%= request.getContextPath() %>/login/login_action.jsp">         
        <select class="select_class" name=level>
            <option value="regular">회원</option>
            <option value="firm">기업</option>
            <option value="admin">관리자</option>
        </select>
        <input class="login" name="id" type="text" placeholder="아이디" />
        <input class="login" name="pw" type="password" placeholder="비밀번호" />
        <input class="login" type="submit" value="로그인" />     
        </form>
        </div>
<%
      }else{
%>
    <span><%= S_NAME %>님 환영합니다. </span>
    <a href="<%= request.getContextPath() %>/login/logout.jsp">로그아웃</a>
<%          
      }
%>
  </div>
  <!--//end #header//-->