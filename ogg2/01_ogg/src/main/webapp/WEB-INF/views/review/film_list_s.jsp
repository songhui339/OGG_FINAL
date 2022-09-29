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
    
   	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <!-- 내용 전체 컨테이너 -->
    <br><br><br><br><br>
    <div class="container" style="margin-bottom: 100px; margin-top: 40px;">

        <div class="row">
            <div class="col" style="margin-left: 5%;">
                <p class="row_name">박스오피스 순위 </p>
            </div>
            <div class="col">
            </div>
            <div class="col">
                <input type="text" id="searchInput" style="margin-left: 35%; margin-top:5px; 
                        height: 34px; width:140px; border: 1px solid lightgray">
                <button class="btn btn-primary" type="button" style="display: inline; height: 35px; margin-bottom: 5px;"
                		id="searchBtn">검색</button>
            </div>
            <hr>
        </div>
        
        <!-- 1st row -->
        <div id="carouselExampleControls1" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
            <div class="carousel-item active">
                <!-- 첫번째 슬라이드 -->
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5" id="carousel01">
                
				<c:forEach var="film" begin="0" end="4" items="${ list }">
	            <div class="col">
	            	<a href="${path}/review/film_detail?keyword=${ film.title }&year=${ film.pubDate }" >
		                <div class="card" id="card_film">
							<c:choose>
								<c:when test="${!empty film.image }">
									<img id="img_film" alt="${ film.title }" src="${ film.image }">
								</c:when>
								<c:when test="${empty film.image }">
		                            <img id="img_film">
								</c:when>
							</c:choose>
		                    <div class="card-body">
		                        <div id="card-text1">${ film.title }</div>
		                        <div id="card-text2">${ film.director } ${ film.pubDate }</div>
		                        <div id="card-text3">${ film.subtitle }</div>
		                    </div>
		                </div>
	            	</a>
	            </div>
				</c:forEach>

                </div>
            </div>

            <!-- 두번째 슬라이드 -->
            <div class="carousel-item">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5" id="carousel01">
                
				<c:forEach var="film" begin="5" end="9" items="${ list }">
	            <div class="col">
	            	<a href="${path}/review/film_detail?keyword=${ film.title }&year=${ film.pubDate }" >
		                <div class="card" id="card_film">
							<c:choose>
								<c:when test="${!empty film.image }">
									<img id="img_film" alt="${ film.title }" src="${ film.image }">
								</c:when>
								<c:when test="${empty film.image }">
		                            <img id="img_film">
								</c:when>
							</c:choose>
		                    <div class="card-body">
		                        <div id="card-text1">${ film.title }</div>
		                        <div id="card-text2">${ film.director } ${ film.pubDate }</div>
		                        <div id="card-text3">${ film.subtitle }</div>
		                    </div>
		                </div>
	            	</a>
	            </div>
				</c:forEach>

                </div>
            </div>

        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls1" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
        </div>
        <!-- 2nd row 끝 -->

        <div style="margin-top: 40px; margin-bottom: 20px;">
            <p class="row_name" style="margin-left: 5%;">내가 찜한 작품</p>
            <hr>
        </div>

        <!-- 2nd row -->
        <div id="carouselExampleControls2" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
            <div class="carousel-item active">
                <!-- 첫번째 슬라이드 -->
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5" id="carousel01">
                
                    <div class="col">
                        <div class="card" id="card_film">
                            <img src="${path}/images/review/poster.jpeg" id="img_film">
                            <div class="card-body">
                                <div id="card-text1">헌트2</div>
                                <div id="card-text2">2022 ・ 한국</div>
                                <div id="card-text3">예매율 19% ・ 누적 관객 321만명</div>
                            </div>
                        </div>
                    </div>
 
                </div>
            </div>

            <!-- 두번째 슬라이드 -->
            <div class="carousel-item">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5" id="carousel01">
                
                    <div class="col">
                        <div class="card" id="card_film">
                            <img src="${path}/images/review/poster.jpeg" id="img_film">
                            <div class="card-body">
                                <div id="card-text1">헌트2</div>
                                <div id="card-text2">2022 ・ 한국</div>
                                <div id="card-text3">예매율 19% ・ 누적 관객 321만명</div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls2" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
        </div>
        <!-- 2nd row 끝 -->

        <div style="margin-top: 40px; margin-bottom: 20px;">
            <p class="row_name" style="margin-left: 5%;">신작 순위</p>
            <hr>
        </div>

        <!-- 3rd row -->
        <div id="carouselExampleControls3" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
            <div class="carousel-item active">
                <!-- 첫번째 슬라이드 -->
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5" id="carousel01">
                
                    <div class="col">
                        <div class="card" id="card_film">
                            <img src="${path}/images/review/poster.jpeg" id="img_film">
                            <div class="card-body">
                                <div id="card-text1">헌트</div>
                                <div id="card-text2">2022 ・ 한국</div>
                                <div id="card-text3">예매율 19% ・ 누적 관객 321만명</div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>

            <!-- 두번째 슬라이드 -->
            <div class="carousel-item">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5" id="carousel01">
                
                    <div class="col">
                        <div class="card" id="card_film">
                            <img src="${path}/images/review/poster.jpeg" id="img_film">
                            <div class="card-body">
                                <div id="card-text1">헌트2</div>
                                <div id="card-text2">2022 ・ 한국</div>
                                <div id="card-text3">예매율 19% ・ 누적 관객 321만명</div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>

        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls3" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
        </div>
        <!-- 3rd row 끝 -->

    </div>
    <!-- 내용 전체 컨테이너 끝 -->
    
    <script>

		$("#searchBtn").on("click", () => {
			var keyword = $("#searchInput").val();
				
		    location.href="${path}/review/film_search?keyword="+keyword+"&page=";
		});
    
	</script>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
