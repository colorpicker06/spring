<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 쓰기</title>
<style>
form{
	margin-left: 30%;
}

body{
	background-image: url("${pageContext.request.contextPath}/resources/image/background.jpg");
	background-size: 100%;
	background-attachment: fixed;
	backgronnd-opacity: 0.7;
	color:white;
}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<%@include file="../include/member_header.jsp" %>
<script>
$(document).ready(function() {	
	$("#btnSave").click(function() {
		var title=$("#title").val();
		var content=$("#content").val();
		//var writer=$("#writer").val();
		if(title=="") {
			alert("제목을 입력하세요.");
			document.form1.title.focus();
			return;
		}
		if(content=="") {
			alert("내용을 입력하세요.");
			document.form1.content.focus();
			return;
		}
		document.form1.submit();
	});
	
	$("#btnList").click(function(){
		location="list.do";
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
<%@ include file="../login/SessionCheck.jsp" %>
<br><br>

<form name="form1" method="post" action="${path}/board/insert.do">
	<h2>&nbsp; &nbsp;게시글 작성</h2><br>
	<div class="col-xs-7"> 제목
		<input name="title" class="form-control" id="title" size="80" placeholder="제목을 입력하세요.">	
	</div>
	<br><br>
	<div class="col-xs-7"> 내용
		<textarea class="form-control" rows="5" id="comment" cols="80" placeholder="내용을 입력하세요."></textarea>
	</div><br>

	<!--  
	<div> 이름
		<input name="writer" id="writer" placeholder="이름을 입력하세요.">
	</div>
	<br><br>
	-->
	<div style="width: 650px; text-align: center;">
		<button type="button" id="btnList">글 목록</button>
		<button type="button" id="btnSave">확인</button>
		<button type="reset">취소</button>
	</div>
</form>
</body>
</html>