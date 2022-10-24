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

    <!-- 내용 전체 컨테이너 -->
    <div class="container" style="margin-bottom: 100px; margin-top: 40px; padding-left: 60px; padding-right: 60px; ">
		
		<!-- 1st row -->
		<jsp:include page="/WEB-INF/views/review/film_header.jsp"/>

        <!-- 2nd row -->
        <c:if test="${ loginMember != null }">
            <c:if test="${ review == null }">
                <div id="div_review">
                    <div class="row" id="detail-text0">
                        <div class="col-3">이 작품에 대한 평가를 남겨보세요</div>
                        <div class="col-9"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#reviewModal" data-bs-whatever="남기기">리뷰 남기기</button></div>
                    </div>
                </div>
                <br>
            </c:if>
            <c:if test="${ review != null }">
                <div class="col-3 col-sm-12" id="div_review">
                    <p id="detail-text1">나의 리뷰</p>
                    <hr> 
                    <p id='detail-text6'>
                        <a href="${ path }/review/review_detail?no=${ review.rvNo }&fcode=${ fcode }&ftype=${ ftype }">
                            ${ review.rvContent }
                        <a>
                    </p></p>
                </div>
                <br>
            </c:if>
        </c:if>

        <c:if test="${ loginMember == null }">
	        <div id="div_review">
	            <div class="row" id="detail-text0" style="text-align : center;"> 
	                <div>로그인 후 평가를 남길 수 있습니다</div>
	            </div>
	        </div>
	        <br>
		</c:if>

        <!-- 3rd row -->
        <div class="col-3 col-sm-12" id="filmDetail2">

        </div>    
        <br>

        <!-- 4th row -->
        <div class="col-3 col-sm-12" id="div_review">
            <p id="detail-text1">별점 그래프</p>
            <hr> 
            <div id="linechart"></div>
        </div>    
        <br>
        
        <!-- 5th row -->
        <div class="col-3 col-sm-12" id="div_review">
            <p id="detail-text1">리뷰 <a href="${ path }/film/review_list?fcode=${ fcode }&ftype=${ ftype }" id="more-text1" style="margin-left: 90%;">더보기</a></p>
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
                                        <img src="${path}/images/review/heart2.png" id="reviewLikes" style="margin-left: 10px;" height="30px;">
                                        <img src="${path}/images/review/heart3.png" id="reviewDisLikes" style="margin-left: 10px; display: none;" height="30px;">
                                        <span id="rvLikes">${ review.rvLikes }</span>   
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

	// $(document).ready(function() {
        $.ajax({
            async: false,
            type : 'POST',
            url : contextpath + '/review/get_starrates',
            data : {
                'fCode' : fcode,
                'ftype' : ftype
            },
            success : function (data) {
            arr = [];
            result1 = 0;
            result2 = 0;
            result3 = 0;
            result4 = 0;
            result5 = 0;

            for (let i = 0; i < data.length; i++) {
                if (data[i].fstar == 1) {
                    result1++;
                }
                if (data[i].fstar == 2) {
                    result2++;
                }
                if (data[i].fstar == 3) {
                    result3++;
                }
                if (data[i].fstar == 4) {
                    result4++;
                }
                if (data[i].fstar == 5) {
                    result5++;
                }
            }
                // console.log('시작');
                // console.log(result1);
                // console.log(result2);
                // console.log(result3);
                // console.log(result4);
                // console.log(result5);
                // console.log('끝');

            },
            error: function (error) {
                console.log('그래프 통신 에러');
            }
        });

	var chart = c3.generate({
	bindto: "#linechart",
	data: {
        json:{
            num: [ 1, 2, 3, 4, 5 ],
            '평가자수': [ result1, result2, result3, result4, result5 ],
        },
        x: 'num',
        types:{
            num: 'line',
            평가자수: 'bar'
        }
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
	