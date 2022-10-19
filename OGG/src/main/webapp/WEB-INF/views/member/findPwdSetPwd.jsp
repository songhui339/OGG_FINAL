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
    


	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>