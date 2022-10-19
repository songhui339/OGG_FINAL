<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- 로그인 및 회원가입 관련 CSS -->
    <link rel="stylesheet" href="${path}/css/member/login.css">

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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>