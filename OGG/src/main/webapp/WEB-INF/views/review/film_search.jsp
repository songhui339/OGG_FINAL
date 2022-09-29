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
    <script defer src="${path}/js/review/film_search.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    
    <!-- 내용 전체 컨테이너 -->
    <br><br><br><br><br>
    <div class="container" style="margin-bottom: 100px; margin-top: 40px;">

        <div class="row">
            <div class="col" style="margin-left: 5%;">
                <p class="row_name">검색 결과</p>
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
        <div id="search1" class="carousel slide" data-bs-ride="carousel">
            
        </div>
        <!-- 1st row 끝 -->

    </div>
    <!-- 내용 전체 컨테이너 끝 -->
    
    <script>
		$("#searchBtn").on("click", () => {
			var keyword = $("#searchInput").val();
			
		    location.href="${path}/review/film_search?keyword="+keyword;
		});
	
		let searchkeyword = "[[${searchkeyword}]]";
		var contextpath = "${ pageContext.request.contextPath }";
	</script>
	
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>