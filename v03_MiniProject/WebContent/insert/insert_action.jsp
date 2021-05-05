<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.miniproject.dto.Member"%>
<%@ page import="kr.or.miniproject.dao.Mdao"%>
<!DOCTYPE html>
<jsp:useBean id="regular" class="kr.or.miniproject.dto.Member" />
<jsp:setProperty name="regular" property="*"/>
<%	

    request.setCharacterEncoding("UTF-8");

    Mdao mdao = new Mdao();

    mdao.mInsert(regular);

    response.sendRedirect(request.getContextPath() + "/index.jsp");

%>
