<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ path }/css/party/ogg_submitParty.css">

<section class="submitPartyThxU_section">
    <div class="mainTextContainer">
        <div class="row">
            <div class="col-md-5 iconBox">
                <img src="https://emojipedia-us.s3.amazonaws.com/source/microsoft-teams/337/party-popper_1f389.png" alt="">
            </div>
            <div class="col-md-7 textBox">
                <p>
                    파티 가입이 완료되었습니다!
                </p>
                </div>
        </div>
    </div>

    <div class="buttonContainer">
        <div class="buttonBox">
            <button class="gotoMain" onclick="location.href='${path}/'">메인페이지 바로가기 <i class="bi bi-house-door"></i></button>
            <button onclick="location.href='${ path }/film/list'">리뷰 게시판 바로가기 <i class="bi bi-people"></i></button>
        </div>
    </div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>