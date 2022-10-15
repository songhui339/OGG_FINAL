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
                    <a href="#">
                        <div class="item">회원 정보 수정 / 탈퇴</div>
                    </a>
                    <a href="#">
                        <div class="item">내 파티 관리</div>
                    </a>
                    <a href="#">
                        <div class="item">내 게시글 관리</div>
                    </a>
                    <a href="#">
                        <div class="item">찜한 컨텐츠</div>
                    </a>
                </div>

                <div class="menuList">
                    <p class="titleText" style="margin-top: 32px;">결제 정보 관리</p>
                    <!-- <hr> -->
                    <a href="#">
                        <div class="item">결제 수단 / 계좌 관리</div>
                    </a>
                    <a href="#">
                        <div class="item">포인트 관리</div>
                    </a>
                    <a href="#">
                        <div class="item">정산 내역 확인</div>
                    </a>
                    
                </div>
            </div>

            <div class="box02">
                <div class="notice">
                    <!-- <img src="https://linkid.pw/static/media/ic-speaker-24.b2c49cdf.svg" alt="" style="width: 24px; height: 24px; vertical-align: baseline;"> -->
                    <i class="bi bi-megaphone"></i>
                    <p class="text">공지사항</p>
                </div>
                <div class="notice">
                    <i class="bi bi-chat-left-text"></i>
                    <p class="text">1:1 문의 내역</p>
                </div>
            </div>

            
        </div>

        <!-- 정보 영역 -->
        <div class="infoBox">
            <p class="titleText">회원 정보 수정</p>
            <div class="line"></div>
            <form action="">
                <div class="formBox">
                    <ul class="form-list">
                        <li>
                            <label for="">아이디</label>
                            <input type="text" name="" value="${m_id}" id="" readonly>
                        </li>
                        <li>
                            <label for="">비밀번호</label>
                            <input type="password" name="" placeholder="비밀번호" minlength="3" maxlength="20">
                        </li>
                        <li>
                            <label for="">비밀번호 확인</label>
                            <input type="password" name="" placeholder="비밀번호 확인" minlength="3" maxlength="20">
                        </li>
                        <li>
                            <label for="">이름</label>
                            <input type="text" value="${m_name}" name="" placeholder="이름" minlength="3" maxlength="20" id="">
                        </li>
                        <li>
                            <label for="">닉네임</label>
                            <input type="text" value="${m_name}" name="" placeholder="닉네임" minlength="3" maxlength="20" id="">
                        </li>
                        <li>
                            <label for="">이메일</label>
                            <input type="email" value="${m_email}" name="" placeholder="이메일" minlength="3" maxlength="20" id="">
                        </li>
                        <li>
                            <label for="">휴대폰 번호</label>
                            <input type="tel" value="${m_phone}" name="" placeholder="휴대폰 번호 입력" minlength="3" maxlength="20" id="">
                        </li>

                        <li>
                            <span class="subject">이메일 수신</span>
                            <input type="checkbox" name="" id="">
                            <span class="subject">SMS 수신</span>
                            <input type="checkbox" name="" id="">
                        </li>
                    </ul>

                    <div class="btnBox">
                        <button type="submit" class="btn">수정하기</button>
                        <button type="" class="btn redBtn">탈퇴하기</button>
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
                    <img src="img_faqBanner.png" alt="" class="question">
                </div>
            </div>
        </div>

    </div>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>