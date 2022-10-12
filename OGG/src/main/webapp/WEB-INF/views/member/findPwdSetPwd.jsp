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
    <title>비밀번호 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    
    <link rel="stylesheet" href="${path}/css/member/login.css">
    <link rel="stylesheet" href="${path}/css/member/headerFooter.css" class="css">
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

    <section class="findIDPWD_section">
        <div class="textBox">
            <h2 class="titleText"><span class="c_purple">비밀번호</span> 수정</h2>
            <p class="subText">새로운 비밀번호를 입력하세요.</p>
            <form action="/member/findPwdSetNewPwd.do" method="POST">
            	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
            	<input type="hidden" name="m_email" value="${m_email}">
                
                <div class="email-input">
                    <input type="password" name="m_pwd" id="m_pwd" maxlength="20" placeholder="비밀번호를 입력하세요.">
                    <span id="pwd_check"></span>
                </div>
                <div class="email-input">
                    <input type="password" name="m_pwd2" id="m_pwd2" maxlength="20" placeholder="비밀번호를 재확인하세요.">
                    <span id="pwd_check2"></span>
                </div>
                <div class="buttonBox">
                    <button type="button" class="button" onclick="location.href='${ path }/member/goHome.do'">닫기</button>
                    <button type="submit" class="button button-purple">확인</button>
                </div>
            </form>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

<script type="text/javascript">
	
	$(function(msg){
		var msg = "<c:out value="${msg}" />";
		if (msg != "") {
			alert(msg);
		}
	});
	
</script>
	
<script type="text/javascript">
	var pwJ = /^[A-Za-z0-9]{4,20}$/; // 비밀번호 정규식 : 4~20자의 소문자, 대문자, 숫자
	$(document).ready(function() {
		
		var isPwCheck = true;

		$('#m_pwd').blur(function() {
			if (pwJ.test($('#m_pwd').val())) {
				$('#pwd_check').text('');
				
				isPwCheck = true;
			} else {
				$('#pwd_check').text('4~20자의 영문, 숫자 사용 가능합니다.');
				$('#pwd_check').css('color', 'gray');
				
				isPwCheck = false;
			}
		});

		$('#m_pwd2').blur(function() {
			if ($('#m_pwd').val() != $(this).val()) {
				$('#pwd_check2').text('비밀번호가 일치하지 않습니다.');
				$('#pwd_check2').css('color', 'gray');
				
				isPwCheck = false;
				
			} else {
				$('#pwd_check2').text('');
				
				isPwCheck = true;
			}
		});

	
		$('form').on('submit',function(){

			if (($('#m_pwd').val() == ($('#m_pwd2').val())) && pwJ.test($('#m_pwd').val())) {
				inval_Arr[1] = true;
			} else {
				inval_Arr[1] = false;
				alert('비밀번호를 확인하세요.');
				return false;
			}
     
		});
	});

</script>


</html>