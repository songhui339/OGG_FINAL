<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- FAQ 페이지 CSS -->
    <link rel="stylesheet" href="${path}/css/others/ogg_faq.css" class="css">
    
    <!-- FAQ 페이지 JS -->
    <script src="${path}/js/others/ogg_faq.js"></script>
    
	<section class="faq_section">
	
	    <div class="faq_title">
	        <div>
	                <h2>FAQ</h2>
	                <p>
	                    OGG 회원들이 자주 묻는 질문들! 보기 좋게 모아봤어요<i class="bi bi-emoji-wink"></i><br>
	                    <span>*궁금하신 사항에 대한 답변이 없다면 1:1 문의 작성 부탁드립니다.</span>
	                </p>
	                <!-- <button type="button" class="btn">1:1 문의 작성 바로가기 <i class="bi bi-pencil"></i></button> -->
	        </div>
	    </div>
	    <div class="o_accordion_section">
	        <div class="content_container">
	            <div>
	                <div class="inner_box">
	                    <ul class="o_accordion">
	                    <li>
	                        <a><span class="title">Q<em>.</em></span> OGG에서 진행 중인 서비스에 참여하고 싶은데 절차가 어떻게 되나요?</a>
	                        <div class="textBox">
	                        <p><span class="title">A<em>.</em></span> 
	                            OGG 홈페이지 내에서 참여 가능한 서비스를 확인 하실 수 있습니다.<br>
	                            원하시는 파티를 선택하여 결제 하신 뒤 [내 파티 보기] 페이지를 통해<br>참여하신 서비스의 참여정보(로그인 정보)를 확인 하실 수 잇습니다.
	                        </div>
	                    </li>
	                    <li>
	                        <a><span class="title">Q<em>.</em></span> 참여하고 싶은 서비스가 진행 중이지 않습니다. 언제 참여가 가능할까요?</a>
	                        <div class="textBox">
	                        <p><span class="title">A<em>.</em></span> 
	                            벗츠에서는 참여 가능한 서비스를 파트너 가입자가 직접 올려서 진행하는 시스템입니다.<br>목록에 없는 서비스의 경우 언제 제공 될지 특정 드릴 수 없는 부분 양해 부탁 드립니다.
	                            <br>다만 2023년 2월에 원하는 카테고리의 서비스 파티가 생성되면 알림신청이 가능한 [대기방] 기능이 추가 예정입니다. 해당 기능을 이용하시면 파티가 생성 될 때 알림톡을 받아 보실 수 있습니다. 
	                        </p>
	                        </div>
	                    </li>
	                    <li>
	                        <a><span class="title">Q<em>.</em></span> 참여한 파티의 서비스를 연장하여 사용하고 싶습니다.</a>
	                        <div class="textBox">
	                            <p><span class="title">A<em>.</em></span> 현재(2022.11.01)는 참여하신 파티에 대한 연장기능을 제공하고 있지 않습니다.
	                            </p>
	                        </div>
	                    </li>
	                    <li>
	                        <a><span class="title">Q<em>.</em></span> 회원 정보(닉네임, 비밀번호, 연락처, 이메일) 수정은 어디서 하나요?</a>
	                        <div class="textBox">
	                            <p><span class="title">A<em>.</em></span> 
	                                OGG 웹사이트 접속 후 마이페이지를 통해 회원 정보 수정이 가능합니다.
	                            <span class="o_accordion_text_sub"></span></p>
	                        </div>
	                    </li>
	                    <li>
	                        <a><span class="title">Q<em>.</em></span> 회원 탈퇴는 어떻게 하나요?</a>
	                        <div class="textBox">
	                            <p><span class="title">A<em>.</em></span> 
	                                [마이페이지]에 접속하여 [회원탈퇴] 버튼을 통해 탈퇴 진행이 가능합니다.<br><br>
	                                <strong>회원 탈퇴 시 유의사항</strong><br>
	                                1. 참여중인 파티가 있는 경우 탈퇴 후 발생하는 문제에 대해 보호받지 못하며, 책임지지 않습니다.<br>
	                                2. 벗츠에서 제공 된 포인트는 모두 소멸됩니다.<br>
	                                3. 경고 누적이나 부정 사용을 지우기 위한 탈퇴는 재가입이 제한 될 수 있습니다.<br>
	                            <span class="o_accordion_text_sub"></span></p>
	                        </div>
	                    </li>
	                    <li>
	                        <a><span class="title">Q<em>.</em></span> 회원을 신고할 수 있는 방법이 있나요?</a>
	                        <div class="textBox">
	                            <p><span class="title">A<em>.</em></span>
	                                우선 OGG를 이용하시면서 불쾌한 경험을 하게 한 점 사과드립니다. <br>신고를 원하는 회원이 있을 경우 OGG 운영자에게 1:1 문의 남겨주시면 조속히 처리하겠습니다! <br>
	                                </span>
	                            <span class="o_accordion_text_sub"></span></p>
	                        </div>
	                    </li>
	                    
	                        </ul>
	                    </div>
	            </div>
	        </div>
	    </div>
	
	</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>