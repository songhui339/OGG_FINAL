<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- 커뮤니티 페이지 CSS -->
    <link rel="stylesheet" href="${path}/css/community/ogg_community.css" class="css">
	
        <section class="community_section">

            <div class="pageTitleBox">
                <h2 class="titleText" onclick="location.href='${ path }/community/goList.do'">
				 <img src="${ path }/images/community/icon_chat.png" alt="icon" class="iconImg">
				 커뮤니티
				</h2>
                <security:authentication property="principal.m_no" var="security_m_no"/>
				<c:if test="${security_m_no eq community.c_writerNo}">
	                <div class="btnBox">
	                    <button type="button" 
	                    onclick="location.href='${ path }/cummunity/goModify.do?c_no=${ community.c_no }'" class="btn modifyBtn">수정 <i class="bi bi-pencil"></i></button>
	                    <button type="button" id="btnDelete" class="btn deleteBtn">삭제 <i class="bi bi-trash3"></i></button>
	                </div>
                </c:if>
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
                            <img src="${ path }/images/community/icon_eyes.png" alt="icon" style="width:15px; margin-right: 3px;">
                             ${ community.c_viewCount }
                        </span>
                        <span class="commentCount c_gray">
                            <img src="${ path }/images/community/icon_chat.png" alt="icon" style="width:15px; margin-right: 3px;">
                             ${ community.cr_replyCount }
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
                    <h3>댓글 <span>${community.cr_replyCount}</span></h3>
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
							<security:authentication property="principal.m_no" var="security_m_no"/>
							<c:if test="${security_m_no eq communityReply.cr_writerNo}">
								<div class="btnBox">
									<button type="button" class="btn redBtn" onclick="location.href='${ path }/cummunity/replyDelete.do?cr_no=${ communityReply.cr_no }'">삭제</button>
								</div>
							</c:if>
						</div>
					</div>
				</c:forEach>

                <!-- 오류 해결을 위한 빈 div 태그 삭제하지말아주세요!! -->
                <div style="height: 50px;"></div>

                <!-- 댓글 입력 창 -->
                <div class="writeReplyBox">
                    <form method="post" action="${path}/community/replyWrite.do" name="communityReplyWrite">
                        <input type="hidden" name="cr_communityNo" value="${community.c_no}">
                        <security:authentication property="principal.m_no" var="sec_m_no"/>
                        <input type="hidden" name="cr_writerNo" value="${sec_m_no}">
                        <textarea rows="3" cols="50" name="cr_content" class="replyTA" style="resize: none;width: 85%;height: 80px;border-radius: 0.375rem;"></textarea>
                        <button type="submit" id="communityReplySubmit" class="btn replyBtn">댓글 작성</button>
                        
                    </form>
                </div>
            </div>
			
			<!-- 목록 버튼 -->
            <div class="btnBox">
                <button type="button" onclick="location.href='${ path }/community/list.do'" class="btn backtoListBtn"><i class="bi bi-card-list"></i> 목록으로</button>
            </div>


            
        </section>
        
	<script type="text/javascript">
		$(document).ready(() => {
			
			// 게시글 삭제
			$("#btnDelete").on("click", () => {
				if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
					location.replace("${ path }/community/delete.do?c_no=${ community.c_no }");
				}
			});
			
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
			
			$('#communityReplyModifyModalButton').click(function(){	
				$('#communityReplyModal').modal("show");
			});
			
	
	
		});
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>