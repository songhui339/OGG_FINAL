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
            <h2 class="titleText"><span class="c_purple">비밀번호</span> 찾기</h2>
            <p class="subText">해당 이메일에서 <span class="c_purple">인증번호</span>를 확인해주세요.<br></p>
            <form action="/member/findPwdConfirm.do" method="POST">
            	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
            	<input type="hidden" name="num" value="${num}">
            	<input type="hidden" name="m_email" value="${m_email}">
                <div class="email-input">
                    <input type="text" name="email_confirmation" id="email_confirmation" maxlength="20" placeholder="인증번호를 입력하세요.">
                </div>

                <div class="buttonBox">
                    <button type="button" class="button" onclick="location.href='${ path }/member/goHome.do'">닫기</button>
                    <button type="submit" class="button button-purple">확인</button>
                </div>
            </form>
        </div>
    </section>


	<script type="text/javascript">
	
		var msg = "${msg}";
		
		if (msg != "") {
		alert(msg);
		}
	
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>