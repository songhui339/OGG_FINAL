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
            <p class="subText">아이디와 이메일 주소를 입력해 주세요.<br>
            해당 이메일로 <span class="c_purple">인증번호</span>를 보내드립니다.</p>
            <form action="/member/findPwd.do" method="POST">
            	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
                <div class="email-input">
                    <input type="text" name="m_id" id="m_id" maxlength="50" placeholder="아이디를 입력하세요">
                </div>
                <div class="email-input">
                    <input type="email" name="m_email" id="m_email" maxlength="50" placeholder="이메일을 입력하세요">
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