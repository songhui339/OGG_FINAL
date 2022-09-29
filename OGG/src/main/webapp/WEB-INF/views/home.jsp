<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	예비 메인화면
</h1>
	<input type="button" value="로그인" onclick="location.href='${ path }/member/goLogin.do'">
	<input type="button" value="회원가입" onclick="location.href='${ path }/member/goAgreementBeforJoin.do'">
	<br><br><br>
	<a href="${ path }/member/goLogout.do">로그아웃</a>
</body>
</html>
