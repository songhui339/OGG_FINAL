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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
