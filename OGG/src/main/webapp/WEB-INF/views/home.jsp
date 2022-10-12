<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	예비 메인화면
</h1>

<p>
	<a href="${ path }/review/film_list">작품 리스트 페이지 </a><br><br>
	<a href="${ path }/review/review_list">리뷰 리스트 페이지 </a><br><br>
</p>

	<input type="button" value="로그인" onclick="location.href='${ path }/member/goLoginPage.do'">
	<input type="button" value="회원가입" onclick="location.href='${ path }/member/goAgreementBeforJoin.do'">
	<br><br><br>
	<security:authorize access="isAuthenticated()">
		<a>시큐리티 로그인한 상태</a><br>
		<a href="${ path }/member/doLogout.do">로그아웃</a>
	</security:authorize>
	<br><br><br>
	<a href="${ path }/community/list.do">커뮤니티</a>
	<br><br><br>
	<a href="${ path }/party/ottlist">파티 만들기</a>
	
	<button onclick="location.assign('${path}/admin/home')">관리자 페이지</button>

</body>
</html>
