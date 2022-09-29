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
    <link rel="stylesheet" href="${path}/css/review/ogg_review.css">
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <!-- 내용 전체 컨테이너 -->
    <br><br><br><br><br>
    <div class="container" style="margin-bottom: 100px; padding-left: 60px; padding-right: 60px;">

		<!-- 1st row -->
		<jsp:include page="/WEB-INF/views/review/film_header.jsp"/>

        <!-- 2nd row -->
        <div id="div_review">
            <div class="row" id="detail-text3">
                <div class="col-3">이 작품에 대한 평가를 남겨보세요</div>
                <!-- <div class="col-9"><button class="btn btn-primary" type="button">코멘트 남기기</button></div> -->
                <div class="col-9"><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever=" 남기기">코멘트 남기기</button></div>
            </div>
        </div>
        <br>

        <!-- 모달 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">영화 이름</h5>
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
                        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button> -->
                        <button type="button" class="btn btn-primary" onclick="leavecomment();">저장</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 3rd row -->
        <div class="col-3 col-sm-12" id="div_review" >
            <p id="detail-text1">기본 정보</p>
            <hr>
            <p id="detail-text2">${ film.title } <br>${ film.director } ${ film.pubDate }<br>${ film.actor }</p>
            <br>
            <p id="detail-text3">
                산 정상에서 추락한 한 남자의 변사 사건. 담당 형사 '해준'(박해일)은 사망자의 아내 '서래'(탕웨이)와 마주하게 된다.
                <br><br>
                “산에 가서 안 오면 걱정했어요, 마침내 죽을까 봐.”
                <br><br>
                남편의 죽음 앞에서 특별한 동요를 보이지 않는 서래. 경찰은 보통의 유가족과는 다른 서래를 용의선상에 올린다. 해준은 사건 당일의 알리바이 탐문과 신문, 잠복수사를 통해 서래를 알아가면서 그녀에 대한 관심이 점점 커져가는 것을 느낀다. 한편, 좀처럼 속을 짐작하기 어려운 서래는 상대가 자신을 의심한다는 것을 알면서도 조금의 망설임도 없이 해준을 대하는데….
                <br><br>
                진심을 숨기는 용의자<br>
                용의자에게 의심과 관심을 동시에 느끼는 형사<br>
                그들의 <헤어질 결심><br>
            </p>
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
            <p id="detail-text1">코멘트 <a href="${path}/review/review_list" id="more-text1" style="margin-left: 90%;">더보기</a></p>
            <hr>

            <!-- div -->
            <div class="container">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4" id="card_review_row">
                    <div class="col">
                        <!-- 리뷰 카드 -->
                        <div class="card" id="card_review">
                            <div class="card-body">
                                <p id="detail-text1">작성자</p>
                                <hr>
                                <p id="detail-text3">
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                </p><hr>
                                    <div class="row" id="detail-text">
                                        <div class="col">
                                            <img src="${path}/images/review/heart2.png" style="margin-left: 10px;" height="26px;">
                                            273
                                        </div>
                                        <div class="col">
                                            <img src="${path}/images/review/comment2.png"  height="26px;">
                                            13
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <!-- 리뷰 카드 -->
                        <div class="card" id="card_review">
                            <div class="card-body">
                                <p id="detail-text1">작성자</p>
                                <hr>
                                <p id="detail-text3">
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                </p><hr>
                                    <div class="row" id="detail-text">
                                        <div class="col">
                                            <img src="${path}/images/review/heart2.png" style="margin-left: 10px;" height="26px;">
                                            273
                                        </div>
                                        <div class="col">
                                            <img src="${path}/images/review/comment2.png"  height="26px;">
                                            13
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <!-- 리뷰 카드 -->
                        <div class="card" id="card_review">
                            <div class="card-body">
                                <p id="detail-text1">작성자</p>
                                <hr>
                                <p id="detail-text3">
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                </p><hr>
                                    <div class="row" id="detail-text">
                                        <div class="col">
                                            <img src="${path}/images/review/heart2.png" style="margin-left: 10px;" height="26px;">
                                            273
                                        </div>
                                        <div class="col">
                                            <img src="${path}/images/review/comment2.png"  height="26px;">
                                            13
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <!-- 리뷰 카드 -->
                        <div class="card" id="card_review">
                            <div class="card-body">
                                <p id="detail-text1">작성자</p>
                                <hr>
                                <p id="detail-text3">
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                    영화 리뷰 내용 <br>
                                </p><hr>
                                    <div class="row" id="detail-text">
                                        <div class="col">
                                            <img src="${path}/images/review/heart2.png" style="margin-left: 10px;" height="26px;">
                                            273
                                        </div>
                                        <div class="col">
                                            <img src="${path}/images/review/comment2.png"  height="26px;">
                                            13
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>

                    <!-- 리뷰 카드 끝 -->
                </div>
            </div>
            <!-- div 끝 -->
        </div>
        <br>

        <!-- 6th row -->
        <div class="col-4 col-sm-12" id="div_review">
            <p id="detail-text1">이 감독의 다른 작품 <a href="" id="more-text1" style="margin-left: 83%;">전체보기</a></p>
            <hr>

            <div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false">
                <div class="carousel-inner">
                    <!-- 첫번째 슬라이드 -->
                    <div class="carousel-item active">
                    <!-- 카드 이미지 -->
                    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4" id="carousel01">
                        <div class="col">
                            <div class="card" id="card_film2">
                                <img id="img_film2">
                                <div class="card-body">
                                    <div id="card-text1">헌트</div>
                                    <div id="card-text2">2022 ・ 한국</div>
                                    <div id="card-text3">예매율 19% ・ 누적 관객 321만명</div>
                                </div>
                            </div>
                        </div>
            
                        <div class="col">
                            <div class="card" id="card_film2">
                                <img id="img_film2">
                                <div class="card-body">
                                    <div id="card-text1">육사오(6/45)</div>
                                    <div id="card-text2">2021 ・ 한국</div>
                                    <div id="card-text3">예매율 18% ・ 누적 관객 1만명</div>
                                </div>
                            </div>
                        </div>
            
                        <div class="col">
                            <div class="card" id="card_film2">
                                <img id="img_film2">
                                <div class="card-body">
                                    <div id="card-text1">불릿 트레인</div>
                                    <div id="card-text2">2022 ・ 미국</div>
                                    <div id="card-text3">예매율 14% ・ 누적 관객 1만명</div>
                                </div>
                            </div>
                        </div>
            
                        <div class="col">
                            <div class="card" id="card_film2">
                                <img id="img_film2">
                                <div class="card-body">
                                    <div id="card-text1">탑건: 매버릭</div>
                                    <div id="card-text2">2022 ・ 미국</div>
                                    <div id="card-text3">예매율 12% ・ 누적 관객 789만명</div>
                                </div>
                            </div>
                        </div>
                    </div>    
                    <!-- 카드 끝 -->
                </div>
                <!-- 첫번째 슬라이드 끝 -->

                <!-- 두번째 슬라이드 -->
                <div class="carousel-item">
                <!-- 카드 이미지 -->
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-4" id="carousel01">
                    <div class="col">
                        <div class="card" id="card_film2">
                            <img id="img_film2">
                            <div class="card-body">
                                <div id="card-text1">헌트</div>
                                <div id="card-text2">2022 ・ 한국</div>
                                <div id="card-text3">예매율 19% ・ 누적 관객 321만명</div>
                            </div>
                        </div>
                    </div>
        
                    <div class="col">
                        <div class="card" id="card_film2">
                            <img id="img_film2">
                            <div class="card-body">
                                <div id="card-text1">육사오(6/45)</div>
                                <div id="card-text2">2021 ・ 한국</div>
                                <div id="card-text3">예매율 18% ・ 누적 관객 1만명</div>
                            </div>
                        </div>
                    </div>
        
                    <div class="col">
                        <div class="card" id="card_film2">
                            <img id="img_film2">
                            <div class="card-body">
                                <div id="card-text1">불릿 트레인</div>
                                <div id="card-text2">2022 ・ 미국</div>
                                <div id="card-text3">예매율 14% ・ 누적 관객 1만명</div>
                            </div>
                        </div>
                    </div>
        
                    <div class="col">
                        <div class="card" id="card_film2">
                            <img id="img_film2">
                            <div class="card-body">
                                <div id="card-text1">탑건: 매버릭</div>
                                <div id="card-text2">2022 ・ 미국</div>
                                <div id="card-text3">예매율 12% ・ 누적 관객 789만명</div>
                            </div>
                        </div>
                    </div>
                </div>    
                <!-- 카드 끝 -->
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
            
        </div>
        </div>
        <!-- 6th row 끝 -->

    </div>
    <!-- 내용 전체 컨테이너 끝 -->

<script>
    $("#message-text").keyup(function(e) {
    //console.log("키업!");
    var content = $(this).val();
    $("#textLengthCheck").text("(" + content.length + " / 2000)"); //실시간 글자수 카운팅
    if (content.length > 2000) {
        alert("최대 2000자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 2000));
        $('#textLengthCheck').text("(2000 / 2000");
    }
});
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

    var exampleModal = document.getElementById('exampleModal')
    exampleModal.addEventListener('show.bs.modal', function (event) {
    // Button that triggered the modal
    var button = event.relatedTarget
    // Extract info from data-bs-* attributes
    var recipient = button.getAttribute('data-bs-whatever')
    // If necessary, you could initiate an AJAX request here
    // and then do the updating in a callback.
    //
    // Update the modal's content.
    var modalTitle = exampleModal.querySelector('.modal-title')
    var modalBodyInput = exampleModal.querySelector('.modal-body input')

    modalTitle.textContent = '코멘트' + recipient
    modalBodyInput.value = recipient
    })

    function leavecomment(){
        let message = document.getElementById('message-text').value

        console.log(message)
    }
    
    </script>
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	