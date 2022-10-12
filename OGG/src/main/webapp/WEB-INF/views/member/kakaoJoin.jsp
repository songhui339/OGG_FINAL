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
    <title>회원가입 페이지</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    
    <link rel="stylesheet" href="${path}/css/member/join.css">
    <link rel="stylesheet" href="${path}/css/member/headerFooter.css" class="css">

	<script src="${ path }/js/jquery-3.6.0.min.js"></script>
    
</head>
<body>
    <header>
        <div class="width-container">
            <div class="logoBox">
                <a href="javascript:">
                    <img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/small-butslogo.png" srcset="https://buts.co.kr/thema/Buts/colorset/Basic/img/2x/small-butslogo.png 2x" alt="loogo" title=""></a>
            </div>

            <div class="btnBox">
                <a href="javascript:" class="loginBtn" onclick="location.href='/member/goLoginPage.do'">로그인</a>
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

    <section class="enrollPage02">
        <div class="contentWrap">
            <div class="formBox">
                <form name="fregister" id="memberCheck" action="/member/kakaoJoin.do" method="POST" autocomplete="off" class="form" role="form">
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <h3><span class="c_purple">내 정보</span> 입력</h3>
                    <div class="form-round-box">
                        <ul class="form-list">
                            <li>
                                <span class="subject">ㆍ 아이디</span>
                                <input type="text" name="m_id" id="m_id" value="${kakaoid}" minlength="3" maxlength="20" required="required" readonly>
                            </li>
                            <li>
                                <span class="subject">ㆍ 이름</span>
                                <input type="text" name="m_name" id="m_name" value="${kakaoname}" minlength="3" maxlength="20">
                            </li>
                            <li>
                                <span class="subject">ㆍ 닉네임</span>
                                <input type="text" name="m_nickname" id="m_nickname" value="${kakaoname}" minlength="3" maxlength="20">
                            </li>

                            <li>
                                <span class="subject">ㆍ 이메일</span>
                                <input type="text" name="m_email" id="m_email" value="${kakaoid}" minlength="3" maxlength="20" required="required" readonly><br>
                            </li>
                            
                            <li>
                                <span class="subject">ㆍ 휴대폰 번호</span>
                                <input type="tel" name="m_phonenumber" id="m_phonenumber" placeholder="휴대폰 번호" class="form-control input-sm" placeholder="(-없이)01012345678" minlength="3" maxlength="20">
                            	<span id="phone_check"></span>
                            </li>
                            </ul>
                    </div>

                    <h3><span class="c_purple">기타</span> 입력</h3>
                    <div class="form-round-box">
                        <ul class="form-list">
                            <li>
                                <span class="subject">ㆍ 이메일 수신</span>
                                <input type="checkbox" name="m_emailagreement" id="m_emailagreement" value="Y"> 동의
                            </li>
                            <li>
                                <span class="subject">ㆍ 추천인 아이디</span>
                                <input type="text" name="m_recommend" id="m_recommend" class="form-control input-sm" placeholder="추천인 아이디" minlength="3" maxlength="20">
                            </li>
                            </ul>
                    </div>

                    <div class="buttonBox">
                        <button type="button" class="button" onclick="location.href='${ path }/member/goHome.do'">취소</button>
                        <button type="submit" class="button button-purple">회원가입</button>
                    </div>

                </form>

            </div>
        </div>
    </section>
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
</body>

<script type="text/javascript">

	$(function(msg){
		var msg = "<c:out value="${msg}" />";
		if (msg != "") {
			alert(msg);
		}
	});


	var empJ = /\s/g; // 모든 공백 체크 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // 휴대폰 번호 정규식 : '-'없이 입력
	
	$(document).ready(function() {
		var isPhonenumberCheck = true;
		
		$('#m_phonenumber').blur(function(){
			if(phoneJ.test($(this).val())){
				$('#phone_check').text('');
				
				isPhonenumberCheck = true;
			} else {
				$('#phone_check').text('휴대폰 번호 양식을 확인해주세요.');
				$('#phone_check').css('color', 'gray');
				
				isPhonenumberCheck = false;
			}
		});
 
	});
   
</script>
</html>
