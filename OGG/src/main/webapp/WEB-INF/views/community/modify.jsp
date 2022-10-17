<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<h2>게시판 수정</h2>
	<div>
		<form action="${ path }/community/modify.do" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			<input type="hidden" name="c_no" value="${ community.c_no }">
			<input type="hidden" name="c_file" value="${ community.c_file }">
			<input type="hidden" name="c_fileModify" value="${ community.c_fileModify }">
			<table id='tbl-board'>
				<tr>
					<th>제목</th>
					<td><input type="text" name="c_title" id="c_title" value="${ community.c_title }"></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="upfile"> <br>
						<c:if test="${ not empty community.c_file }">
							<img src="${ path }/resources/images/file.png" width="20px" height="20px">
							<span>${ community.c_file }</span>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="c_content" cols="50" rows="15">${ community.c_content }</textarea>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="수정">
						<input type="button" onclick="location.replace('${pageContext.request.contextPath}/community/goList.do')" value="목록으로">
					</th>
				</tr>
			</table>
		</form>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>