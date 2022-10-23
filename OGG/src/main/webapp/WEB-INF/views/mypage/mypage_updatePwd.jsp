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
            <p class="titleText">비밀번호 변경</p>
            <div class="line"></div>
            <form action="${path}/mypage/updatePwd" method="post">
                <div class="formBox">
                    <ul class="form-list updatePwd">
                        <li>
                            <label for="m_pwd">현재 비밀번호</label>
                            <input type="password" name="m_pwd" id="m_pwd" minlength="3" maxlength="20" id="">
                            
                        </li>
                        <li>
                            <label for="newpassword">신규 비밀번호</label>
                            <input type="password" name="newpassword" id="newpassword" class="pw" minlength="3" maxlength="20">
                        </li>
                        <li>
                            <label for="newpasswordcheck">비밀번호 확인</label>
                            <input type="password" name="newpasswordcheck" id="newpasswordcheck" class="pw" minlength="3" maxlength="20">
                            <span id="alert-success" style="display: none; color: #7d69fe;">비밀번호가 일치합니다.</span>
    						<span id="alert-danger" style="display: none; color: tomato; font-weight: 600; ">비밀번호가 일치하지 않습니다.</span>
                        </li>
                    </ul>

                    <div class="btnBox">
                        <button type="submit" id="btn_updateMember" class="btn">변경</button>
                    </div>
					
					
					<script>
					    $('.pw').focusout(function () {
					        var pwd1 = $("#newpassword").val();
					        var pwd2 = $("#newpasswordcheck").val();
					  
					        if ( pwd1 != '' && pwd2 == '' ) {
					            null;
					        } else if (pwd1 != "" || pwd2 != "") {
					            if (pwd1 == pwd2) {
					                $("#alert-success").css('display', 'inline-block');
					                $("#alert-danger").css('display', 'none');
					            } else {
					                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
					                $("#alert-success").css('display', 'none');
					                $("#alert-danger").css('display', 'inline-block');
					            }
					        }
					    });
					</script>
				                    

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