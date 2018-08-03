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
<title>글 쓰기</title>
<%@include file="../include/member_header.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		
		$("#btnLogin").click(function(){
			var userId = $("#userId").val();
			var userPw = $("#userPw").val();
			if(userId==""){
				alert("아이디를 입력하세요");
				return;
			}
			
			if(userPw==""){
				alert("비밀번호를 입력하세요");
				return;
			}
			
			document.form1.action="${path}/login/loginCheck.do"
			document.form1.submit();
		});		
	});

</script>
<style>
body{
	background-image: url("${pageContext.request.contextPath}/resources/image/background.jpg");
	background-size: 100%;
	background-attachment: fixed;
	backgronnd-opacity: 0.7;
	color:white;
}
</style>
</head>
<body>
<%@include file="../include/member_menu.jsp" %>
<center><br><br><br>
<h2>로그인 페이지</h2><br>

<div class="container">
<form name="form1" method="post">
	<table width=500px>
		<tr>
			<td>아이디</td>
			<td><input name="userId" class="form-control input-lg" id="userId"></td>
		</tr>
		
		<tr>
			<td>비밀번호</td>
			<td><input type="password" class="form-control input-lg" name="userPw" id="userPw"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
			<button type="button" class="form-control input-lg" id="btnLogin" style="background-color:'#02631c'">로그인</button>
			<c:if test="${msg=='failure'}">
				<div style="color:red">
					아이디 또는 비밀 번호가 일치 하지 않습니다.
				</div>
			</c:if>
			
			<c:if test="${msg=='logout'}">
				<div style="color:red">
				로그아웃 되었습니다.
				</div>
			</c:if>
		</tr>
	</table>
	
</form>
</div>
</center>
</body>
</html>