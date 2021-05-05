<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form action="<%=request.getContextPath() %>/post/post_search_list.jsp">
	<select name="sk">
		<option value="post_code">게시글 코드</option>
		<option value="post_title">제목</option>
		<option value="post_cate">글 카테고리</option>
		<option value="post_id">등록자 아이디</option>
	</select>
	<input type="text" name="sv">
	<input type="submit" value="검색">

</form>
