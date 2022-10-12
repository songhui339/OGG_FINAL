<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
    <!-- my CSS -->
    <link rel="stylesheet" href="${path}/css/review/ogg_review.css">
    
    <!-- my JS -->
    <script defer src="${path}/js/review/film_detail.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
    <!-- 내용 전체 컨테이너 -->
    <div class="container" style="margin-bottom: 100px; margin-top: 40px; padding-left: 60px; padding-right: 60px; ">
		
		<!-- 1st row -->
		<jsp:include page="/WEB-INF/views/review/film_header.jsp"/>
        
        <!-- 2nd row -->
        <div class="col-3 col-sm-12" id="div_review">
            <!-- 리뷰 내용 -->
			<div id="div_review">
				<p id="board-text1">${ review.rvNickname }</p>
				<input id="rvNo" type="hidden" value="${ review.rvNo}">
				<hr>
				<p id="board-text3">
					<br>
					${ review.rvContent }
					<br><br>
				</p>
				<hr>
			    <div class="row" id="detail-text">
			        <div class="col-sm-1">
			            <img src="${path}/images/review/heart2.png" style="margin-left: 10px;" height="30px;">
			            ${ review.rvLikes }
			        </div>
			        <div class="col-sm-8">
			            <img src="${path}/images/review/comment2.png"  height="30px;">
			            ${ cmtCount }
			        </div>
			        <c:if test="${ loginMember.m_no == review.rvWriterNo }">
 			        <div class="col-sm-3">
			            <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 55%;">
			                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever=" 남기기">수정</button>
			                <button class="btn btn-primary" type="button" id="deleteReview">삭제</button>
			            </div>        
			        </div> 
			    	</c:if>
			    </div>
			</div>
			<br>
            <!-- 리뷰 내용 끝-->
            
            <!-- 모달 -->
	        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
	                <div class="modal-content">
	                    <div class="modal-header"id="modal-header">
	                        <h5 class="modal-title" id="exampleModalLabel">리뷰 수정</h5>
	                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                    </div>
	                    <div class="modal-body">
	                        <form>
	                        <div class="mb-3">
	                            <label for="message-text" class="col-form-label"></label>
	                            <textarea class="form-control" id="message-text" style="height: 300px;">${ review.rvContent }</textarea>
	                        </div>
	                        </form>
	                    </div>
	                    <div class="modal-footer">
	                        <span id="textLengthCheck">(0 / 2000)</span>
	                        <button type="button" class="btn btn-primary" id="updateReview" data-bs-dismiss="modal">저장</button>
	                    </div>
	                </div>
	            </div>
	        </div>
            
            <!-- 댓글 테이블 -->
            <div id="div_comment">
            <table class="table table-hover" id="review_reply">
                <tbody id="cmtTbody" >
                	<c:forEach var="reviewCmt" items="${ reviewCmt }">
                    <tr id="cmtlist">
						<input id="cmtNo" type="hidden" value="${ reviewCmt.cmtNo }">
						<input id="cmtWriterNo" type="hidden" value="${reviewCmt.cmtWriterNo }" >
						<input id="cmtNickname" type="hidden" value="${reviewCmt.cmtNickname }" >
                        <td id="board-text4">${ reviewCmt.cmtNickname }</td>
                        <td id="board-text5">${ reviewCmt.cmtContent }</td>
                        <td id="board-text7">
                        	<c:if test="${ loginMember.m_no == reviewCmt.cmtWriterNo }">
	                            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
	                                <button class="btn btn-primary" type="button" onclick="showUpdateCmt(event)">수정</button>
	                                <button class="btn btn-primary" type="button" onclick="deleteCmt(event)">삭제</button>
	                            </div>    
							</c:if>
                        </td>
                    </tr>
                    <tr id="cmtlist2" style="display: none;">
                        <td id="board-text4">${ reviewCmt.cmtNickname }</td>
                        <td id="board-text5-1">
                        	<textarea id="message-cmt-2" style="border: 1px solid lightgrey; resize: none; width: 100%;"
                            >${ reviewCmt.cmtContent }</textarea>
                        </td>
                        <td id="board-text7-1">
                            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                <button class="btn btn-primary" type="button" onclick="updateCmt(event)">수정</button>
                                <button class="btn btn-primary" type="button" onclick="updateCommentsCancel(event)">취소</button>
                            </div>    
                        </td>
                    </tr>
                  </c:forEach>
                </tbody>
            </table>
            <!-- 리뷰 작성 컨테이너 -->
            <div id="comment-editor" class="mb-3">
                <div class="form-control" style="height: 85px;">
                    <p id="loginId" style="font-weight: bold; margin: 0px;"></p>
                    <textarea id="message-cmt" style="border: none; resize: none; width: 100%;"></textarea>
                </div>
                <div class="text-right mt-1">
                    <button class="btn btn-primary" type="button" id="writeCmt"
                    style="margin-left:45%; height: 35px;">등록</button>
                </div>
            </div>
        </div>
        </div>
        <!-- 2nd row 끝 -->

    </div>
    <!-- 내용 전체 컨테이너 끝 -->    
    
	<script>
	var fcode = "${ fcode }";
	var ftype = "${ ftype }";
	var m_no = "${ m_no }";
    var rvNo = document.getElementById('rvNo').value;
	var contextpath = "${ pageContext.request.contextPath }";

	function showUpdateCmt(event) {
		$(event.target).parents('#cmtlist').hide();
		$(event.target).parents("#cmtlist").next().show();
		$(event.target).parents("#cmtlist").next().find('#message-cmt-2').val($(event.target).parent().parent().prev().text());
	}

	function updateCommentsCancel(event) {
		$(event.target).parents('#cmtlist2').hide();
		$(event.target).parents("#cmtlist2").prev().show();
	}

	function updateCmt(event) {
		let cmtContent = $(event.target).parent().parent().prev().find('#message-cmt-2').val();

		$.ajax({
			async: true,
			type : 'POST',
			url : contextpath + '/review/cmt_update',
			data : {
				'rvNo' : rvNo,
				'cmtNo' : $(event.target).parent().parent().parent().parent().prev().find('#cmtNo').val(),
				'cmtContent' : cmtContent, 
				'fCode' : fcode,
				'ftype' : ftype
			},
			success : (data) => {
				$(event.target).parent().parent().parent().hide();
				$(event.target).parent().parent().parent().prev().show();
				$(event.target).parent().parent().parent().prev().find('#board-text5').text(cmtContent);
			},
			error : (error) => {
				alert('댓글 수정에 실패하였습니다');
			}
		});
    }

	function deleteCmt(event) {
        
        if(confirm('댓글을 삭제하시겠습니까?')){
			$.ajax({
				async: true,
				type : 'POST',
				url : contextpath + '/review/cmt_delete',
				data : {
					'rvNo' : rvNo,
					'cmtNo' : $(event.target).parent().parent().parent().parent().find('#cmtNo').val(),
					'cmtContent' : $(event.target).parent().parent().find('#message-cmt-2').val(), 
					'fCode' : fcode,
					'ftype' : ftype
				},
				success : (data) => {
					alert('댓글이 정상적으로 삭제되었습니다.');
					$(event.target).parents("#cmtlist").remove();
				},
				error : (error) => {
					alert('댓글 삭제에 실패하였습니다');
				}
			});
		};
    }
	</script>  

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>