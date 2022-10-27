<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- 커뮤니티 페이지 CSS -->
    <link rel="stylesheet" href="${path}/css/community/ogg_community.css" class="css">

        <section class="community_section">

            <div class="pageTitleBox">
                <h2 class="titleText">
	                <img src="${ path }/images/community/icon_chat.png" alt="icon" class="iconImg">
					 커뮤니티
				 </h2>
                <button onclick="location.href='${path}/community/goWrite.do'" class="btn writeBtn">글쓰기 <i class="bi bi-pencil"></i></button>
            </div>

            <div class="listBox">
                <table class="table listTable">
                    <thead class="tHeader">
                        <tr>
                            <th scope="col">No</th>
                            <th scope="col">제목</th>
                            <th scope="col">작성자</th>
                            <th scope="col">작성일</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:if test="${ empty list }">
							<tr>
								<td colspan="5">
									조회된 게시글이 없습니다.
								</td>
							</tr>	
						</c:if>
						
						<c:if test="${ not empty list }">
							<c:forEach var="community" items="${ list }">
		                        <tr onclick="location.href='${ path }/community/view.do?c_no=${ community.c_no }';" class="boardItem">
		                            <th scope="row">${ community.c_no }</th>
		                            <td>${ community.c_title }</td>
		                            <td>${ community.m_nickName }</td>
		                            <td><fmt:formatDate type="date" value="${ community.c_writeDate }"/></td>
		                            <td>${ community.c_viewCount }</td>
		                        </tr>
	                        </c:forEach>
                        </c:if>
                    </tbody>
                    
                </table>
            </div>
			<c:if test="${ not empty list }">
	            <!-- Page 네비게이션 -->
	            <div class="pageNav" id="pageBar">
	                <!-- 맨 처음으로 -->
	                <button class="btn arrowBtn" onclick="getList(1);">&lt;&lt;</button>
	    
	                <!-- 이전 페이지로 -->
	                <button class="btn arrowBtn" onclick="getList(${ pageInfo.prevPage });">&lt;</button>
	    
	                <!--  10개 페이지 목록 -->
	                <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
	                    <c:if test="${ status.current == pageInfo.currentPage }">
	                        <button class="btn" disabled>${ status.current }</button>
	                    </c:if>
	                    <c:if test="${ status.current != pageInfo.currentPage }">
	                        <button class="btn pageNoBtn" onclick="getList(${ status.current });">${ status.current }</button>
	                    </c:if>
	                 </c:forEach>
	    
	                <!-- 다음 페이지로 -->
	                <button class="btn arrowBtn" onclick="getList(${ pageInfo.nextPage });">&gt;</button>
	    
	                <!-- 맨 끝으로 -->
	                <button class="btn arrowBtn" onclick="getList(${ pageInfo.maxPage });">&gt;&gt;</button>
	            </div>
            </c:if>

            <!-- 검색 -->
            <div class="searchBox">
                <select name="sType" id="sType" class="form-select searchCategory" aria-label="Default select example" style="display: inline; width: 100px;">
                    <option value="subject">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" name="sValue" id="sValue" value="${preventSearchValue}" />
                <button type="button" onclick="getList(1);" class="btn searchBtn"><i class="bi bi-search"></i> 검색</button>
            </div>

        </section>
		<script type="text/javascript">
		
			$( document ).ready(function() {
				if ( "${preventSearchType}" != null && "${preventSearchType}" != '' ) {
					$("#sType").val("${preventSearchType}");
				}
			});
		
			function getList(page) {
				var url = "${ path }/community/list.do?";
				
				var sType = document.getElementById('sType').value;
				var sValue = document.getElementById('sValue').value;
				
			    if ( sValue != '' || sValue != null ) {
			    	location.href=url + 'page=' + page + '&sType=' + sType + '&sValue=' + sValue;
			    } else {
			    	location.href=url + 'page=' + page;
			    }
			}
		</script>
    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
   		 
   		 
   		 
   		 
   		 