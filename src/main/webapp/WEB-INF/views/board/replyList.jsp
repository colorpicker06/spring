<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

</style>
<title>글 쓰기</title>
<%@include file="../include/member_header.jsp" %>
</head>
<body>
<table style="width:700px; border=3px;">
<c:forEach var="row" items="${list}">
	<tr>
		<td>
		${row.userName}(<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>)<br>
		${row.replytext}<br>
		<!-- 본인 댓글만 수정 -->
		<c:if test="${sessionScope.userId==row.replyer}">
		<input type="button" id="btnModify" value="수정" onclick = "showReplyModify('${row.rno}')"/>
		</c:if>
		<hr>
		</td>
	</tr>
</c:forEach>

<div id="modifyReply"></div>

</table>
</body>
</html>