<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Fixed 1-column #2 layout (basic)</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resource/css/style.css" media="screen" />
</head>
<body>
 <%@ include file="/module/top.jsp" %>	
 <%@ include file="/module/left.jsp" %>	


       <div class="event_insert">
<form action="<%= request.getContextPath()%>/event/event_insert_action.jsp" method="post">
       <div class="subject_group">
       <input type="hidden" name="event_code">      
       </div>
       <div class="subject_group">
       <input type="hidden" name="event_id" value="<%=S_ID%>"> <!-- 로그인세션아이디변수새기면 퍼센트블록 해주기  -->  
       </div>
        <div class="subject_group">
            <label for="event_cate">카테고리</label>
            <select name="event_cate" id="event_cate"> 
            <option value="cate">카테고리 선택</option>
            <option value="event_class">강의이벤트</option>
            <option value="event_goods">상품이벤트</option>
                <option value="event_point">포인트이벤트</option>
            </select>
            </div>
            <div class="subject_group">
            <label for="event_title"> 이벤트 제목</label><input type="text" name="event_title" id="event_title" placeholder="이벤트 제목">
                               
         </div>
 
        <div class="event_cont">
        <label for="event_content">이벤트내용</label>
            <textarea name="event_content" id="event_content" placeholder="내용"></textarea>    
        </div>
         <div class="event_post_filecode">
             <input name="event_post_filecode" type="file"/>
        </div>
        <div>
            <button type="submit">글 작성</button>
        </div>
    </form>
        </div>
    
    <%@ include file="/module/bottom.jsp" %>  

</body>
</html>