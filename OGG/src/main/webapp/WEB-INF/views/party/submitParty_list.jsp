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
            <a href="javascript:history.back()" class="titleText">
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
		                        <p class="subText">${ list.p_comment }</p>
		                    </div>
                		</div>
                
		                <input type="hidden" id="max_member" value="${ list.p_max_member }">
		                <input type="hidden" id="cur_member" value="${ list.p_cur_member }">
		                <div class="item-members">
		                	<c:forEach var="i" begin="0" end="${ list.p_max_member }" step="1">
		                		<c:if test="${ i <= list.p_cur_member }">
		                    		<span class="item-member"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small.png" alt=""></span>
		                		</c:if>
		                		<c:if test="${ i > list.p_cur_member }">
				                    <span class="item-member"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small-glay.png" alt=""></span>
		                		</c:if>
		                	</c:forEach>
		                </div>
                
		                <div class="item-info">
		                    <div class="item-date" id="period_day">
		                    <input type="hidden" id="end_date" value="${ list.p_end_date }">
		                        ${ list.p_end_date_output }<span class="pc-inline">까지</span>(<strong>${ list.p_period_day }</strong>일)
		                    </div>
		                    <div class="item-price"><span class="price">${ list.p_entry_price_output }</span>원</div>
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
                <a href="${ path }/party/ottlist">파티 만들기</a>
            </div>
        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>