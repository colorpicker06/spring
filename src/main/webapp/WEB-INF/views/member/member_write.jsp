<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<title>회원가입</title>
<%@include file="../include/member_header.jsp" %>
</head>
<style>
body{
	background-image: url("${pageContext.request.contextPath}/resources/image/background.jpg");
	background-size: 100%;
	background-attachment: fixed;
	backgronnd-opacity: 0.7;
	color:white;
}
</style>
<body>
<%@include file="../include/member_menu.jsp" %>
<center>
<br><br>
<h2>회원 가입</h2><br>
<body>

<form name="form1" method="post" action="${path}/member/insert.do">
<table width="400px">

	<tr>
	<td>아이디</td>
	<td><input name="userId" class="form-control input-lg"></td>
	</tr>
	
	<tr>
	<td>비밀번호</td>
	<td><input type="password" class="form-control input-lg" name="userPw"></td>
	</tr>
	
	<tr>
	<td>이름</td>
	<td><input name="userName" class="form-control input-lg"></td>
	</tr>
	
	<tr>
	<td>이메일주소</td>
	<td><input name="userEmail" class="form-control input-lg"></td>
	</tr>
	
	<tr>
	<td colspan="2"><input type="submit" value="확인" class="form-control input-lg"><input type="reset" value="취소" class="form-control input-lg"></td>
	</tr>

	

</table>

</form>
</center>
</body>
</html>