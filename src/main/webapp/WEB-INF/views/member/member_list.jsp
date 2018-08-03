<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>회원목록</title>
<%@include file="../include/member_header.jsp" %>
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
<center>
<br><h2>회원 목록</h2><br>
<input type="button" class="btn btn-success" value="회원 등록" onclick="location.href='${path}/member/write.do'"><br>

<div class="container">
  
  <br><table class="table">
    <thead class="thead-dark">
	<tr>
	<th>아이디</th>
	<th>이름</th>
	<th>이메일</th>
	<th>회원 가입 일자</th>
	</tr>
	</thead>
	
	<c:forEach var="row" items="${list }">
	<tr>
	<td>${row.userId }</td>
	<td><a href="${path}/member/view.do?userId=${row.userId}">${row.userName }</a></td>
	<td>${row.userEmail }</td>
	<td>${row.userRegdate }</td>
	</tr>
	</c:forEach>
</table>
</center>

</body>
</html>
<%@include file="../bottom.jsp" %>