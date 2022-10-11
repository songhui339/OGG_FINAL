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
    <div class="container" style="margin-bottom: 100px; margin-top: 40px; padding-left: 60px; padding-right: 60px;">
    
		<!-- 1st row -->
		<jsp:include page="/WEB-INF/views/review/film_header.jsp"/>
        
        <!-- 2nd row -->
        <div class="col-3 col-sm-12" id="div_review">
            <p class="detail-text1" style="margin-left: 10px;">리뷰</p><hr>

            <!-- 리뷰 내용 -->
			<c:if test="${ empty list }">
				<br>
				<center> 작성된 리뷰가 없습니다. </center>
				<br><br>
			</c:if>
			
			<c:if test="${ not empty list }">
				<c:forEach var="review" items="${ list }">
					<div id="div_review">
						<a style="z-index:9999;" href="${ path }/review/review_detail?no=${ review.rvNo }&fcode=${ fcode }&ftype=${ ftype }">
						    <span id="board-text1">${ review.rvNickname }</span>
						    <hr>
						    <span id="board-text3">
								${ review.rvContent }
						    </span>
						</a>
						<hr>
					    <div class="row" id="detail-text">
					        <div class="col-sm-1">
					            <img src="${ path }/images/review/heart2.png" style="margin-left: 10px;" height="30px;">
					            ${ review.rvLikes }
					        </div>
					        <div class="col-sm-8">
					            <img src="${ path }/images/review/comment2.png"  height="30px;">
					            ${ review.rvCmtCount }
					        </div>
					        <!--<div class="col-sm-1"><button class="btn btn-primary" type="button">수정</button></div>
					        <div class="col-sm-1"><button class="btn btn-primary" type="button">삭제</button></div> -->
<!-- 					        <div class="col-sm-3">
					            <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 55%;">
					                <button class="btn btn-primary" type="button">수정</button>
					                <button class="btn btn-primary" type="button">삭제</button>
					            </div>        
					        </div> -->
					    </div>
					</div>
					<br>
				</c:forEach>
			</c:if>
            <!-- 리뷰 내용 끝-->

        </div>
        <!-- 2nd row 끝 -->

    <br>
    
    <!-- 페이징 -->
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <ul class="pagination justify-content-center">
            	<!-- 맨 처음으로 -->
                <li class="page-item"><a class="page-link" href="${ path }/review/review_list?page=1&fcode=${ fcode }&ftype=${ ftype }">&lt;&lt;</a></li>
                
                <!-- 이전 페이지로 -->
                <li class="page-item"><a class="page-link" href="${ path }/review/review_list?page=${ pageInfo.prevPage }&fcode=${ fcode }&ftype=${ ftype }">&lt;</a></li>
                
                <!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage }">
                  		<li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
					</c:if>
					<c:if test="${ status.current != pageInfo.currentPage }">
                  		<li class="page-item"><a class="page-link" href="${ path }/review/review_list?page=${ status.current }&fcode=${ fcode }&ftype=${ ftype }">${ status.current }</a></li>
					</c:if>
				</c:forEach>
				  <!-- 다음 페이지로 -->
				  <li class="page-item"><a class="page-link" href="${ path }/review/review_list?page=${ pageInfo.nextPage }&fcode=${ fcode }&ftype=${ ftype }">&gt;</a></li>
                  <!-- 맨 끝으로 -->
                  <li class="page-item"><a class="page-link" href="${ path }/review/review_list?page=${ pageInfo.maxPage }&fcode=${ fcode }&ftype=${ ftype }">&gt;&gt;</a></li>
            </ul>
        </div>
    </div>
    <!-- 페이징 끝 -->

    </div>
    <!-- 내용 전체 컨테이너 끝 -->
    
	<script>
		var fcode = "${fcode}";
		var ftype = "${ftype}";
		var contextpath = "${ pageContext.request.contextPath }";

	</script>	

    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>