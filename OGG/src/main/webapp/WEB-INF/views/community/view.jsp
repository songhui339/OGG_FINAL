<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>커뮤니티</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    
    <link rel="stylesheet" href="${path}/css/community/ogg_community.css" class="css">
    <link rel="stylesheet" href="${path}/css/member/headerFooter.css" class="css">
	
	<script src="${ path }/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
        <section class="community_section">

            <div class="pageTitleBox">
                <h2 class="titleText" onclick="location.href='${ path }/community/goList.do'">💬 커뮤니티</h2>
                <div class="btnBox">

                    <button type="button" 
                    onclick="location.href='${ path }/cummunity/goModify.do?c_no=${ community.c_no }'" class="btn modifyBtn">수정 <i class="bi bi-pencil"></i></button>
                    <button type="button" id="btnDelete" class="btn deleteBtn">삭제 <i class="bi bi-trash3"></i></button>
                </div>
            </div>

            <!-- 게시글 내용 -->
            <div class="articleWrap">
                <!-- 타이틀 -->
                <div class="titleBox">
                    <h2>${ community.c_title }</h2>
                </div>

                <!-- 정보 -->
                <div class="infoBox">
                    <span class="writerText">${ community.m_nickName }</span>
                    <span class="dateText">작성일 : <fmt:formatDate value="${community.c_writeDate}" pattern="yyyy-MM-dd" /></span>
                    <div class="info_right">
                        <span class="viewCount c_gray">
                            👀 ${ community.c_viewCount }
                        </span>
                        <span class="commentCount c_gray">
                            💬 댓글갯수카운트넣어야행
                        </span>
                    </div>
                </div>

                <!-- 내용 -->
                <div class="contentBox">
                    <p>
                        ${ community.c_content }
                    </p>
                    <br><br><br>
                    <c:if test="${ not empty community.c_file }">
	                    <img src="${ path }/images/community/file.png" width="20px" height="20px">
						<a href="javascript:" id="fileDown" class="fileLink">
							<span>${ community.c_file }</span>
						</a>
					</c:if>
                </div>

                <!-- 댓글 header -->
                <div class="replyHeader">
                    <h3>댓글 <span>댓글 개수 카운트해야행</span></h3>
                </div>

                <!-- 댓글 내용 -->
				<c:forEach items="${communityReply}" var="communityReply" >
					<div class="replyBox">
						<div class="replyItem">
							<p class="replyWriter">
								${communityReply.m_nickname}
								<span class="date">작성일 : <fmt:formatDate value="${communityReply.cr_writeDate}" pattern="yyyy-MM-dd" /></span>
							</p>
							<p class="replyText">
								${communityReply.cr_content }
							</p>
							<div class="btnBox">
								<button type="button" class="btn purpleBtn" onclick="location.href='${ path }/cummunity/replyModify.do?cr_no=${ communityReply.cr_no }'">수정</button>
								<button type="button" class="btn redBtn" onclick="location.href='${ path }/cummunity/replyDelete.do?cr_no=${ communityReply.cr_no }'">삭제</button>
							</div>
						</div>
					</div>
				</c:forEach>


                <!-- 로그인 안한 사람들한테 보일 화면 
                <div class="needLoginBox">
                    <div class="banner">
                        <p>
                            <i class="bi bi-chat-dots-fill"></i> 권한이 없습니다. 
                            <span onclick="location.href='${ path }/member/goLoginPage.do'">로그인</span>
                        </p>
                    </div>
                </div>
                -->

                <!-- 댓글 입력 창 -->
                <div class="writeReplyBox">
                    <form method="post" action="${path}/community/replyWrite.do" name="communityReplyWrite">
                        <textarea rows="3" cols="50" name="cr_content" class="replyTA"></textarea>
                        <input type="hidden" name="cr_communityNo" value="${community.c_no}">
                        <input type="hidden" name="cr_writerNo" value="${community.c_writerNo}">
                        <button type="submit" id="communityReplySubmit" class="btn replyBtn">댓글 작성</button>
                    </form>
                </div>
            </div>

            <div class="btnBox">
                <button type="button" onclick="location.href='${ path }/community/list.do'" class="btn backtoListBtn"><i class="bi bi-card-list"></i> 목록으로</button>
            </div>


            
        </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
<script type="text/javascript">
	$(document).ready(() => {
		
		// 파일 다운
		$("#fileDown").on("click", () => {
			location.assign("${ path }/community/fileDown.do?oname=${ community.c_file }&rname=${ community.c_fileRename }");
		});

		// '등록하기' 버튼 클릭시 모두 입력되었는지 검사
		document.getElementById('communityReplySubmit').onclick = function() {			
			if (document.communityReplyWrite.cr_content.value.length == 0) {
				alert('내용을 입력하셔야 합니다.');
				return false;
			}
			
			document.communityReplyWrite.submit();
		};
		
		// 댓글 수정
		/*
		$('#communityReplyModifyModalButton').click(function(e){
			e.preventDefault();
			
			var cr_no = $(this).attr("cr_no");
			$("#cr_no").val(cr_no);
			
			$('#communityReplyModal').modal("show");
		});
		

		$('#modalY').click(function(e){
			
			var cr_no = $('#cr_no').val();
			var cr_content = $('#cr_content').val();
			
			$.ajax({
				type : 'post',
				url : '/cummunity/replyModify.do',
				data : { cr_no , cr_content },
				dateType: 'json',
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					if(data > 0) {
						alert("수정 완");
						$("#communityReplyModal").modal("hide");
					} else {
						alert("수정 실패 관리자에게 문의해");
						$("#communityReplyModal").modal("hide");
						
					}
				}
			});
			
		});
		*/

	});
</script>
</html>