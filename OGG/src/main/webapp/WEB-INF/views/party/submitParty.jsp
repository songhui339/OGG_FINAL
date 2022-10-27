<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ path }/css/party/ogg_party.css">

<script src="${ path }/js/party/ott_menu.js"></script>


<section class="createParty_section">
        <div class="titleBox">
            <h2>어떤 파티를 이용하시겠어요?</h2>
        </div>

        <!-- 탭 버튼 부분 -->
        <div class="createPartyTab_row_01">
            <div>
                <div class="btn_container">
                    <section>
                        <div id="createPartyTab_Icon_01" class="btnBox active">
                            <div class="textItem">
                            <p class="text">전체</p> 
                            </div>
                        </div>
                        <div id="createPartyTab_Icon_02" class="btnBox">
                            <div class="textItem">
                            <p class="text">미디어</p> 
                            </div>
                        </div>
                        <div id="createPartyTab_Icon_03" class="btnBox">
                            <div class="textItem">
                            <p class="text">게임</p> 
                            </div>
                        </div>
                        <div id="createPartyTab_Icon_04" class="btnBox">
                            <div class="textItem">
                            <p class="text">교육/도서</p> 
                            </div>
                        </div>
                        <div id="createPartyTab_Icon_05" class="btnBox">
                            <div class="textItem">
                            <p class="text">유틸리티</p> 
                            </div>
                        </div>
                        <div id="createPartyTab_Icon_06" class="btnBox">
                            <div class="textItem">
                            <p class="text">멤버십</p> 
                            </div>
                        </div>
                    </section>
                </div>
        
            </div>
        </div>

        <!-- 탭 콘텐츠 부분 -->
        <div class="createPartyTab_row_02">
                <!-- 전체 서비스  -->
                <section class="content_container">
                    <div class="contentBox">
                    	<c:if test="${ not empty list }">
                    		<c:forEach var="list" items="${ list }">
                    			<div class="itemBox ${ list.ott_class }" onclick="location.href='${path}/party/findPartyList?ottName=${list.ott_name}'" !hidden>
                    				<input type=hidden value="${ list.ott_name }">
		                            <img src="${ path }/images/party/${ list.ott_thumb }.png" alt="logoImg" class="logoImg" id="thumb_url">
		                            <span class="serviceNameText">${ list.ott_name }</span>
		                            <p class="saveText">매달 이용료</p>
		                            <div class="priceWrap">
		                                ~ ${ list.plan_each_price }원
		                                <c:if test="${ not empty list.ott_status }">
		                            		<img src="${ path }/images/party/${ list.ott_status }.png" alt="badge_hot" class="badgeIcon">
		                            	</c:if>
                            		</div>
                    			</div>
                    		</c:forEach>
                    	</c:if>
                    	<input type="hidden" value="" id="hd_ottName">
                    </div>
                </section>
        </div>
    </section>
    
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>  