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
            <h2 class="titleText"><span class="c_purple">아이디</span> 찾기</h2>
            <p class="subText">회원님의 <span class="c_purple">아이디</span>는 아래와 같습니다.</p>
            <form action="">
                <div class="email-input">
                <c:forEach items="${member}" var="member">
                    <input type="text" name="m_email" id="m_email" maxlength="25" value="${member.m_id}">
                    </c:forEach>
                </div>

                <div class="buttonBox">
                    <button type="button" class="button" onclick="location.href='${ path }/member/goLoginPage.do'">확인</button>
                    <button type="button" class="button button-purple" onclick="location.href='${ path }/member/goFindPwd.do'">비밀번호 찾기</button>
                </div>
            </form>
        </div>
    </section>


	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>