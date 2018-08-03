<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- jstl 코어 태그 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- context 경로 -->
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<center>
<img src="${pageContext.request.contextPath}/resources/image/bar-code.png" width="7%">
</center>

<ul>
  <li><a href="${path}">Home</a></li>
  <li><a href="${path}/board/list.do">JAVA</a></li>
  <li><a href="${path}/member/list.do">회원관리</a></li>
  <li><a href="${path}/member/write.do">회원등록</a></li>
  <li><a href="${path}/board/video.do">코딩영상</a></li>
    <c:choose>
    <c:when test="${sessionScope.userId==null}">
    	<li><a href="${path}/login/login.do">로그인</a></li>
    </c:when>
    <c:otherwise>
    	<li><a href="${path}/login/logout.do">로그아웃</a></li>
    	<li><a href="${path}/login/loginCheck.do">${sessionScope.userName}님이 로그인 중입니다.</a></li>  	
    </c:otherwise>
    </c:choose>
</ul>
    