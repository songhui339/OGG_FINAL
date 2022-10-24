<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- 커뮤니티 페이지 CSS -->
    <link rel="stylesheet" href="${path}/css/community/ogg_community.css" class="css">
    
    <!-- 서머노트 -->
	<script src="${path}/summernote/summernote-lite.js"></script>
	<script src="${path}/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="${path}/summernote/summernote-lite.css">
	
        <section class="community_section">

            <div class="pageTitleBox">
                <h2 class="titleText">
	                <img src="${ path }/images/community/icon_chat.png" alt="icon" class="iconImg">
					 커뮤니티
				 </h2>
            </div>
            
            <form name="communityWrite" action="${path}/community/modify.do" method="post" enctype="multipart/form-data">
                <div class="articleWrap">
                    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
					<input type="hidden" name="c_writerNo" value="${ community.c_writerNo }">
					<input type="hidden" name="c_no" value="${ community.c_no }">
					<input type="hidden" name="c_file" value="${ community.c_file }">
					<input type="hidden" name="c_fileRename" value="${ community.c_fileRename }">
                    
                    <!-- 타이틀 -->
                    <div class="titleBox">
                        <label for="c_title" class="c_title">제목</label>
                        <input type="text" name="c_title" id="c_title" value="${ community.c_title }">
                    </div>
    
                    <!-- 파일 첨부 -->
                    <div class="fileBox">
                        <span>파일 첨부</span>
                        <input class="upload-name" value="${ community.c_file }" disabled="disabled">
                        <label for="c_upfile" class="fileBtn">업로드 <i class="bi bi-upload"></i></label> 
                        <input type="file" name="upfile" id="c_upfile" class="upload-hidden">
                    </div>
                 
    
                    <!-- 내용 -->
                    <div class="contentBox">
                        <textarea class="summernote" name="c_content" cols="50" rows="15" >${ community.c_content }</textarea>
                    </div>
                </div>

                <div class="btnBox">
                    <input type="submit" id="communitySubmit" value="수정" class="btn submitBtn">
                    <input type="button" id="communitySubmit" onclick="location.replace('${path}/community/goList.do')" value="취소" class="btn deleteBtn">
            </form>
            
	<script>
	<!-- 파일 업로드 이름 가져오는 Script -->
	$(document).ready(function(){
	    var fileTarget = $('.fileBox .upload-hidden');
	
	    fileTarget.on('change', function(){  // 값이 변경되면
	        if(window.FileReader){  // modern browser
	        var filename = $(this)[0].files[0].name;
	        } 
	        else {  // old IE
	        var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	        }
	        
	        // 추출한 파일명 삽입
	        $(this).siblings('.upload-name').val(filename);
	    });
	    
	    // 작성 유효성
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
	    
	}); 
	</script>

    </section>
        
	    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>