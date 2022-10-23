<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ path }/css/party/ogg_submitParty.css">

<section class="submitParty_section">
    <div class="itemListWrap">
        <h2 class="titleText">
            <a href="#" class="titleText">
                <i class="bi bi-chevron-left"></i> 파티 가입하기
            </a>
        </h2>

        <div class="itemBoxWrap">
            <!-- 파티 가입하기 박스 -->
            <c:if test="${ not empty list }">
            	<c:forEach var="list" items="${ list }">
            		<div class="itemBox" onclick="location.href='${path}/party/partyDetail?no=${list.p_no}'">
                		<div class="title">
                    		<div class="logoImg">
                        		<img src="${ path }/images/party/${ list.ott_thumb }.png" alt="logoImg">
                    		</div>
		                    <div class="titleText">
		                        <p class="text">${ list.plan_name }</p>
		                        <p class="subText">파티모집 / 즉시시청 / 빠른 대응</p>
		                    </div>
                		</div>
                
		                <div class="item-members">
		                    <span class="item-member"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small.png" alt=""></span>
		                    <span class="item-member"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small-glay.png" alt=""></span>
		                    <span class="item-member"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small-glay.png" alt=""></span>
		                    <span class="item-member"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small-glay.png" alt=""></span>
		                </div>
                
		                <div class="item-info">
		                    <div class="item-date">
		                        ${ list.p_end_date }<span class="pc-inline">까지</span>(<strong>24</strong>일)
		                    </div>
		                    <div class="item-price"><span class="price">3,936</span>원</div>
		                </div>
            		</div>
                </c:forEach>
            </c:if>
        </div>
    </div>
    <!-- 하단 배너 -->
    <div class="bannerWrap">

        <div class="bannerBox">
            <p class="titleText">원하는 파티가 없다면</p>
            
            <div class="button">
                <a href="#">파티 만들기</a>
            </div>
        </div>
    </div>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>