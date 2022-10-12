<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table {
  width: 100%;
  border: 1px solid #444444;
}
th, td {
  border: 1px solid #444444;
}
</style>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h2>게시판</h2>
	<table>
		<tr>
			<th>글번호</th>
			<td>${ community.c_no }</td>
		</tr>
		<tr>
			<th>제 목</th>
			<td>${ community.c_title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${ community.m_nickName }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${ communityCount }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:if test="${ empty community.c_file }">
					<span>-</span>
				</c:if>
				<c:if test="${ not empty community.c_file }">
					<img src="${ path }/resources/images/file.png" width="20px" height="20px">
					<a href="javascript:" id="fileDown">
						<span>${ community.c_file }</span>
					</a>
					<%-- 
					<br><a href="${ path }/resources/upload/board/${board.renamedFileName}"
						download="${ board.originalFileName }">파일 다운</a>
					--%>
				</c:if>
			</td>
		</tr>
		<tr>
			<th>좋아요</th>
			<td>${ community.c_like }</td>
		</tr>
		<tr>
			<th>내 용</th>
			<td>${ community.c_content }</td>
		</tr>

		<tr>
			<th colspan="2">
					<button type="button" 
						onclick="location.href='${ path }/cummunity/goModify.do?c_no=${ community.c_no }'">수정</button>
					<button type="button" id="btnDelete" >삭제</button>
				<button type="button" onclick="location.href='${ path }/community/goList.do'">목록으로</button>
			</th>
		</tr>
	</table>
	
	<!-- 댓글 리스트 -->
	<c:forEach items="${communityReply}" var="communityReply" >
		<li>
			<div>
				<p>${communityReply.m_nickname} /
				<fmt:formatDate value="${communityReply.cr_writeDate}" pattern="yyyy-MM-dd" /> </p>
				<p>${communityReply.cr_content }</p>
			</div>
			<button type="button" onclick="location.href='${ path }/cummunity/replyDelete.do?cr_no=${ communityReply.cr_no }'">삭제</button>
			<button type="button" onclick="location.href='${ path }/cummunity/replyModify.do?cr_no=${ communityReply.cr_no }'">수정</button>
		</li>	
	</c:forEach>
	
	<div>
		<form method="post" action="/community/replyWrite.do">
		<!--  
			<p>
				<label>댓글 작성자</label> <input type="text" name="cr_writerNo">
			</p>
			-->
			<p>
				<textarea rows="5" cols="50" name="cr_content"></textarea>
			</p>
			<p>
				<input type="hidden" name="cr_communityNo" value="${community.c_no}">
				<input type="hidden" name="cr_writerNo" value="${community.c_writerNo}">
				<button type="submit">댓글 작성</button>
			</p>
		</form>
	</div>
	
	

</body>
<script>
	$(document).ready(() => {
		$("#btnDelete").on("click", () => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("${ path }/community/delete.do?c_no=${ community.c_no }");
			}
		});
		
		$("#fileDown").on("click", () => {
			location.assign("${ path }/community/fileDown.do?oname=${ community.c_file }&rname=${ community.c_fileModify }");
		});
		
		$("#replyContent").on("focus", (e) => {
			if(${ empty loginMember }) {
				alert("로그인 후 이용해주세요!");
				
				$('#replyContent').blur();
			}
		});
	
	});
</script>
</html>