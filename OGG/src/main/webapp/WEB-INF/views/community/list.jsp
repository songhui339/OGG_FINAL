<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

</head>
<body>
	<h2>게시판 </h2>
	<div>
		<button type="button" onclick="location.href='${path}/community/goWrite.do'">글쓰기</button>

		<table>
			<tr>
				<th>글 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>Like</th>
				<th>조회수</th>
			</tr>
			
			<c:if test="${ empty list }">
				<tr>
					<td colspan="6">
						조회된 게시글이 없습니다.
					</td>
				</tr>	
			</c:if>
			
			<c:if test="${ not empty list }">
				<c:forEach var="community" items="${ list }">
					<tr>
						<td>${ community.c_no }</td>
						<td>
							<a href="${ path }/community/view.do?c_no=${ community.c_no }">
								${ community.c_title }
							</a>
						</td>
						<td>${ community.m_nickName }</td>
						<td><fmt:formatDate type="date" value="${ community.c_writeDate }"/></td>
						<td>${ community.c_like }</td>
						<td>${ community.c_viewCount }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/community/list.do?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/community/list.do?page=${ pageInfo.prevPage }'">&lt;</button>

			<!--  10개 페이지 목록 -->
			<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
				<c:if test="${ status.current == pageInfo.currentPage }">
					<button disabled>${ status.current }</button>
				</c:if>
				<c:if test="${ status.current != pageInfo.currentPage }">
					<button onclick="location.href='${ path }/community/list.do?page=${ status.current }'">${ status.current }</button>
				</c:if>
			</c:forEach>

			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/community/list.do?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/community/list.do?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
		<br><br><br>
		
		<!-- 검색 -->
		<div>
			<select name="condition" id="condition">
				<option value="subject">제목</option>
				<option value="c_content">내용</option>
			</select>
			<input type="text" name="keyword" />
			<button type="button">검색</button>
		</div>
		
	</div>
</body>
</html>