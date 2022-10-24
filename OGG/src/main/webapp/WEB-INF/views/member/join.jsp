<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- 로그인 및 회원가입 관련 CSS -->
    <link rel="stylesheet" href="${path}/css/member/join.css">

    <section class="enrollPage02">
        <div class="contentWrap">
            <div class="formBox">
                <form name="fregister" id="memberCheck" action="/member/join.do" method="POST" autocomplete="off" class="form" role="form">
                    <h3>아이디/비밀번호</h3>
                    <div class="form-round-box">
                        <ul class="form-list">
                            <li>
                                <span class="subject">ㆍ 아이디</span>
                                <input type="text" name="m_id" id="m_id" placeholder="아이디" minlength="3" maxlength="20">
                                <span id="id_check"></span>
                            </li>
                            <li>
                                <span class="subject">ㆍ 비밀번호</span>
                                <input type="password" name="m_pwd" id="m_pwd" class="form-control input-sm" placeholder="비밀번호" minlength="3" maxlength="20">
                           		<span id="pwd_check"></span>
                            </li>
                            <li>
                                <span class="subject">ㆍ 비밀번호 확인</span>
                                <input type="password" name="m_pwd2" id="m_pwd2" class="form-control input-sm" placeholder="비밀번호 확인" minlength="3" maxlength="20">
                            	<span id="pwd_check2"></span>
                            </li>
                            </ul>
                    </div>

                    <h3><span class="c_purple">내 정보</span> 입력</h3>
                    <div class="form-round-box">
                        <ul class="form-list">
                            <li>
                                <span class="subject">ㆍ 이름</span>
                                <input type="text" name="m_name" id="m_name" placeholder="이순신" minlength="3" maxlength="20">
                                <span id="name_check"></span>
                            </li>
                            <li>
                                <span class="subject">ㆍ 닉네임</span>
                                <input type="text" name="m_nickname" id="m_nickname" placeholder="이순신ZZANG" minlength="3" maxlength="20">
                            	<span id="nickname_check"></span>
                            </li>

                            <li>
                                <span class="subject">ㆍ 이메일</span>
                                <input type="text" name="m_email" id="m_email" placeholder="leesunsin@ogg.com" minlength="3" maxlength="20"><br>
                                <span id="email_check"></span>
                            </li>
                            
                            <li>
                                <span class="subject">ㆍ 휴대폰 번호</span>
                                <input type="tel" name="m_phonenumber" id="m_phonenumber" required="" class="form-control input-sm" placeholder="(-없이)01012345678" minlength="3" maxlength="20">
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
 

<script type="text/javascript">

	$(function(msg){
		var msg = "<c:out value="${msg}" />";
		if (msg != "") {
			alert(msg);
		}
	});

	var empJ = /\s/g; // 모든 공백 체크 정규식
	var idJ = /^[A-za-z0-9]{4,12}$/; // 아이디 정규식 : 4~12자 소문자, 숫자
	var pwJ = /^[A-Za-z0-9]{4,20}$/; // 비밀번호 정규식 : 4~20자의 소문자, 대문자, 숫자
	var nameJ =  /^[가-힣]{1,8}$/;; // 이름 정규식 : 2~8자의 한글
	var nicknameJ = /^[가-힣ㄱ-ㅎa-zA-Z0-9._-]{2,10}\$/; // 닉네임 정규식 : 2~16자의 대문자, 소문자, 한글, 숫자, 언더스코어 (공백X) 
	var mailJ = /^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/; // 이메일 검사 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // 휴대폰 번호 정규식 : '-'없이 입력
	
	$(document).ready(function() {
		
		var isIdCheck = true;
		var isPwCheck = true;
		var isNameCheck = true;
		var isNicknameCheck = true;
		var isPhonenumberCheck = true;
		
		$("#m_id").blur(function() {
			if($('#m_id').val() == '') {
				$('#id_check').text('아이디를 입력하세요.');
				$('#id_check').css('color', 'gray');                     
			
				isIdCheck = false;
				
			} else if(idJ.test($('#m_id').val()) != true) {
				
				$('#id_check').text('4~12자의 영문, 숫자 사용 가능합니다.');
				$('#id_check').css('color', 'gray');
			   
				isIdCheck = false;
				
			} else if($('#m_id').val() != '') {

				var m_id=$('#m_id').val();
				$.ajax({
					async : true,
					type : 'get',
					data : { m_id : m_id },
					url : '/member/idcheck.do',
					dateType: 'json',
					contentType: "application/json; charset=UTF-8",
					success : function(data) {
						if( data > 0 ){
							
							$('#id_check').text('중복된 아이디 입니다.');
							$('#id_check').css('color', 'gray');
							$("#memberCheck").attr("disabled", true);
							
							isIdCheck = false;
							
						} else {
							$('#id_check').text('사용가능한 아이디 입니다.');
							$('#id_check').css('color', 'gray');
							$("#memberCheck").attr("disabled", false);
							        
							isIdCheck = true;
						}
					}
				});
			}
		});
        
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

		$("#m_name").blur(function() {
			if (nameJ.test($(this).val())) {
				$("#name_check").text('');
				
				isNameCheck = true;
			} else {
				$('#name_check').text('2~10자의 한글 사용 가능합니다.');
				$('#name_check').css('color', 'gray');
				
				isNameCheck = false;
			}
		});

		$("#m_nickname").blur(function() {
			if (nicknameJ.test($(this).val())) {
				$("#nickname_check").text('');
				
				isNicknameCheck = true;
			} else {
				$('#nickname_check').text('2~16자의 한글, 영문, 숫자 가능합니다.');
				$('#nickname_check').css('color', 'gray');
				
				isNicknameCheck = false;
			}
		});

		$("#m_email").blur(function() {
			if (mailJ.test($(this).val())) {
				$("#email_check").text('');
				
				isEmailCheck = true;
			} else {
				$('#email_check').text('이메일 양식을 확인해주세요.');
				$('#email_check').css('color', 'gray');
				
				isEmailCheck = false;
			}
		});

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
      
      
		$('form').on('submit',function(){
			var inval_Arr = new Array(6).fill(false);

			if (isIdCheck) {
				inval_Arr[0] = true;   
			} else {
				inval_Arr[0] = false;
				alert('아이디를  확인하세요.');
				return false;
			}

			if (($('#m_pwd').val() == ($('#m_pwd2').val())) && pwJ.test($('#m_pwd').val())) {
				inval_Arr[1] = true;
			} else {
				inval_Arr[1] = false;
				alert('비밀번호를 확인하세요.');
				return false;
			}
     
			if (nameJ.test($('#m_name').val())) {
				inval_Arr[2] = true;   
			} else {
				inval_Arr[2] = false;
				alert('이름을 확인하세요.');
				return false;
			}

			if (nicknameJ.test($('#m_nickname').val())) {
				inval_Arr[3] = true;   
			} else {
				inval_Arr[3] = false;
				alert('닉네임을 확인하세요.');
				return false;
			}
	     
			if (mailJ.test($('#m_email').val())){
				inval_Arr[4] = true;
			} else {
				inval_Arr[4] = false;
				alert('이메일을 확인하세요.');
				return false;
			}
     
			if (phoneJ.test($('#m_phonenumber').val())) {
				inval_Arr[5] = true;
			} else {
				inval_Arr[5] = false;
				alert('휴대폰 번호를 확인하세요.');
				return false;
			}

			var validAll = true;
			
			for(var i = 0; i < inval_Arr.length; i++){
				if(inval_Arr[i] == false){
					validAll = false;
				}
			}
			
			if(validAll == false){
				alert('정보를 다시 확인하세요.');
			}
		});
	});
   
</script>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
