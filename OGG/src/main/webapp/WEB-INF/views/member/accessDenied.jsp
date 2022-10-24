<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- 로그인 및 회원가입 관련 CSS -->
    <link rel="stylesheet" href="${path}/css/common/ogg_common.css">
    
   <section class="accessDenied_section">
   		<img src="${ path }/images/common/icon_Oops.gif" class="emojiIMG" alt="emojiIcon"> 
   		
   		<p class="text">
   			<span class="highlight">앗! 잠시만요</span><br>
   			해당 페이지에 대한 접근 권한이 없습니다.
   		</p>
   		
   		<div class="btnBox">
   			<button class="gotoMain" onclick="location.href='${ path }/';">
   				메인페이지 바로가기 <i class="bi bi-house-door"></i>
   			</button>
   		</div>
   </section>
   
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>