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
            <p class="titleText">내 파티 관리</p>
            <div class="line"></div>

            <form action="">
                <div class="formBox">
                    <ul class="form-list">
                        <li>
                            <label for="">공유서비스</label>
                            <p class="text">넷플릭스</p>
                        </li>
                        <li>
                            <label for="">아이디</label>
                            <input type="text" name="" value="${P_SHARE_ID}" id="" readonly>
                        </li>
                        <li>
                            <label for="">비밀번호</label>
                            <input type="text" name="" value="${P_SHARE_PWD}" readonly>
                        </li>
                        <li>
                            <label for="">파티원 수</label>
                            <p class="text">2 / 5 명</p>
                        </li>
                        <li>
                            <label for="">파티원 ID</label>
                            <p class="text">${m_id}, ${m_id}</p>
                        </li>
                        <li>
                            <label for="">파티 시작일</label>
                            <p class="text">${P_START_DATE}</p>
                        </li>
                        <li>
                            <label for="">파티 종료일</label>
                            <p class="text">${P_END_DATE}</p>
                        </li>
                        
                    </ul>

                    <div class="btnBox">
                        <button type="submit" class="btn">수정하기</button>
                        <button type="" class="btn redBtn">삭제하기</button>
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>