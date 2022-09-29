<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    
    <link rel="stylesheet" href="${path}/resources/css/login.css">
    <link rel="stylesheet" href="${path}/resources/css/headerFooter.css" class="css">
</head>
<body>
    <header>
        <div class="width-container">
            <div class="logoBox">
                <a href="javascript:">
                    <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/small-butslogo.png" srcset="https://buts.co.kr/thema/Buts/colorset/Basic/img/2x/small-butslogo.png 2x" alt="loogo" title=""></a>
            </div>

            <div class="btnBox">
                <a href="javascript:" class="loginBtn">로그인</a>
            </div>
        </div>

        <div class="menu-container">
            <ul class="menuBox">
                <li>
                    <a href="javascript:">파티 만들기</a>
                </li>
                <li>
                    <a href="javascript:">파티 찾기</a>
                </li>
                <li>
                    <a href="javascript:">리뷰</a>
                </li>
                <li>
                    <a href="javascript:">커뮤니티</a>
                </li>
                <li>
                    <a href="javascript:">이벤트</a>
                </li>
            </ul>
        </div>
    </header>

    <div class="loginPage_section">
        <div class="contentWrap">
            <div class="login-form">
                <form class="form" role="form" name="flogin" action="${ path }/member/login.do" method="POST">
                    <div class="login-logo">
                        <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/big-butslogo.png" alt="">
                    </div>
                    <div class="login-input">
                        <input type="text" name="m_id" id="m_id" required="" maxlength="20" placeholder="아이디를 입력하세요">
                    </div>
                    <div class="login-input">
                        <input type="password" name="m_pwd" id="m_pwd" required="" maxlength="20" placeholder="패스워드를 입력하세요">
                    </div>
                    <div class="login-option">
                        <div class="input-check">
                            <input type="checkbox" name="remember-me" id="remember-me">
                            <label for="remember-me">로그인 상태 유지</label>
                        </div>
                        <div class="right">
                            <a href="${ path }/member/goAgreementBeforJoin.do" class="v-bar" >회원가입</a>
                            <a href="" id="login_password_lost">아이디/비밀번호찾기</a>
                        </div>
                    </div>
                 	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
                    <button type="submit" class="form-button button button-purple">로그인</button>
                 		<c:if test="${ not empty errorMessage }">
                 			<p><c:out value="${ errorMessage }"/></p>
                 		</c:if>
                    <div class="form-text">
                        <p>
                            벗츠 회원이 아닌가요? <br>
                            첫가입 시 500포인트! <span class="text-purple">추천인 등록 시 추가 500포인트!</span>
                        </p>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
                </form>

                    <div class="form-sns-join sns-wrap">
                        <a href="javascrip:;"  style="margin-top:20px; width:100%;" class="naver sns-naver" title="네이버">
                        <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/btn-sns-login-naver.png" alt="" title="">
                    네이버 계정으로 로그인 하기
                        </a>

                        <a href="javascrip:;" style="margin-left:0px; margin-top:5px; width:100%;" class="kakao sns-kakao" title="카카오">
                        <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/btn-sns-login-kakao.png" alt="" title="">
                        카카오 계정으로 로그인 하기			
                        </a>
    
                </div>
            </div>
        </div>
    </div>


    <footer>
        <div class="width-container">
            <div class="contentWrap">
                <div class="logoBox">
                    <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/small-butslogo-glay.png" alt="lgooIcon">
                </div>
                <a href="javascript:" target="_blank" class="v-bar">회사 소개</a>
                <a href="javascript:" target="_blank" class="v-bar">제휴문의</a>
                <a href="javascript:" target="_blank" class="v-bar">제휴문의</a>
                <a href="javascript:" target="_blank" class="v-bar">1:1문의하기</a>
                <a href="javascript:" target="_blank" class="v-bar"><strong>개인정보처리방침</strong></a>
                <a href="javascript:" target="_blank" class="v-bar">이용약관</a>
                <a href="javascript:" target="_blank" class="v-bar">FAQ</a>
                <br><br>
                <span class="v-bar">상호 : 벗츠</span>
                <span>대표 : 김시진</span>
                <br>
                <span>주소 : 경기도 성남시 분당구 서현동 245-4 엘지분당에클라트2차 1221호</span>
				<br>
				<span class="v-bar">사업자등록번호 : 375-36-00640</span>
				<span class="v-bar"><a href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp" target="_blank"> <strong>사업자정보확인</strong></a></span>
				<span>통신판매번호 : 제 2019-의정부송산-040호</span>
				<br>
				<span class="v-bar">개인정보보호책임 : 김시진</span> <span>호스팅 사업자 : Amazon Web Service(AWS)</span>
				<br>
				<span class="v-bar">이메일 : <a href="mailto:manager@buts.co.kr">manager@buts.co.kr</a></span> <span>대표전화 : 070-4354-1015</span>
				<br>
				<br>
				<span>Copyright © 2022 Buts Inc. All rights reserved.</span>
            </div>
        </div>
    </footer>
    <footer>
        <div class="width-container">
        벗츠는 통신판매중개자이며, 통신판매의 당사자가 아닙니다.파티정보, 구매에 관한 의무와 책임은 판매자에게 있습니다.<br>
        벗츠는 소비자 보호와 안전거래를 위해고객센터(manager@buts.co.kr)를 운영하고 있으며,분쟁이 발생 된 경우 별도의 분쟁처리절차에 의거분쟁해결 및 청약철회 등이 진행 됩니다.
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>