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

<style id="hi">
</style>

<!-- start -->
<div class="container">

	<!-- 1st row -->
	<jsp:include page="/WEB-INF/views/review/film_header.jsp"/>
    
    <!-- 2nd row -->
	<div id="fafa">
    <hr>
    <div class="col-3 col-sm-12" id="div_review">
        <p class="board-text1" style="margin-left: 10px;">리뷰</p>
		<hr>
        <!-- start review_content -->
		<c:if test="${ empty list }">
			<br><center> 작성된 리뷰가 없습니다. </center><br><br>
		</c:if>
		
		<c:if test="${ not empty list }">
			<c:forEach var="review" items="${ list }">
				<div id="div_review">
					<a href="${ path }/review/review_detail?no=${ review.rvNo }&fcode=${ fcode }&ftype=${ ftype }">
						<span id="board-text1">${ review.rvNickname }</span>
						<hr>
						<span id="board-text3">
							${ review.rvContent }
						</span>
					</a>
					<hr>
					<div class="row" id="detail-text">
					    <div class="col-sm-1">
							<img src="${ path }/images/review/heart2.png" id="reviewLikes" style="margin-left: 10px;" height="30px;">
							<img src="${ path }/images/review/heart3.png" id="reviewDisLikes" style="margin-left: 10px; display: none;" height="30px;">
							<span id="rvLikes">${ review.rvLikes }</span>
					    </div>
					    <div class="col-sm-8">
					        <img src="${ path }/images/review/comment2.png"  height="30px;">
					        ${ review.rvCmtCount }
					    </div>
					</div>
				</div>
				<br>
			</c:forEach>
		</c:if>
        <!-- end review_content-->

    </div>
    <!-- end 2nd row -->

    <br>
    
    <!-- start paging -->
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <ul class="pagination justify-content-center">
            	<!-- start page  -->
                <li class="page-item"><a class="page-link" href="${ path }/film/review_list?page=1&fcode=${ fcode }&ftype=${ ftype }">&lt;&lt;</a></li>
                
                <!-- prev page -->
                <li class="page-item"><a class="page-link" href="${ path }/film/review_list?page=${ pageInfo.prevPage }&fcode=${ fcode }&ftype=${ ftype }">&lt;</a></li>
                
                <!-- page list -->
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage }">
                  		<li class="page-item disabled"><a class="page-link" href="#">${ status.current }</a></li>
					</c:if>
					<c:if test="${ status.current != pageInfo.currentPage }">
                  		<li class="page-item"><a class="page-link" href="${ path }/film/review_list?page=${ status.current }&fcode=${ fcode }&ftype=${ ftype }">${ status.current }</a></li>
					</c:if>
				</c:forEach>
				  <!-- next page -->
				  <li class="page-item"><a class="page-link" href="${ path }/film/review_list?page=${ pageInfo.nextPage }&fcode=${ fcode }&ftype=${ ftype }">&gt;</a></li>
                  <!-- end page -->
                  <li class="page-item"><a class="page-link" href="${ path }/film/review_list?page=${ pageInfo.maxPage }&fcode=${ fcode }&ftype=${ ftype }">&gt;&gt;</a></li>
            </ul>
        </div>
    </div>
    <!-- end paging -->

</div>
<!-- end -->
    
<script>
	var fcode = "${fcode}";
	var ftype = "${ftype}";
	var contextpath = "${ pageContext.request.contextPath }";
</script>	

<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>