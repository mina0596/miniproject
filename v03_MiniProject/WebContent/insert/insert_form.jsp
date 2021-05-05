<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>육아 커뮤니티</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resource/css/reset.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resource/css/style.css" media="screen" />
</head>
<body>
<%@ include file="/module/top.jsp" %>	
<%@ include file="/module/left.jsp" %>	
<form method="post" action="<%= request.getContextPath() %>/insert/insert_action.jsp">

    <div class="input-group">
        <input name="regular_id" type="text" placeholder="아이디(8자이상)" />   
            <button type="button" id="Check" onclick="idCheck()">중복확인</button> </div>
    <div class="input-group">
        <input name="regular_pw" type="password" placeholder="비밀번호" /></div>
    <div class="input-group">
        <input name="regular_pwCheck" type="password" placeholder="비밀번호 확인" /></div>
    <div class="input-group">
        <input name="regular_name" type="text" placeholder="이름" /></div>
        남 <input name="regular_gender" type="radio" value="남"/>
        여 <input name="regular_gender" type="radio" value="여"/>
    <div class="input-group">
        <input name="regular_phone" type="text" placeholder="휴대폰" /></div>
    <div class="input-group">
        <input name="regular_email" type="text" placeholder="이메일" /></div>
    <div class="input-group">
        <input name="regular_addr" type="text" placeholder="주소" /></div>
        <input type="button" id="registerBtn" value="회원가입" onclick="register(this.form)"/>

</form>
<script type="text/javascript">
    function idCheck(){
        if(document.getElementsByName('regular_id')[0].value.length < 7){
            alert('아이디는 8자 이상으로 해주세요');
            return;
        }else{
        window.name = "insert_form";
        openWin = window.open('idCheckPopUp.jsp?regular_id='+document.getElementsByName('regular_id')[0].value, 'idCheck',
				'width=300, height=400, left=100, top=50 scrollbar=no');
        }
    }
    function register(f){
        for(var i = 3; i < document.getElementsByTagName('input').length; i++){
            if(document.getElementsByTagName('input')[i].value == ''){
                document.getElementsByTagName('input')[i].focus();
                alert('빈 칸 없이 입력해주세요');
                return;
            }    
        }
        
        if(document.getElementsByName('regular_id')[0].readOnly == false){
            alert('아이디 중복 확인해주세요.');
            return;
        }
        if(document.getElementsByTagName('input')[4].value != document.getElementsByTagName('input')[5].value){
            alert('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
            return;
        }
        if(document.getElementsByTagName('input')[9].value.substring(4).indexOf('-') != 4){
            alert('올바른 번호를 입력해주세요');
            return;
        }
        if(document.getElementsByTagName('input')[10].value.indexOf('@') == -1 || document.getElementsByTagName('input')[10].value.indexOf('@') == -1){
            alert('올바른 이메일을 입력해주세요');
            return;
        }
        f.submit();
        
    }
</script>
<%@ include file="/module/bottom.jsp" %>	
