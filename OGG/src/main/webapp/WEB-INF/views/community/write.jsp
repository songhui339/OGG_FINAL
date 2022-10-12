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
	
	<!-- 서머노트 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${path}/summernote/summernote-lite.js"></script>
	<script src="${path}/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="${path}/summernote/summernote-lite.css">
	
	<script type="text/javascript">
		window.onload = function() {
			
			// '등록하기' 버튼 클릭시 모두 입력되었는지 검사
			document.getElementById('communitySubmit').onclick = function() {
				
				if (document.communityWrite.c_title.value.length == 0) {
					alert('제목을 입력하셔야 합니다.');
					return false;
				}
				
				if (document.communityWrite.c_content.value.length == 0) {
					alert('내용을 입력하셔야 합니다.');
					return false;
				}
				
				document.communityWrite.submit();
			};
			
			// Summernote 설정
			var toolbar = [
			    // 글꼴 설정
			    ['fontname', ['fontname']],
			    // 글자 크기 설정
			    ['fontsize', ['fontsize']],
			    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    // 글자색
			    ['color', ['forecolor','color']],
			    // 표만들기
			    ['table', ['table']],
			    // 글머리 기호, 번호매기기, 문단정렬
			    ['para', ['ul', 'ol', 'paragraph']],
			    // 줄간격
			    ['height', ['height']],
			    // 코드보기, 확대해서보기, 도움말
			    ['view', ['codeview','fullscreen', 'help']]
			  ];
			
			let setting = {
					height: 300,                 // 에디터 높이
					minHeight: null,             // 최소 높이
					maxHeight: null,             // 최대 높이
					focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
					lang: "ko-KR",					// 한글 설정
					placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
			}
			$('.summernote').summernote(setting);
			
		};
	

	</script>

</head>
<body>
	<h2>게시판 작성</h2>
	<div>
		<form name="communityWrite" action="${path}/community/write.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="c_title" id="c_title"></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="c_upfile"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea class="summernote" name="c_content" cols="50" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" id="communitySubmit" value="등록">
						<input type="button" value="취소">
					</th>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>