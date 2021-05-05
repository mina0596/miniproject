<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.miniproject.dao.Mdao" %>
<!DOCTYPE html>
<% 
    request.setCharacterEncoding("UTF-8");

    String get_id = request.getParameter("regular_id");

    Mdao mdao = new Mdao();

    boolean getCheck = mdao.idCheck(get_id);

%>
<html>
<head>
</head>
<body>
<% 
    if(getCheck){
%>
    <span>사용 가능한 아이디 입니다.</span>
    <button type="button" id="useId" onclick="sendId()">사용</button>
    <button type="button" id="renameId" onclick="renameId()">취소</button>
<%
    }else{
%>
    <span>사용 불가능한 아이디 입니다.</span>
    <button type="button" id="renameId" onclick="renameId()">돌아가기</button>
<%
    }
%>
<script type="text/javascript">
            function sendId(){
                opener.document.getElementsByName('regular_id')[0].value = '<%= get_id %>';
                opener.document.getElementsByName('regular_id')[0].readOnly = true;
                opener.document.getElementById('Check').remove();
                window.close();
            }
            function renameId(){
                opener.document.getElementsByName('regular_id')[0].value = '';
                window.close();
            }
</script>
</body>
</html>