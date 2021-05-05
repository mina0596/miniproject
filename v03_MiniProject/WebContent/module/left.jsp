<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%	
    String S_LEVEL3 = (String)session.getAttribute("S_LEVEL");
%>
 <div id="leftColumn">
    <ul>
<%
    if(S_LEVEL3 == null){
%>
        <li><a id="left" href="<%= request.getContextPath() %>/insert/insert_form.jsp">회원등록</a></li>

<%
    }else if(S_LEVEL3.equals("firm") || S_LEVEL3.equals("regular")){
%>
        <li><a id="left" href="<%= request.getContextPath() %>/post/post_search_list.jsp">커뮤니티</a></li>
        <li><a id="left" href="<%= request.getContextPath() %>/event/event_list.jsp">이벤트</a></li>
        <li><a id="left" href="<%= request.getContextPath() %>/myPage/myPage_first_page.jsp">마이페이지</a></li>
<%
    }else if(S_LEVEL3.equals("admin")){
%>
        <li><a id="left" href="#">회원등록</a></li>   
        <li><a id="left" href="<%= request.getContextPath() %>/post/post_search_list.jsp">커뮤니티</a></li>
        <li><a id="left" href="<%= request.getContextPath() %>/event/event_list.jsp">이벤트</a></li>
        <li><a id="left" href="<%= request.getContextPath() %>/myPage/myPage_first_page.jsp">마이페이지</a></li>
<%} %>
    </ul>
  </div>
  <!--//end #leftColumn//-->
<div id="centerColumn">