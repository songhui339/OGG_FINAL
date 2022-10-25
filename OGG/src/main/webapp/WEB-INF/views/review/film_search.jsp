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
    
    <!-- 내용 전체 컨테이너 -->
    <div class="container" style="margin-bottom: 100px; margin-top: 40px;">

        <div class="row" style="maring-bottom: 20px;">
            <div class="col" style="margin-left: 5%;">
                <%-- <p class="row_name">검색 결과</p> --%>
            </div>
            <div class="col">
            </div>
            <div class="col">
                <%-- <select class="form-select" id="searchType" aria-label="Default select example" style="margin-left: 25%; width: 80px; display: inline-block;">
                    <option value="title" selected>영화</option>
                    <option value="writer">감독</option>
                </select> --%>
                <input type="text" class="form-control" id="searchInput" style="width:140px; margin-left: 35%; margin-top:5px; display: inline-block; border: 1px solid lightgray;">
                <%-- <input type="text" class="form-control" id="searchInput"
                style="display: inline-block; width:140px; border: 1px solid lightgray"> --%>
                <button class="btn btn-primary" type="button" style="display: inline; height: 36px; margin-bottom: 5px;"
                		id="searchBtn">검색</button>
            </div>
            <%-- <hr> --%>
        </div>
        
        <!-- 1st row -->
        <div class="searchdiv" id="searchdiv1">
        
        </div>
        <!-- 2nd row -->
        <div class="searchdiv" id="searchdiv2">
        
        </div>
        <!-- 3rd row -->
        <div class="searchdiv" id="searchdiv3">

        </div>
    </div>
    <!-- 내용 전체 컨테이너 끝 -->
    
    <script>
		$("#searchBtn").on("click", () => {
			var keyword = $("#searchInput").val();
			var type = $("#searchType").val();
			
            console.log(keyword);

            if(!keyword){
                alert('검색어를 입력해주세요');
            }else{
                location.href="${path}/film/search?type=" + type + "&keyword=" + keyword;
            }

		    // location.href="${path}/film/search?type=" + type + "&keyword=" + keyword;
		    location.href="${path}/film/search?keyword=" + keyword;
		});
	
		let searchkeyword = "[[${searchkeyword}]]";
		let searchtype = "[[${searchtype}]]";
		var contextpath = "${ pageContext.request.contextPath }";
	</script>
	
    <!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>