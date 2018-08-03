<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<title>게시글 목록</title>
<%@ include file="../include/member_header.jsp" %>
<script>
	$(document).ready(function(){
		$("#btnWrite").click(function(){
			location.href="${path}/board/write.do";
			
		});
	});
	
	function list(page){
		location.href="${path}/board/list.do?curPage="+page;
		
	}
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
<%@ include file="../include/member_menu.jsp" %>
<center>
<br><h2>게시글 목록</h2><br>
<form name="form1" method="post" action="${path}/board/list.do">
<div class="form-group col-md-5">
<select  class="col-md-4" id="inputState" class="form-control" name="searchOption">
<!-- 검색조건을 검색처리후 결과화면에 보여주기 위해 c:out 출력태그 사용. -->
	<option value="all"
	<c:out value = "${map.searchOption == 'all' ? 'selected' : '' }"/> >
	제목+이름_제목
	</option>
	
	<option value="writer"
	<c:out value="${map.searchOption=='writer' ? 'selected' : ''}"/> >
	이름
	</option>
	
	<option value="content"
	<c:out value="${map.searchOption=='content' ? 'selected' : ''}"/> >
	내용
	</option>
	
	<option value="title"
	<c:out value="${map.searchOption=='title' ? 'selected' : ''}"/> >
	제목
	</option>
</select>


<input class="col-md-5" name="keyword" value="${map.keyword}" width="5%">
<input  class="col-md-1" type="submit" value="조회" size="5%">
<c:if test="${sessionScope.userId != null}">
	<button type="button" id="btnWrite">글쓰기</button>
</c:if>
</div>
</form>

${map.count}개의 게시물이 있습니다.<br>

<div class="container">
  
  <table class="table">
    <thead class="thead-dark">
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>이름</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    
    <tbody>
      <c:forEach var="row" items="${map.list}">
	<tr>
		<td>${row.bno}</td>
		<td><a href="${path}/board/view.do?bno=${row.bno}&curPage=${map.boardPager.curPage}&searchOption=${map.searchOption}&keyword=${map.keyword}">
		${row.title} 
		<c:if test="${row.recnt>0}">
		<span style="color:red;"> (${row.recnt}) </span>
		</c:if></a>
		</td>
		<td>${row.userName}</td>
		<td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td>${row.viewcnt}</td>
	</tr>
	</c:forEach>
	
	<tr>
		<td colspan="5">
			<c:if test="${map.boardPager.curBlock > 1 }">
				<a href="javascript:list('1')">[처음]</a>
			</c:if>
			
			<c:if test="${map.boardPager.curBlock>1}">
				<a href="javascript:(${map.boardPager.prevPage}')">[이전]</a>
			</c:if>
			
			<c:forEach var = "num" begin="${map.boardPager.blockBegin}" end="${map.boardPager.blockEnd}">
				<c:choose>
					<c:when test="${num==map.boardPager.curPage}">
						<span style="color:red">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${map.boardPager.curBlock<=map.boardPager.totBlock}">
				<a href="javascript:list('${map.boardPager.nextPage}')">[다음]</a>
			</c:if>
			
			<c:if test="${map.boardPager.curBlock<=map.boardPager.totPage}">
				<a href-:javascript:list('${map.boardPager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
	</tbody>
  </table>
</div>
</center>
</body>
</html>