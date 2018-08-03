<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@include file="../include/member_header.jsp" %>
<script>
//댓글 수정
$("#btnReplyUpdate").click(function(){
	var detailReplytext = $("#detailReplytext").val();
	$.ajax({
		type:"put",
		url:"${path}/reply/update/${vo.rno}",
		headers:{
			"Content-type":"application/json"	
		},
		data:JSON.stringify({
			replytext:detailReplytext
		}),
		dataType:"text",
		success:function(result){
			if(result=="success"){
				$("#modifyReply").css("visibility","hidden");
				//업데이트한 댓글 목록 제시
				listReply();
			}
		}
	})
});

//댓글 삭제
$("#btnReplyDelete").click(function(){
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			type:"delete",
			url:"${path}/reply/delete/${vo.rno}",
			success:function(result){
				if(result=="success"){
					alert("삭제되었습니다.");
					$("#modifyReply").css("visibility","hidden");
					listReply();
				}
			}
		});
	}
});


//댓글 상세화면 닫기
</script>
</head>
<body>
댓글번호 : ${vo.rno}<br>
	<textarea rows="5" cols="50" id="detailReplytext">
	${vo.replytext}
	</textarea>
	<div style="text-align:center;">
		<!-- 본인 댓글만 수정, 삭제가 가능하도록 처리 -->
		<c:if test="${sessionScope.userId == vo.replyer}">
			<button type="button" id="btnReplyUpdate">수정</button>
			<button type="button" id="btnReplyDelete">삭제</button>		
		</c:if>
		<button type="button" id="btnReplyClose">닫기</button>
	</div>
</body>
</html>