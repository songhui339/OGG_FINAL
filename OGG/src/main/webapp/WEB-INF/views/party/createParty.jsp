<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ path }/css/party/ogg_party.css">

<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}");
</script>

<script src="${ path }/js/party/ott_menu.js"></script>


<div style="height: 100px;"></div>

    <!-- 모달 div -->
    <!-- 첫번째 모달 div -->
    <div class="modal" id="modalWindow" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="partyModal_title">
                    <h2 class="titleText">요금제 선택<br><span class="subText">공유할 요금제를 선택해주세요.</span></h2>
                </div>
                
                <div class="partyModal_content_01" id="plan_select">
                    
                </div>
                
                <div class="modal-footer nextBtnBox">
                    <input data-bs-target="#modalWindow2" data-bs-toggle="modal" type="button" value="다음" class="nextBtn" id="modal_next">
                </div>
            </div>
        </div>
    </div>
    
    <!-- 두번째 모달 div -->
    <form action="${ path }/party/write" method="POST" style="margin:0">
    <div class="modal" id="modalWindow2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="partyModal_title">
                    <h2 class="titleText">파티장 가이드<br></h2>
                    <p class="serviceText" id="serviceText"></p>
                </div>
                <div class="partyModal_content_02">
                    <!-- @철환님 noticeBox div를 c:if로 묶어서 반복되게 설정하면 될 것 같아요..! -->
                    <div class="noticeBox">
                        <p class="titleText" id="titleText">
                        </p>
                        <div class="infoText" id="infoText">
                        </div>
                    </div>

                    <div class="noticeBox">
                        <p class="titleText">
                            파티장의 로그인 정보는 파티원과 공유됩니다.
                        </p>
                        <div class="infoText">
                            🔐 공유 가능한 안전한 비밀번호를 사용해 주세요.
                        </div>
                    </div>

                    <div class="noticeBox">
                        <p class="titleText">
                            성인 인증이 완료된 계정만 공유할 수 있어요.
                        </p>
                        <div class="infoText">
                            🔞 성인 인증이 완료되지 않은 계정을 사용할 경우, 파티원의 서비스 이용에 불편을 끼칠 수 있어요.
                        </div>
                    </div>

                    <div class="checkBox">
                        <img src="${ path }/images/party/icon_partynotice_check_gray.png" alt="check Icon" class="checkIcon">
                        <span class="text">위 파티장 가이드를 모두 확인했습니다.</span>
                    </div>
                </div>
                <div class="modal-footer nextBtnBox">
                    <input type="submit" value="다음" class="nextBtn" data-bs-dismiss="modal" id="modal_submit">
                    <input type="hidden" name="modal_plan_no" id="modal_plan_no">
                </div>
            </div>
        </div>
    </div>
    </form>

    <section class="createParty_section">
        <div class="titleBox">
            <h2>어떤 파티를 만드시겠어요?</h2>
        </div>

        <!-- 탭 버튼 부분 -->
        <div class="createPartyTab_row_01">
            <div>
                <div class="btn_container">
                    <section>
                        <div id="createPartyTab_Icon_01" class="btnBox active">
                            <div class="textItem">
                            <p class="text">전체</p> 
                            </div>
                        </div>
                        <div id="createPartyTab_Icon_02" class="btnBox">
                            <div class="textItem">
                            <p class="text">미디어</p> 
                            </div>
                        </div>
                        <div id="createPartyTab_Icon_03" class="btnBox">
                            <div class="textItem">
                            <p class="text">게임</p> 
                            </div>
                        </div>
                        <div id="createPartyTab_Icon_04" class="btnBox">
                            <div class="textItem">
                            <p class="text">교육/도서</p> 
                            </div>
                        </div>
                        <div id="createPartyTab_Icon_05" class="btnBox">
                            <div class="textItem">
                            <p class="text">유틸리티</p> 
                            </div>
                        </div>
                        <div id="createPartyTab_Icon_06" class="btnBox">
                            <div class="textItem">
                            <p class="text">멤버십</p> 
                            </div>
                        </div>
                    </section>
                </div>
        
            </div>
        </div>

        <!-- 탭 콘텐츠 부분 -->
        <div class="createPartyTab_row_02">
                <!-- 전체 서비스  -->
                <section class="content_container">
                    <div class="contentBox">
                    	<c:if test="${ not empty list }">
                    		<c:forEach var="list" items="${ list }">
                    			<div class="itemBox ${ list.ott_class }" data-bs-toggle="modal" data-bs-target="#modalWindow" !hidden>
                    				<input type=hidden value="${ list.ott_no }">
		                            <img src="${ path }/images/party/${ list.ott_thumb }.png" alt="logoImg" class="logoImg" id="thumb_url">
		                            <span class="serviceNameText">${ list.ott_name }</span>
		                            <p class="saveText">매달 세이브!</p>
		                            <div class="priceWrap">
		                                ~ ${ list.plan_price_output }원
		                                <c:if test="${ not empty list.ott_status }">
		                            		<img src="${ path }/images/party/${ list.ott_status }.png" alt="badge_hot" class="badgeIcon">
		                            	</c:if>
                            		</div>
                    			</div>
                    		</c:forEach>
                    	</c:if>
                    </div>
                </section>
        </div>
    </section>
 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script>
$(document).ready(() => {
	
	let path = sessionStorage.getItem("contextpath");
	
	$(".itemBox").on("click", (e) => {
		function getOttNo() {
			if($(e.target).find('input').val() != null) {
				return $(e.target).find('input').val();
			} else {
				return $(e.target).siblings('input').val();
			}
		};
		
		let ottNo = getOttNo();
		
		$("#plan_select").empty();
		
		$.ajax({
			type: "POST",
			url: "${path}/party/modal",
			dataType: "json",
			data: {
				ottNo
			},
			success: (obj) => {				
				let html = "";
								
				$.each(obj, function (index, item) {
					let result = "";
					let price = item.plan_price / item.ott_max_member
					
			        html += "<div class='serviceName_gray'>";
			        html += "<label for='' class='text' id='modal_ott_name'><i class='bi bi-check-lg' ></i>" + item.plan_name + "</label>";
       				html += "<ul class='infoText'>";
			        html += "<input type=hidden value="+ item.plan_no +">";
					html += "<li>파티원 1~" + item.ott_max_member + " 모집 가능!</li>"                            
					html += "<li>파티원 1명당 매달 " + Math.round(price / 1.1) + "원 적립!<br>" + "(파티 분담금 " + Math.round(price) + "원 − 링키드 수수료 " + Math.round(price - (price / 1.1)) + "원)</li>"                            
					html += "<li>최대 인원(3명) 모집하면, 매달 최대 "+ item.plan_price_output + "원 적립</li>"                            
					html += "<li>파티 기간에 따라 종료 시 최대 " + Math.round((item.plan_price * 0.04) * 12) + "원 추가 적립!</li>"                            
	                html += "<li>⚠️ 원단위 절삭으로 5원 이내 차이가 있을 수 있어요.</li></ul></div>";
				
			    });		
				
				//document.getElementById('serviceText').innerHTML = obj[0].ott_name;
				//document.getElementById('titleText').innerHTML = "꼭 '한국' " + obj[0].ott_name + " 계정을 사용해 주세요.";
				//document.getElementById('infoText').innerHTML =  "🇰🇷 " + obj[0].ott_name + " 정책상 거주/이용중인 국가에 따라 재생 가능한 콘텐츠가 다르기 때문에 꼭 한국 넷플릭스 계정을 공유해 주셔야 해요.";
				
				$("#plan_select").append(html);
				
			},
			error: (error) => {
				console.log(error);
			}
		});
	});
	
	$(document).on("click",".serviceName_gray", (e) =>{
		function getPlanNo() {
			if($(e.target).find('input').val() != null) {
				return $(e.target).find('input').val();
			} else {
				return $(e.target).siblings('input').val();
			}
		};
		
		let planNo = getPlanNo();
		
		$.ajax({
			type: "POST",
			url: "${path}/party/getPlanName",
			dataType: "json",
			data: {
				planNo
			},
			success: (obj) => {
				document.getElementById('serviceText').innerHTML = obj.plan.plan_name;
				document.getElementById('titleText').innerHTML = "꼭 '한국' " + obj.plan.plan_name + " 계정을 사용해 주세요.";
				document.getElementById('infoText').innerHTML =  "🇰🇷 " + obj.plan.plan_name + " 정책상 거주/이용중인 국가에 따라 재생 가능한 콘텐츠가 다르기 때문에 꼭 한국 넷플릭스 계정을 공유해 주셔야 해요.";
				document.getElementById('modal_plan_no').value = obj.plan.plan_no;
			},
			error: (error) => {
				console.log(error);
			}
		});
	});
});
/*
	let subToggle=true;
	
	$(".menu").click(()=>{
	  if(subToggle){
	    $(".sub").slideDown(1000);
	  }else{
	    $(".sub").slideUp(1000);
	  }
	  subToggle=!subToggle;
	});				
*/					
				
				
</script>

</body>
</html>