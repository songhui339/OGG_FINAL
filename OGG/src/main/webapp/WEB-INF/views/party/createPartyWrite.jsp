<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ path }/css/party/ogg_party_write.css">


	<section class="enrollPage02">
        <div class="contentWrap">
            <div class="formBox">
                <div class="serviceInfoBox">
                    <p class="text">
                        공유 서비스
                        <img src="${ path }/images/party/${ ott.ott_thumb }.png" alt="logoImg" class="logoImg" id="logoImg">
                        <span class="nameText">${ ott.plan_name }</span>
                    </p>
                </div>
                <form name="fregister" id="fregister" method="POST" autocomplete="off" class="form" role="form" action="${ path }/party/createParty">
                    <input type="hidden" name="ott_no" value="${ ott.ott_no }">
                    <input type="hidden" name="plan_price" id="plan_price" value="${ ott.plan_price }">
                    <input type="hidden" name="p_entry_price" id="p_entry_price" value="">
                    <h3><span class="c_purple">로그인 정보</span> 입력</h3>
                    <div class="form-round-box">
                        <ul class="form-list">
                            <li>
                                <span class="subject">아이디</span>
                                <input type="text" name="p_share_id" value="" id="id_input" required="" placeholder="아이디" minlength="3" maxlength="20">
                                <span class="lightgrey inline-break"></span>
                            </li>
                            <li>
                                <span class="subject">비밀번호</span>
                                <input type="text" name="p_share_pwd" id="pwd_input" required="" placeholder="비밀번호" minlength="3" maxlength="20">
                            </li>
                            </ul>
                            <p class="subInfoText">
                                - ${ ott.plan_name }을 이용중인 이메일 아이디를 입력해 주세요.<br>
                                - 파티원과 공유 가능한 안전한 비밀번호를 사용해 주세요.
                            </p>
                            <a href="#" class="linkText">${ ott.plan_name } 바로가기</a>
                    </div>

                    <h3><span class="c_purple">진행 상태</span> 입력</h3>
                    <div class="form-round-box">
                        <ul class="form-list">
                            <li>
                                <span class="subject">파티원 수</span>
                                <select name="p_max_member" class="form-select" aria-label="Default select example" style="width: 300px;" id="p_max_member">
                                    <option selected>본인 제외</option>
                                    <option value="1">1명</option>
                                    <option value="2">2명</option>
                                    <option value="3">3명</option>
                                    <option value="4">4명</option>
                                </select>
                            </li>
                            <li>
                                <span class="subject">파티 시작일</span>
                                <input type="date" name="p_start_date" value="" id="start_date" required="">
                            </li>
                            <li>
                                <span class="subject">파티 종료일</span>
                                <input type="date" name="p_end_date" value="" id="end_date" required="">
                            </li>
                            <li>
                                <span class="subject">파티 기간</span>
                                <input type="text" id="monthly" value="" disabled>
                                <input type="hidden" id="monthly_val" name="p_period">
                            </li>
                            <li>
                                <span class="subject">파티 코멘트</span>
                                <input type="text" name="p_comment" id="p_comment" placeholder="파티 코멘트 입력" maxlength="15">
                            </li>
                        </ul>
                    </div>


                    <h3><span class="c_purple">파티 규칙</span> 확인</h3>
                    <div class="form-round-box">
                            <div class="ruleBox" style="margin-bottom: 20px;">
                            <div style="display:none"><input type="checkbox" id="check1" class="checkBoxs"></div>
                                <p class="titleText"><i id="checkimg1" class="bi bi-check-lg checkIcon" style="color: #7e69fe;"></i> ${ ott.plan_name }의 로그인 정보를 정확하게 입력/관리하겠습니다.</p>
                                    <p id="id_output">- 아이디 : 
                                    <p id="pwd_output">- 비밀번호 : 
                                <p class="ruleText">
                                    잘못된 로그인 정보를 입력하는 경우 위약금이 발생할 수 있습니다.<br>
                                    파티원 변동 시 동시 접속 인원 관리를 위해 비밀번호를 변경해야 합니다.
                                </p>
                            </div>

                            <div class="ruleBox">
                            <div style="display:none"><input type="checkbox" id="check2" class="checkBoxs"></div>
                                <p class="titleText" id="date_text"><i id="checkimg2" class="bi bi-check-lg checkIcon" style="color: #7e69fe;"></i> 파티 기간은 0000-00-00 ~ 0000-00-00 약 0개월 입니다.</p>
                                <p class="ruleText">
                                    파티 기간은 파티 시작 이후 변경할 수 없습니다. <br>
                                    파티 기간에 따라 추가 적립금 및 위약금 금액이 달라집니다.
                                </p>
                            </div>
                    </div>

                    <h3><span class="c_purple">결제/정산 정보</span> 확인</h3>
                    <div class="form-round-box">
                        <ul class="form-list">
                            <li>
                                <span class="subject">결제 정보</span>
                                <input type="text" name="" value="카카오 간편 결제" disabled>
                            </li>
                            <li>
                                <span class="subject">OGG 정산일</span>
                                <select class="form-select" aria-label="Default select example" style="width: 300px;" name="p_accounts">
                                    <option selected>선택</option>
                                    <option value="1">매달 1일</option>
                                    <option value="5">매달 5일</option>
                                    <option value="10">매달 10일</option>
                                    <option value="15">매달 15일</option>
                                    <option value="20">매달 20일</option>
                                    <option value="25">매달 25일</option>
                                    <option value="lastday">매달 말일</option>
                                </select>
                            </li>
                            <li>
                                <span class="subject" data-bs-toggle="tooltip" data-bs-placement="bottom" data-bs-title="Tooltip on bottom"><i class="bi bi-check-lg" style="color: #7e69fe;"></i> OGG 정산일 <i class="bi bi-question-circle-fill" style="color: gray !important;"></i></span>
                            </li>
                        </ul>
                    </div>

                    <div class="buttonBox">                    
                        <button type="submit" class="button button-purple">파티 만들기</button>
                        <button type="button" class="button" onclick="location.href='javascript:history.back()'">취소</button>
                    </div>

                </form>

            </div>
        </div>
    </section>

<script>
	
	$(document).ready(() => {
		$('#id_input').on('keyup', () => {
			document.getElementById('id_output').innerHTML = "- 아이디 : " + $('#id_input').val();
		});
		
		$('#pwd_input').on('keyup', () => {
			document.getElementById('pwd_output').innerHTML = "- 비밀번호 : " + $('#pwd_input').val();
		});
		
		
		$('#end_date').change(() => {
			let cDay = 24 * 60 * 60 * 1000;
		    let cMonth = cDay * 30;
			let start_month = new Date($('#start_date').val()).getTime();
			let end_month = new Date($('#end_date').val()).getTime();
			
			document.querySelector('#monthly').value = Math.floor((end_month - start_month) / cMonth) + " 개월";				
			document.querySelector('#monthly_val').value = Math.floor((end_month - start_month) / cMonth);				
			document.getElementById('date_text').innerHTML = "<i class='bi bi-check-lg' style='color: #7e69fe;'></i> 파티 기간은 "+ $('#start_date').val() + " ~ " + $('#end_date').val() + " 약 " + $('#monthly').val() + " 입니다.";
		});
		
		$('#p_max_member').change(() => {
			document.querySelector('#p_entry_price').value = Math.floor($('#plan_price').val() / $('#p_max_member').val());
		})
		

	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>