<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.or.miniproject.dao.Edao" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title>Fixed 1-column #2 layout (basic)</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/css/style.css" media="screen" />
</head>
<body>
 <%@ include file="/module/top.jsp" %>	
 <%@ include file="/module/left.jsp" %>	
<form method="post" action="<%= request.getContextPath() %>/event/event_search_list.jsp" accept-charset="utf-8">
    <select name="searchKey">
        <option value="event_title">제목</option>
        <option value="event_id">작성자</option>
    </select>
    <input name="searchValue" type="text"/>    
    <input type="submit" value="검색"/>
</form>
<table>
<thead>
    <tr>
        <th class="event_number">번호</th>
        <th class="event_cate">분류</th>
        <th class="event_title">제목</th>
        <th class="event_id">작성자</th>
        <th class="event_reg_date">작성일시</th>
    </tr>
</thead>
<tbody>
<% 
    ArrayList<String[]> getEventSearch = new ArrayList<String[]>();
    
    Edao edao = new Edao();

    getEventSearch = edao.mEventSearch("event_title", "");
        
    for(int i = 0; i < getEventSearch.size(); i++){
%>
    <tr>
        <td class="event_number"><%= getEventSearch.get(i)[0] %></td>
        <td class="event_cate"><%= getEventSearch.get(i)[1] %></td>
        <td class="event_title"><a href="<%= request.getContextPath() %>/event/event_contents_form.jsp?event_code=event<%= getEventSearch.get(i)[0] %>"><%= getEventSearch.get(i)[2] %></a></td>
        <td class="event_id"><%= getEventSearch.get(i)[3] %></td>
        <td class="event_reg_date"><%= getEventSearch.get(i)[4] %></td>
    </tr>
<%
    }
%>
</tbody>
</table>
    
 <%@ include file="/module/bottom.jsp" %>  
</body>
</html>