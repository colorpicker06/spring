<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 쓰기</title>
<%@include file="../include/member_header.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	
	//listReply2();
	listReply();
	//게시글 삭제 버튼 클릭 이벤트
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action= "${path}/board/delete.do";
			document.form1.submit();
		}
	});
	
	//게시글 수정 버큰 클릭 이벤트
	$("#btnUpdate").click(function(){
		
		var title=$("#title").val();
		var content=$("#content").val();
		var writer=$("#writer").val();
		
		if(title==""){
			alert("제목을 입력하세요:");
			reuturn;
		}
		
		if(content==""){
			alert("내용을 입력하세요:");
			return;
		}
		
		if(writer==""){
			alert("이름을 입력하세요:");
			return;
		}
		
		document.form1.action="${path}/board/update.do";
		//폼에 입력한 데이터 서버로 전송
		document.form1.submit();
	});
	
	//게시글 목록
	$("#btnlist").click(function(){
		
		history.back();
	});
	
	//댓글 입력 버튼
	$("#btnReply").click(function(){
		
		var replytext=$("#replytext").val();
		var bno="${dto.bno}"
		var param = "replytext="+replytext+"&bno="+bno;
		
		$.ajax({
			type:"post",
			url:"${path}/reply/insert.do",
			data:param,
			success:function(){
				alert("댓글이 등록되었습니다.");
				//listReply2();
				listReply();
			}
		});
	});
});
	
	function listReply(){
		$.ajax({
			type:"get",
			url:"${path}/reply/list.do?bno=${dto.bno}",
			success:function(result){
				$("#listReply").html(result);
			}
		});
	}
	
	function listReply2(){
		$.ajax({
			type:"post",
			url:"${path}/reply/listJson.do?bno=${dto.bno}",
			success:function(result){
				var output = "<table>";
				for(var i in result){
					output += "<tr>";
					output += "<td>"+result[i].userName;
					output += "("+changeDate(result[i].regdate)+")";
					output += result[i].replytext+"</td>";
					output += "</tr>";
				}
				output+="</table>";
				$("#listReply").html(output);
			}
		});
	}
	
	function changeDate(date){
		date = new Date(parseInt(date));
		year = date.getFullYear();
		month = date.getMonth();
		day = date.getDate();
		hour = date.getHours()
		minute = date.getMinutes();
		second = date.getSeconds();
		strDate = year+"-"+month+"-"+day+""+hour+":"+minute+":"+second;
		return strDate
	}
	
	function showReplyModify(rno){
		$.ajax({
			type:"get",
			url:"${path}/reply/detail/"+rno,
			success:function(result){
				$("#modifyReply").html(result);
				$("#modifyReply").css("visibility","visible");
			}
		})
		
	}
	


</script>
<style>
#modifyReply{
	width: 600px;	
	height: 130px;
	border : 3px;
	padding: 10px;
	z-index:10;
	visibility: hidden;
}

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
<br><br><h2>게시글 작성</h2><br>

<form name="form1" method="post">

	
	<input type="hidden" name="writer" id="writer" value="${dto.writer}">
	

	<div>
	작성일자:
	<fmt:formatDate value="${dto.regdate}" pattern="yyyy-MM-dd a HH:mm:ss"/></div>
	
	<div>
	조회수:${dto.viewcnt}
	</div><br>
	
	<br>
	<div>
	제목 <input name="title" id="title" size="80" value="${dto.title}" placeholder="제목을 입력해주세요">
	</div><br><br>
	
	<div>
	내용 <textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력하세요">${dto.content}</textarea>
	</div>
	
	<div><br>
	이름<!-- <input name="writer" id="writer" value="${dto.writer}" placeholder="이름을 입력해주세요">  --> ${dto.writer}

	</div>
	

	
	<br><br><div style="width:650px; text-align:center;">
	<!-- 게시물 번호 hidden 처리 -->
	<input type="hidden" name="bno" value="${dto.bno}">
	
	<c:if test="${sessionScope.userId==dto.writer}">
		<button type="button" id="btnUpdate">수정</button>
		<button type="button" id="btnDelete">삭제</button>		
	</c:if>
	<button type="button" id="btnlist">글 목록</button>
	</div>
</form>

<div style="width:600px; text-align:center;">

<c:if test="${sessionScope.userId!=null}">
	<textarea rows="5" cols="80" id="replytext" placeholder="댓글입력"></textarea><br>
	<button type="button" id="btnReply">댓글쓰기</button>
</c:if>

</div>

<div id="listReply"></div>


</center>
</body>
</html>