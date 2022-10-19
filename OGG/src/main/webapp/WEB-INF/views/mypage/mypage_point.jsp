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
            <p class="titleText">OGG 포인트</p>
            <div class="line"></div>

            <div class="pointBox">
                <div class="titleText">
                    <img src="https://linkid.pw/static/media/ic-linkidpoint-18.1f528a85.svg" alt="">
                    <span class="text">보유 포인트</span>
                </div>
                <div class="pointText">
                    <span class="text">${POINT} P</span>
                </div>
            </div>

            <table class="table" style="margin-top: 30px;">
                <thead>
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">날짜</th>
                        <th scope="col">내역</th>
                        <th scope="col">정산 포인트</th>
                    </tr>
                </thead>
                <tbody class="partyitem">
                    <tr>
                        <th scope="row">1</th>
                        <td>${C_TITLE}</td>
                        <td>${C_WRITEDATE}</td>
                        <td>${C_VIEWCOUNT}</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>${C_TITLE}</td>
                        <td>${C_WRITEDATE}</td>
                        <td>${C_VIEWCOUNT}</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>${C_TITLE}</td>
                        <td>${C_WRITEDATE}</td>
                        <td>${C_VIEWCOUNT}</td>
                    </tr>
                </tbody>
            </table>

            <!-- Page 네비게이션 -->
            <div class="pageNav" id="pageBar">
                <!-- 맨 처음으로 -->
                <button class="btn arrowBtn" onclick="location.href=''">&lt;&lt;</button>
    
                <!-- 이전 페이지로 -->
                <button class="btn arrowBtn" onclick="location.href=''">&lt;</button>
    
                <!--  10개 페이지 목록 -->
                    <button class="btn" disabled>${ status.current }</button>
                    <button class="btn pageNoBtn" onclick="location.href=''">2</button>
    
                <!-- 다음 페이지로 -->
                <button class="btn arrowBtn" onclick="location.href=''">&gt;</button>
    
                <!-- 맨 끝으로 -->
                <button class="btn arrowBtn" onclick="location.href=''">&gt;&gt;</button>
            </div>

            
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>