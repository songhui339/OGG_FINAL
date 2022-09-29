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
    <br><br><br><br><br>
    <div class="container" style="margin-bottom: 100px; padding-left: 60px; padding-right: 60px;">
		
		<!-- 1st row -->
		<jsp:include page="/WEB-INF/views/review/film_header.jsp"/>
        
        <!-- 2nd row -->
        <div class="col-3 col-sm-12" id="div_review">
            <!-- 리뷰 내용 -->
			<div id="div_review">
				<p id="board-text1">${ review.rvNickname }</p>
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
			            13
			        </div>
 			        <div class="col-sm-3">
			            <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 55%;">
			                <button class="btn btn-primary" type="button">수정</button>
			                <button class="btn btn-primary" type="button">삭제</button>
			            </div>        
			        </div> 
			    </div>
			</div>
			<br>
            <!-- 리뷰 내용 끝-->
            
            <!-- 댓글 테이블 -->
            <div id="div_review">
            <table class="table table-hover" id="review_reply">
                <tbody >
                	<c:forEach var="reviewCmt" items="${ reviewCmt }">
                    <tr>
                        <td id="board-text4">${ reviewCmt.cmtNickname }</td>
                        <td id="board-text5">${ reviewCmt.cmtContent }</td>
                        <td id="board-text7">
                            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                <button class="btn btn-primary" type="button">수정</button>
                                <button class="btn btn-primary" type="button">삭제</button>
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
                    <textarea style="border: none; resize: none; width: 100%;"></textarea>
                </div>
                <div class="text-right mt-1">
                    <button class="btn btn-primary" type="button"
                    style="margin-left:45%; height: 35px;">등록</button>
                </div>
            </div>
        </div>
        </div>
        <!-- 2nd row 끝 -->

    </div>
    <!-- 내용 전체 컨테이너 끝 -->    
    
	<script>
	</script>    

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>