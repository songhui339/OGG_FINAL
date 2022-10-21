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

<div style="height: 100px;"></div>

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
                    <h3><span class="c_purple">로그인 정보</span> 입력</h3>
                    <div class="form-round-box">
                        <ul class="form-list">
                            <li>
                                <span class="subject">아이디</span>
                                <input type="text" name="p_share_id" value="" id="" required="" placeholder="아이디" minlength="3" maxlength="20">
                                <span class="lightgrey inline-break"></span>
                            </li>
                            <li>
                                <span class="subject">비밀번호</span>
                                <input type="password" name="p_share_pwd" id="" required="" placeholder="비밀번호" minlength="3" maxlength="20">
                            </li>
                            <li>
                                <span class="subject">비밀번호 확인</span>
                                <input type="password" name="" id="" required="" placeholder="비밀번호 확인" minlength="3" maxlength="20">
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
                                <select name="p_max_member" class="form-select" aria-label="Default select example" style="width: 300px;">
                                    <option selected>본인 제외</option>
                                    <option value="1">1명</option>
                                    <option value="2">2명</option>
                                    <option value="3">3명</option>
                                    <option value="4">4명</option>
                                </select>
                            </li>
                            <li>
                                <span class="subject">파티 시작일</span>
                                <input type="date" name="p_start_date" value="" id="" required="">
                            </li>
                            <li>
                                <span class="subject">혜택 기간</span>
                            </li>
                            <li>
                                <span class="subject">파티 종료일</span>
                                <input type="date" name="p_end_date" value="" id="" required="">
                            </li>
                        </ul>
                    </div>


                    <h3><span class="c_purple">파티 규칙</span> 확인</h3>
                    <div class="form-round-box">
                            <div class="ruleBox" style="margin-bottom: 20px;">
                                <p class="titleText"><i class="bi bi-check-lg" style="color: #7e69fe;"></i> ${ plan.plan_name }의 로그인 정보를 정확하게 입력/관리하겠습니다.</p>
                                <p class="ruleText">
                                    - 아이디 : <br>
                                    - 비밀번호 : <br>
                                    잘못된 로그인 정보를 입력하는 경우 위약금이 발생할 수 있습니다.<br>
                                    파티원 변동 시 동시 접속 인원 관리를 위해 비밀번호를 변경해야 합니다.
                                </p>
                            </div>

                            <div class="ruleBox">
                                <p class="titleText"><i class="bi bi-check-lg" style="color: #7e69fe;"></i> 파티 기간은 2022.08.25 ~ 2023.02.24 약 6개월입니다.</p>
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
                                <span class="subject">결제 카드 번호</span>
                                <input type="text" name="" value="" id="" required="" placeholder="카드 번호 (16자리)" minlength="16" maxlength="24">
                            </li>
                            <li>
                                <span class="subject">OGG 정산일</span>
                                <select class="form-select" aria-label="Default select example" style="width: 300px;">
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
                                <span class="subject"><i class="bi bi-check-lg" style="color: #7e69fe;"></i> OGG 정산일 <i class="bi bi-question-circle-fill" style="color: gray !important;"></i></span>
                            </li>
                        </ul>
                    </div>

                    <div class="buttonBox">                    
                        <button type="submit" class="button button-purple">파티 만들기</button>
                    	<button type="button" class="button button-purple" id="payTest" onclick="requestPay()">결제 테스트</button>
                        <button type="button" class="button" onclick="location.href='${path}/party/prevPartyPage'">취소</button>
                    </div>

                </form>

            </div>
        </div>
    </section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
	IMP.init('imp34485120'); //자신의 "가맹점 식별코드"를 사용

	function requestPay() {		
	  	IMP.request_pay({
	  		pg: 'kakaopay',
	  		pay_method: 'card',
	  		merchant_uid: "order_monthly_"+new Date().getTime(),
	  		customer_uid: '124222122112333333312', // 카드(빌링키)와 1:1로 대응하는 값, 유저 ID값으로 설정 예정
	  		name: 'test012',
	  		amount: 4000, 
	  		buyer_email: 'gildong@gmail.com',
	  		buyer_name: '홍길동',
	  		buyer_tel: '010-4242-4242'
	  	}, function (rsp) {
	  		if ( rsp.success ) {
	  			$.ajax({
					url:"${path}/pay/subpay",
					type: 'POST',
					dataType: "json",
					data: {
						customer_uid: '124222122112333333312',
				        merchant_uid: "order_monthly_"+new Date().getTime(),
				        schedule_at: 1666235386,
				        amount: 8900	
					},
					success: (result) => {
						alert(result);
					}
				});
				alert('결제 예약');
		    } else {
		    	alert('결제 예약 실패');		    	 
	      	}
	  	});
	};	
</script>
   