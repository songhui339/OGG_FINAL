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

<link rel="stylesheet" href="${ path }/css/party/ogg_submitParty.css">

<section class="submitPartyDetail_section">
    <div class="contentWrap">
        <div class="formBox">
            <div class="serviceInfoBox">
                <p class="text">
                    이용 서비스
                    <img src="${ path }/images/party/${ party.ott_thumb }.png" alt="logoImg" class="logoImg">
                    <span class="nameText">${ party.plan_name }</span>
                </p>
            </div>
            <form name="fregister" id="fregister" method="POST" autocomplete="off" class="form" role="form">
            <input type="hidden" id="accounts_date" value="${ party.p_accounts }">
            <input type="hidden" name="m_id" id="m_id" value="${ party.m_id }">
            <input type="hidden" name="m_name" id="m_name" value="${ party.m_name }">
            <input type="hidden" name="m_email" id="m_email" value="${ party.m_email }">
            <input type="hidden" name="m_tel" id="m_tel" value="${ party.m_tel }">
            <input type="hidden" name="p_no" id="p_no" value="${ party.p_no }">
                <h3><span class="c_purple">파티 정보</span></h3>
                <div class="form-round-box">
                    <ul class="form-list">
                        <li>
                            <span class="subject">파티 기간</span>
                            <input type="hidden" id="end_date" value="${ party.p_end_date }">
                            <input type="text" name="" id="party_period" required="" value="">
                        </li>
                        <li>
                            <span class="subject">파티 요금 (월, VAT 포함)</span>
                            <input type="text" name="" id="" required="" value="${ party.p_entry_price_output.trim() } 원">
                        </li>
                        </ul>
                </div>

                <h3><span class="c_purple">결제 수단</span></h3>
                <div class="form-round-box">
                    <ul class="form-list">
                        <li>
                            <span class="subject"><strong>카카오 간편 결제</strong></span>
                        </li>
                        <li>
                            <span class="subject">정산일</span>
                            <input type="text" name="" id="" required="" value="매달 ${ party.p_accounts }일">
                        </li>
                    </ul>
                </div>


                <h3><span class="c_purple">파티 가입 규칙</span> 확인</h3>
                <div class="form-round-box">
                        <div class="ruleBox" style="margin-bottom: 20px;">
                            <p class="titleText" id="info_text"></p>
                        </div>

                        <div class="ruleBox" style="margin-bottom: 20px;">
                            <p class="titleText"><i class="bi bi-check-lg" style="color: #7e69fe;"></i> 파티 가입시 지불하는 파티 보증금 ${ party.p_deposit }원은 파티가 끝나면 100% 환급되며, 파티 중도 탈퇴 시 환급되지 않습니다.</p>
                        </div>

                        <div class="ruleBox" style="margin-bottom: 20px;">
                            <p class="titleText"><i class="bi bi-check-lg" style="color: #7e69fe;"></i> 다음 정산일(${ party.p_accounts }일) 부터는 OGG 수수료가 포함된 ${ party.p_entry_price_output }원의 파티 요금이 결제됩니다.</p>
                        </div>

                        <div class="ruleBox">
                            <p class="titleText"><i class="bi bi-check-lg" style="color: #7e69fe;"></i> 파티 가입 조건 및 서비스 이용약관을 확인했으며, 이에 동의합니다.</p>
                        </div>
                </div>

                <h3><span class="c_purple">첫 달 결제 금액</span> 확인</h3>
                <div class="form-round-box">
                    <ul class="form-list">
                        <li>
                            <span class="subject">파티 요금(첫 달)</span>
                            <input type="text" name="" id="monthly_price" required="" value="${ (party.p_entry_price_output).trim() }원">
                        </li>
                        <li>
                            <span class="subject">파티 보증금</span>
                            <input type="text" name="" id="deposit" required="" value="${ (party.p_deposit).trim() }원">
                        </li>
                        <li>
                            <span class="subject">합계</span>
                            <input type="text" name="" id="price_sum" required="" value="">
                        </li>
                        <hr>
                        <li>
                            <span class="subject price">카카오 페이 결제</span>
                            <input type="text" name="" id="price_kakao" required="" value="" class="priceValue">
                        </li>
                    </ul>
                </div>

                <div class="buttonBox">
                    <button type="button" class="button" onclick="goBack()">뒤로 가기</button>
                    <button type="button" class="button button-purple" onclick="requestPay()">결제하고 파티 시작하기</button>
                </div>

            </form>
                    

        </div>
    </div>
</section>

<script>
	let amount = '';
	let monthly_amount = '';
	
	let cDay = 24 * 60 * 60 * 1000;
    let cMonth = cDay * 30;
	let start_month = new Date($('#start_date').val()).getTime();
	let end_month = new Date($('#end_date').val()).getTime();
	let monthly = Math.floor((end_month - new Date().getTime()) / cMonth);
	
	let name = $('#m_name').val();
	let id = $('#m_id').val();
	let email = $('#m_email').val();
	let tel = $('#m_tel').val();
	let p_no = $('#p_no').val();
	
	let merchant_uid = "order_monthly_" + new Date().getTime();
	
	let date = new Date();
	let year = date.getFullYear();
    let month = ("0" + (1 + date.getMonth())).slice(-2);
    let day = ("0" + date.getDate()).slice(-2);
	let accounts_day = $('#accounts_date').val();
	let accounts_date = year + "-" + month + "-" + accounts_day;
	let accounts_unix_date = new Date(accounts_date).getTime()/1000;
	let temp = 00000001;
	let monthly_price = ($('#monthly_price').val()).replace(/[^\d]+/g, "");
	let point = Math.round(monthly_price * 0.9);
	
	function goBack(){
		window.history.back();
	};
	
	$(document).ready(() => {
	    let date = new Date($('#end_date').val());
	    let year = date.getFullYear();
	    let month = ("0" + (1 + date.getMonth())).slice(-2);
	    let day = ("0" + date.getDate()).slice(-2);
	    
	    let deposit = $('#deposit').val();
	    let price_sum = '';
		
	    document.querySelector('#party_period').value = "오늘 ~ " + year + "-" + month + "-" + day;
	    
	    monthly_amount = monthly_price;
	    deposit = deposit.replace(/[^\d]+/g, "");
	    
	    price_sum = parseInt(monthly_price) + parseInt(deposit);
		amount = price_sum;
	    
	    price_sum = String(price_sum).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    
	    document.getElementById('info_text').innerHTML = "<i class='bi bi-check-lg' style='color: #7e69fe;''></i>" + price_sum + "원이 카카오 간편 결제를 통해 결제될 예정이며, 결제 진행에 동의합니다.";
	    document.querySelector('#price_sum').value = price_sum + "원";
	    document.querySelector('#price_kakao').value = price_sum + "원";

	});
		
	
	IMP.init('imp34485120');
	
	function requestPay() {
		//location.href = "${path}/party/submitParty?no=${ party.p_no }&point=" + point;
	  	IMP.request_pay({
	  		pg: 'kakaopay',
	  		pay_method: 'card',
	  		merchant_uid: merchant_uid,
	  		customer_uid: id, // 카드(빌링키)와 1:1로 대응하는 값, 유저 ID값으로 설정 예정
	  		name: '최초 결제',
	  		amount: amount,
	  		buyer_email: email,
	  		buyer_name: name,
	  		buyer_tel: tel
	  	}, function (rsp) {
	  		if ( rsp.success ) {
	  			$.ajax({
					url:"${path}/pay/firstSubpay",
					type: 'POST',
					dataType: "json",
					data: {
						customer_uid: id,
				        amount: amount,
				        merchant_uid: merchant_uid,
				        p_no: p_no
					}
				});
	  			
	  			month = parseInt(month) + 1;
		  		
	  			for(let i = 1; i < monthly; i++){
	  				temp += 1;
	  				if(parseInt(month) <= 12){
		  				accounts_date = year + "-" + month + "-" + accounts_day;
		  				accounts_unix_date = new Date(accounts_date).getTime()/1000;
	  				} else {
	  					year = parseInt(year) + 1;
	  					month = 1;
	  					accounts_date = year + "-" + month + "-" + accounts_day;
		  				accounts_unix_date = new Date(accounts_date).getTime()/1000;
	  				}
	  				
		  			$.ajax({
						url:"${path}/pay/subpay",
						type: 'POST',
						dataType: "json",
						data: {
							customer_uid: id,
					        merchant_uid: "order_monthly_" + new Date().getTime() + temp,
					        schedule_at: accounts_unix_date,
					        amount: monthly_amount,
					        p_no: p_no
						},
						success: (result) => {
							console.log(result);
						}
					});
		  			month = parseInt(month) + 1;
		  			
	  			}
	  			location.href = "${path}/party/submitParty?no=${ party.p_no }&point=" + point;
	  			
		    } else {
		    	alert('결제 예약 실패'); 
	      	}
	  	});
	};
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>