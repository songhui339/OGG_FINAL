<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ path }/css/party/ogg_submitParty.css">

<script src="${ path }/js/party/ogg_submitParty.js"></script>


<section class="submitParty_section">
    <div class="titleBox">
        <h2>어떤 파티에 가입하시겠어요?</h2>
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
                    <div class="itemBox mediaService" !hidden>
                        <img src="../파이널 UI 설계 이미지/logo_netflix.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">넷플릭스</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 11,775원
                            <img src="../파이널 UI 설계 이미지/badge_hot.png" alt="badge_hot" class="badgeIcon">
                        </div>
                    </div>

                    <div class="itemBox mediaService" !hidden> 
                        <img src="../파이널 UI 설계 이미지/logo_disney.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">디즈니 플러스</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 6,525원
                        </div>
                    </div>

                    <div class="itemBox mediaService" !hidden> 
                        <img src="../파이널 UI 설계 이미지/logo_tving.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">티빙</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 9,540원
                            <img src="../파이널 UI 설계 이미지/badge_hot.png" alt="badge_hot" class="badgeIcon">
                        </div>
                    </div>

                    <div class="itemBox mediaService" !hidden> 
                        <img src="../파이널 UI 설계 이미지/logo_appleTV.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">애플</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 16,1805원
                            <img src="../파이널 UI 설계 이미지/badge_hot.png" alt="badge_hot" class="badgeIcon">
                        </div>
                    </div>

                    <div class="itemBox mediaService" !hidden> 
                        <img src="../파이널 UI 설계 이미지/logo_wave.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">웨이브</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 9,540원
                        </div>
                    </div>

                    <div class="itemBox mediaService" !hidden> 
                        <img src="../파이널 UI 설계 이미지/logo_watcha.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">왓챠</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 8,820원
                            <img src="../파이널 UI 설계 이미지/badge_hot.png" alt="badge_hot" class="badgeIcon">
                        </div>
                    </div>

                    <div class="itemBox mediaService" !hidden> 
                        <img src="../파이널 UI 설계 이미지/logo_laftel.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">라프텔</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 10,260원
                        </div>
                    </div>

                    <div class="itemBox mediaService" !hidden> 
                        <img src="../파이널 UI 설계 이미지/logo_prime.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">프라임 비디오</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 4,200원
                        </div>
                    </div>

                    <div class="itemBox mediaService" !hidden> 
                        <img src="../파이널 UI 설계 이미지/logo_tennistv.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">테니스 TV</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 12,171원
                        </div>
                    </div>

                    <div class="itemBox mediaService" !hidden> 
                        <img src="../파이널 UI 설계 이미지/logo_happydoc.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">해피독TV</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 4,400원
                            <img src="../파이널 UI 설계 이미지/badge_new.png" alt="badge_hot" class="badgeIcon">
                        </div>
                    </div>

                    <div class="itemBox gameService" !hidden> 
                        <img src="../파이널 UI 설계 이미지/logo_nintendo.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">닌텐도</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 5,269원
                        </div>
                    </div>

                    <div class="itemBox eduService" !hidden>
                        <img src="../파이널 UI 설계 이미지/logo_cake.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">케이크</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 9,6500원
                            <img src="../파이널 UI 설계 이미지/badge_event.png" alt="badge_hot" class="badgeIcon">
                        </div>
                    </div>

                    <div class="itemBox eduService" !hidden> 
                        <img src="../파이널 UI 설계 이미지/logo_welaa.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">윌라</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 4,449원
                        </div>
                    </div>

                    <div class="itemBox utilityService" !hidden> 
                        <img src="../파이널 UI 설계 이미지/logo_msoffice.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">오피스 365</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 9,475원
                        </div>
                    </div>

                    <div class="itemBox membershipService" !hidden>
                        <img src="../파이널 UI 설계 이미지/logo_naverM.png" alt="logoImg" class="logoImg">
                        <span class="serviceNameText">네이버 플러스</span>
                        <p class="saveText">매달 세이브!</p>
                        <div class="priceWrap">
                            ~ 3,255원
                        </div>
                    </div>

                </div>
            </section>
    </div>
</section>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>