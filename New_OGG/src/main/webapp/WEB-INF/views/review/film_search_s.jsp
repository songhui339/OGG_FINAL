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
                <p class="row_name">검색 결과 </p>
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
        
        <!-- 반복 시작 -->
        <!-- 1st row -->
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5" id="carousel01">
        
       	<c:if test="${ empty list }">
       		<br>
        	<center> 조회된 결과가 없습니다.</center>
        	<br><br>
        </c:if>
        
        <c:if test="${ not empty list }">
			<c:forEach var="film" items="${ list }">
            <div class="col">
	            <a href="${path}/review/film_detail?keyword=${ film.title }&year=${ film.pubDate }" >
                <div class="card" id="card_film3">
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
		</c:if>
        </div>
        <!-- 1st row 끝 -->
        <br>
        <!-- 반복 끝 -->

    </div>
    <!-- row end -->

    <!-- 페이징 -->
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-4"></div>
    </div>
    <!-- 페이징 끝 -->

    <!-- </div> -->
    <!-- 내용 전체 컨테이너 끝 -->
    <script>

		$("#searchBtn").on("click", () => {
			var keyword = $("#searchInput").val();
				
		    location.href="${path}/review/film_search?keyword="+keyword+"&page=";
		});
    
	</script>
    
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>