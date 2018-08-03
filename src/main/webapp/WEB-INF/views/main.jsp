<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu2.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<style>
body{
	background-image: url("${pageContext.request.contextPath}/resources/image/background.jpg");
	background-size: 100%;
	background-attachment: fixed;
	backgronnd-opacity: 0.7;
	color:white;
}

.top{
	margin-top: 0px;
	position: fixed;
	width: 100%;
	height: 100%;
}

h4 h1 h3 h2 {
	color:white;
}

</style>

<title>Insert title here</title>
</head>
<body>
<div class="top">
<center>
<img src="${pageContext.request.contextPath}/resources/image/bar-code.png" width="7%">
</center>


  <div class="wrapper">
  <button class="menu-button">
    <div class="menu-button__line"></div>
    <div class="menu-button__line"></div>
    <div class="menu-button__line"></div>
  </button>
  
  <nav class="menu">
		<ul class="menu__list menu__list--hidden">
			<li class="menu__item"><a href="${path}" class="menu__link menu__link--1">Home</a></li>
			<li class="menu__item"><a href="${path}/board/list.do" class="menu__link menu__link--2">JAVA</a></li>
			<li class="menu__item"><a href="${path}/member/list.do" class="menu__link menu__link--3" >MEMBER</a></li>
			<li class="menu__item"><a href="${path}/member/write.do" class="menu__link menu__link--4">SIGNIN</a></li>
			
			<c:choose>
			    <c:when test="${sessionScope.userId==null}">
			    	<li class="menu__item"><a href="${path}/login/login.do" class="menu__link menu__link--5">로그인</a></li>
			    </c:when>
			    <c:otherwise>
			    	<li class="menu__item"><a href="${path}/login/logout.do" class="menu__link menu__link--5">로그아웃</a></li>
			    	<li class="menu__item"><a href="${path}/login/loginCheck.do" class="menu__link menu__link--6">${sessionScope.userName}님이 로그인 중입니다.</a></li>  	
			    </c:otherwise>
		    </c:choose>
		</ul>
	</nav>
</div>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js'></script>
<script  src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
</div>


<img src="${pageContext.request.contextPath}/resources/image/key.jpg" width="100%"><br>

<center>
<h4>혼자 코딩하기 어려우셨던 여러분을 위해</h4><br>
<h3>이제 "code code"에서 함께 공부해요. :)</h3>
<br><br><br>
</center>

</body>
</html>
<%@include file="bottom.jsp" %>