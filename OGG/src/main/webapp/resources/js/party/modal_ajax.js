$(document).ready(() => {
	
	let path = sessionStorage.getItem("contextpath");
	
	$(".itemBox").on("click", (e) => {
		function getOttNo() {
			if($(e.target).find('input').val() != null) {
				return $(e.target).find('input').val();
			} else {
				return $(e.target).siblings('input').val();
			}
		}
		let ottNo = getOttNo();
		
		$.ajax({
			type: "POST",
			url: path + "/party/modal",
			dataType: "json",
			data: {
				ottNo
			},
			success: (obj) => {
				let price = (obj.getOtt.plan_price / obj.getOtt.ott_max_member); 
				
				document.getElementById('modal_ott_name').innerHTML = (obj.getOtt.plan_name);
				document.getElementById('modal_text_line1').innerHTML = "파티원 1~" + (obj.getOtt.ott_max_member) + " 모집 가능!";
				document.getElementById('modal_text_line2').innerHTML = "파티원 1명당 매달 " + Math.round(price / 1.1) + "원 적립!<br>" + "(파티 분담금 " + price + "원 − 링키드 수수료 " + Math.round(price - (price / 1.1)) + "원)";
				document.getElementById('modal_text_line3').innerHTML = "최대 인원(3명) 모집하면, 매달 최대 "+ obj.getOtt.plan_price_output + "원 적립";
				document.getElementById('modal_text_line4').innerHTML = "파티 기간에 따라 종료 시 최대 " + Math.round((obj.getOtt.plan_price * 0.04) * 12) + "원 추가 적립!";
				document.getElementById('modal_ott_no').value = obj.getOtt.ott_no;
				document.getElementById('serviceText').innerHTML = (obj.getOtt.plan_name);
				document.getElementById('titleText').innerHTML = "꼭 '한국' " + obj.getOtt.plan_name + " 계정을 사용해 주세요.";
				document.getElementById('infoText').innerHTML =  "🇰🇷 " + obj.getOtt.ott_name + " 정책상 거주/이용중인 국가에 따라 재생 가능한 콘텐츠가 다르기 때문에 꼭 한국 넷플릭스 계정을 공유해 주셔야 해요.";
			},
			error: (error) => {
				console.log(error);
			}
		});
	});
	
});
