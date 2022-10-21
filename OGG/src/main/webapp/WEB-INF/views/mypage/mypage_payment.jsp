<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ path }/css/mypage/ogg_myPage.css">

<section class="myPage_section">
    <div class="myPage_Wrap">
        <!-- 메뉴 영역 -->
        <div class="menuBox">
            <div class="box01 longver">
                <div class="menuList">
                    <p class="titleText">회원 정보 관리</p>
                    <!-- <hr> -->
                    <a href="${ path }/mypage/main">
                        <div class="item">회원 정보 수정 / 탈퇴</div>
                    </a>
                    <a href="${ path }/mypage/party">
                        <div class="item">내 파티 관리</div>
                    </a>
                    <a href="${ path }/mypage/board">
                        <div class="item">내 게시글 관리</div>
                    </a>
                    <a href="${ path }/mypage/contents">
                        <div class="item">찜한 컨텐츠</div>
                    </a>
                </div>

                <div class="menuList">
                    <p class="titleText" style="margin-top: 32px;">결제 정보 관리</p>
                    <!-- <hr> -->
                    <a href="${ path }/mypage/payment">
                        <div class="item">결제 수단 / 계좌 관리</div>
                    </a>
                    <a href="${ path }/mypage/point">
                        <div class="item">포인트 관리</div>
                    </a>
                    <a href="${ path }/mypage/payment_history">
                        <div class="item">정산 내역 확인</div>
                    </a>
                    
                </div>
            </div>

            <div class="box02">
                <div class="notice" onclick="location.href='${ path }/mypage/notice';">
                    <!-- <img src="https://linkid.pw/static/media/ic-speaker-24.b2c49cdf.svg" alt="" style="width: 24px; height: 24px; vertical-align: baseline;"> -->
                    <i class="bi bi-megaphone"></i>
                    <p class="text">공지사항</p>
                </div>
                <div class="notice" onclick="location.href='${ path }/mypage/ask';">
                    <i class="bi bi-chat-left-text"></i>
                    <p class="text">1:1 문의 내역</p>
                </div>
            </div>

            
        </div>

        <!-- 정보 영역 -->
        <div class="infoBox">
            <p class="titleText">결제 수단 / 계좌 관리</p>
            <div class="line"></div>
            <form action="">
                <div class="formBox">
                    <ul class="form-list">
                        <li>
                            <label for="">결제 카드 번호</label>
                            <input type="text" name="" value="${ cardNo }" id="">
                        </li>
                        <li>
                            <label for="">계좌 은행</label>
                            <select class="form-select" aria-label="Default select example" style="width: 300px;">
                                <option value="">은행명을 선택하세요</option>
                                <option value="35">경남은행</option>
                                <option value="29">광주은행</option>
                                <option value="7">국민은행</option>
                                <option value="5">기업은행</option>
                                <option value="15">농협중앙회</option>
                                <option value="17">농협회원조합</option>
                                <option value="25">대구은행</option>
                                <option value="47">도이치은행</option>
                                <option value="27">부산은행</option>
                                <option value="3">산업은행</option>
                                <option value="41">상호저축은행</option>
                                <option value="37">새마을금고</option>
                                <option value="11">수협중앙회</option>
                                <option value="36">신한금융투자</option>
                                <option value="60">신한은행</option>
                                <option value="39">신협중앙회</option>
                                <option value="9">외환은행</option>
                                <option value="19">우리은행</option>
                                <option value="56">우체국</option>
                                <option value="33">전북은행</option>
                                <option value="31">제주은행</option>
                                <option value="68">카카오뱅크</option>
                                <option value="67">케이뱅크</option>
                                <option value="59">하나은행</option>
                                <option value="23">한국씨티은행</option>
                                <option value="45">HSBC은행</option>
                                <option value="21">SC제일은행</option>
                            </select>
                        </li>
                        <li>
                            <label for="">계좌 번호</label>
                            <input type="text" name="" value="${ bankAccount }" id="">
                        </li>
                        <li>
                            <label for="">OGG 정산일</label>
                            <select class="form-select" aria-label="Default select example" style="width: 300px;">
                                <option selected>선택</option>
                                <option value="1">매달 1일</option>
                                <option value="5">매달 5일</option>
                                <option value="10">매달 10일</option>
                                <option value="15">매달 15일</option>
                                <option value="20">매달 20일</option>
                                <option value="25">매달 25일</option>
                                <option value="lastday">매달 말일</option>
                            </select>
                        </li>
                    </ul>

                    <div class="btnBox">
                        <button type="submit" class="btn">수정하기</button>
                    </div>
                </div>
            </form>
        </div>

        <!-- 배너 영역 -->
        <div class="bannerBox">
            <div class="banner">
                <p class="text">더 궁금한 내용이 있으신가요?</p>
                <div class="imgNbtn">
                    <a href="${ path }/faq">FAQ 자세히 보기<i class="bi bi-chevron-right"></i></a>
                    <img src="${ path }/images/common/img_faqBanner.png" alt="faq" class="question">
                </div>
            </div>
        </div>

    </div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>