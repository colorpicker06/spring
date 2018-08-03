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
<title>회원 상세보기</title>
<%@include file="../include/member_header.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnUpdate").click(function(){
			//확인 대화상자
			if(confirm("수정하시겠습니까?")){
				document.form1.action="${path}/member/update.do";
				document.form1.submit();
			}
		});
	});
	
	$(document).ready(function(){
		$("#btnDelete").click(function(){
			//확인대화상자
			if(confirm("삭제하시겠습니까?")){
				document.form1.action="${path}/member/delete.do";
				document.form1.submit();
			}
		})
	})

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
<center>
<%@include file="../include/member_menu.jsp" %>
<br><br><h2>회원 상세보기</h2><br>
<form name="form1" method="post">
	<table width="400px">
	
		<tr>
			<td>아이디</td>
			<!-- id는 수정이 불가능 하도록 readonly속성 추가 -->
			<td><input name="userId" class="form-control input-lg" value="${dto.userId}" readonly="readonly"></td>
		</tr>
		
		<tr>
			<td>비밀번호</td>
			<td><input name="userPw" class="form-control input-lg" type="password"></td>
		</tr>
		
		<tr>
			<td>이름</td>
			<td><input name="userName" class="form-control input-lg" value="${dto.userName}"></td>
		</tr>
		
		<tr>
			<td>이메일</td>
			<td><input name="userEmail" class="form-control input-lg" value="${dto.userEmail}"></td>
		</tr>
		
		<!-- 누락된 부분 -->
		
		<tr>
			<td>회원가입일자</td>
			<td><fmt:formatDate value="${dto.userRegdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		
		<tr>
			<td>회원 정보 수정일자</td>
			<td><fmt:formatDate value="${dto.userUpdatedate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="button" class="form-control input-lg" value="수정" id="btnUpdate">
				<input type="button" class="form-control input-lg" value="삭제" id="btnDelete">
				<div style="color:red;">${message}</div>
			</td>			
		</tr>
			
	</table>
</form>
</center>
</body>
</html>