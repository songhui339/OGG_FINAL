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
    
    <!-- 민정 요 윗 부분 복사해서 section 태그 까지!  -->
    
    <section class="findIDPWD_section">
        <div class="textBox">
            <h2 class="titleText"><span class="c_purple">아이디</span> 찾기</h2>
            <p class="subText">회원가입 시 등록하신 <span class="c_purple">이메일 주소를 입력</span>해 주세요.<br></p>
            
            <form action="/member/findId.do" method="POST">
            	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
                <div class="email-input">
                    <input type="email" name="m_email" id="m_email" maxlength="50" placeholder="이메일을 입력하세요.">
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