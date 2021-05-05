<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "kr.or.miniproject.dao.Mdao" %>
<!DOCTYPE html>
<%
    String level = request.getParameter("level");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String alert = null;
    
    Mdao mdao = new Mdao();

    String getInfo[] = mdao.mLogin(level, id, pw);
	    if(getInfo[0] != null){
	        alert = "로그인 성공";
	        session.setAttribute("S_ID", getInfo[0]);
	        session.setAttribute("S_NAME", getInfo[1]);
	        if(getInfo[3].equals("regular")){
	            session.setAttribute("S_GRADE", getInfo[2]);    
	        }
	        session.setAttribute("S_LEVEL", getInfo[3]);
	    }else{
	        alert = "없는 아이디거나 비밀번호가 일치하지 않습니다.";
	    }

%>
<script type="text/javascript">
	alert('<%= alert %>');
	location.href='<%= request.getContextPath()%>/index.jsp';
</script>