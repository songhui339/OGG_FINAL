<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- stylesheet -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.css"/>
    
    <!-- my CSS -->
    <link rel="stylesheet" href="${ path }/css/review/ogg_review.css">
    
    <!-- my JS -->
    <script defer src="${ path }/js/review/film_detail.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <!-- 내용 전체 컨테이너 -->
    <div class="container" style="margin-bottom: 100px; margin-top: 40px; padding-left: 60px; padding-right: 60px; ">
		
		<!-- 1st row -->
		<jsp:include page="/WEB-INF/views/review/film_header.jsp"/>

        <!-- 2nd row -->
        <c:if test="${ loginMember != null }">
	        <div id="div_review">
	            <div class="row" id="detail-text0">
	                <div class="col-3">이 작품에 대한 평가를 남겨보세요</div>
	                <div class="col-9"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reviewModal" data-bs-whatever="남기기">리뷰 남기기</button></div>
	            </div>
	        </div>
	        <br>
        </c:if>

        <c:if test="${ loginMember == null }">
	        <div id="div_review">
	            <div class="row" id="detail-text0" style="text-align : center;"> 
	                <div>로그인 후 평가를 남길 수 있습니다</div>
	            </div>
	        </div>
	        <br>
		</c:if>
        <!-- 모달 -->
        <div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header"id="modal-header">
                        <h5 class="modal-title" id="reviewModalLabel">영화 이름</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label"></label>
                            <textarea class="form-control" id="message-text" placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요." style="height: 300px;"></textarea>
                        </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <span id="textLengthCheck">(0 / 2000)</span>
                        <button type="button" class="btn btn-primary" id="writeReview" data-bs-dismiss="modal">저장</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 3rd row -->
        <div class="col-3 col-sm-12" id="filmDetail2">

        </div>    
        <br>

        <!-- 4th row -->
        <div class="col-3 col-sm-12" id="div_review">
            <p class="detail-text1">별점 그래프</p>
            <hr> 
            <div id="linechart"></div>
        </div>    
        <br>
        
        <!-- 5th row -->
        <div class="col-3 col-sm-12" id="div_review">
            <p id="detail-text1">리뷰 <a href="${ path }/review/review_list?fcode=${ fcode }&ftype=${ ftype }" id="more-text1" style="margin-left: 90%;">더보기</a></p>
            <hr>

            <!-- div -->
            <div class="container">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4" id="card_review_row">
                
                <c:if test="${ empty list }">
					작성된 리뷰가 없습니다.
					<br><br>
				</c:if>
                
                <c:if test="${ not empty list }">
					<!-- 기준으로 반복 -->
					<c:forEach var="review" begin="0" end="3" items="${ list }">
                    <div class="col">
                        <div class="card" id="card_review2">
                            <div class="card-body" style="position: relative;">
                                <p id="detail-text1">${ review.rvNickname }</p>
                                <hr>
                    				<a id="detail-text3" href="${ path }/review/review_detail?no=${ review.rvNo }&fcode=${ fcode }&ftype=${ ftype }">
		                            	${ review.rvContent }
                       				</a>
                                <div class="row" id="detail-text" style="position: absolute; width: 98%; left: 15px; bottom: 10px;">
		                        <hr>
                                    <div class="col">
                                        <img src="${ path }/images/review/heart2.png" style="margin-left: 10px; height: 26px;">
                                       	${ review.rvLikes }
                                    </div>
                                    <div class="col">
                                        <img src="${ path }/images/review/comment2.png" style="height: 26px;">
                                        ${ review.rvCmtCount }
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
					</c:forEach>
                </c:if>
                
                </div>
            </div>
            <!-- div 끝 -->
        </div>
        <br>

        <!-- 6th row -->
        <div class="col-4 col-sm-12" id="div_film">
		<p id='detail-text1'>이 감독의 추천 작품</p>
           <hr>
	       <div class="carousel-inner">
		        <!-- 첫번째 슬라이드 -->
		        <div class="carousel-item active" id="carousel1"></div>
	       </div>
        </div>
        <!-- 6th row 끝 -->

    </div>
    <!-- 내용 전체 컨테이너 끝 -->

	<script>
	fcode = "${ fcode }";
	ftype = "${ ftype }";
	m_no = "${ m_no }";
	contextpath = "${ pageContext.request.contextPath }";
	</script>
	
	<script>
	var chart = c3.generate({
	bindto: "#linechart",
	data: {
	    columns: [
	    ['data1', 30, 200, 100, 400, 150, 250],
	    ['data2', 50, 20, 10, 40, 15, 25]
	    ]
	}
	});
	
	reviewModal = document.getElementById('reviewModal')

	reviewModal.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget
        var recipient = button.getAttribute('data-bs-whatever')
        var modalTitle = reviewModal.querySelector('.modal-title')
        var modalBodyInput = reviewModal.querySelector('.modal-body input')
	
        modalTitle.textContent = '리뷰' + recipient
        modalBodyInput.value = recipient
	});
    </script>
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	