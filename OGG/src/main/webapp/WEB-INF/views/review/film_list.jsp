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
    <script defer src="${path}/js/review/film_main.js"></script>

    <!-- 내용 전체 컨테이너 -->
    <div class="container" style="margin-bottom: 100px; margin-top: 40px;">

        <div class="row">
            <div class="col" style="margin-left: 5%;">
                <p class="row_name">인기 영화 </p>
            </div>
            <div class="col">
            </div>
            <div class="col">
                <input type="text" class="form-control" id="searchInput" style="width:140px; margin-left: 35%; margin-top:5px; display: inline-block; border: 1px solid lightgray;">
                <button class="btn btn-primary" type="button" style="display: inline; height: 36px; margin-bottom: 5px;"
                		id="searchBtn">검색</button>
            </div>
            <hr>
        </div>
        
        <!-- 1st row -->
        <div id="carouselExampleControls1" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
            <!-- 첫번째 슬라이드 -->
            <div class="carousel-item active" id="carousel1">
            </div>

            <!-- 두번째 슬라이드 -->
            <div class="carousel-item" id="carousel2">
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
        <!-- 1st row 끝 -->

        <div style="margin-top: 40px; margin-bottom: 20px;">
            <p class="row_name" style="margin-left: 5%;">인기 드라마</p>
            <hr>
        </div>

        <!-- 2nd row -->
        <div id="carouselExampleControls2" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
            <!-- 첫번째 슬라이드 -->
            <div class="carousel-item active" id="carousel3">
            </div>

            <!-- 두번째 슬라이드 -->
            <div class="carousel-item" id="carousel4">
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
            <p class="row_name" style="margin-left: 5%;">평점이 높은 작품</p>
            <hr>
        </div>

        <!-- 3rd row -->
        <div id="carouselExampleControls3" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
            <!-- 첫번째 슬라이드 -->
            <div class="carousel-item active" id="carousel5">
            </div>

            <!-- 두번째 슬라이드 -->
            <div class="carousel-item" id="carousel6">
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
        <div id="mylikes">
        <div style="margin-top: 40px; margin-bottom: 20px;">
            <p class="row_name" style="margin-left: 5%;">내가 찜한 작품</p>
            <hr>
        </div>

        <!-- 찜한 영화 -->
        <div id="carouselExampleControls0" class="carousel slide" data-bs-touch="false"">
            <div class="carousel-inner">
            <!-- 첫번째 슬라이드 -->
            <div class="carousel-item active" id="carousel0">
            </div>

            <!-- 두번째 슬라이드 -->
            <div class="carousel-item" id="carousel9">
            </div>

        </div>
        <button id="likebutton1" class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls0" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button id="likebutton2" class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls0" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
        </div>
        </div>
        <!-- 찜한 영화 끝 -->

    </div>
    <!-- 내용 전체 컨테이너 끝 -->
    
    <script>
		$("#searchBtn").on("click", () => {
			var keyword = $("#searchInput").val();
			var type = $("#searchType").val();
			
            if(!keyword){
                alert('검색어를 입력해주세요');
            }else{
                location.href="${path}/film/search?type=" + type + "&keyword=" + keyword;
            }
		});
	
		let searchkeyword = "[[${searchkeyword}]]";
		let searchtype = "[[${searchtype}]]";
		var contextpath = "${ pageContext.request.contextPath }";
	</script>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
