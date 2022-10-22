<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<!-- 메인 페이지 CSS -->
    <link rel="stylesheet" href="${path}/css/main/ogg_mainPage.css?ver=1.01" class="css">
    
    <!-- 유튜브 팝업창용 코드 -->
    <script type="text/javascript" src="${ path }/js/mainpage/YouTubePopUp.jquery.js"></script>
	<script type="text/javascript">
		jQuery(function(){
			jQuery("a.bla-1").YouTubePopUp();
			jQuery("a.bla-2").YouTubePopUp( { autoplay: 0 } ); // Disable autoplay
		});
	</script>
	
	<style>
		.mainHeader_section .gallery li:nth-child(1) {
		    background: url(${ path }/images/mainpage/mainHeader_01.png) no-repeat center center;
		}
		.mainHeader_section .gallery li:nth-child(2) {
		    background: url(${ path }/images/mainpage/mainHeader_02.png) no-repeat center center;
		}
		.mainHeader_section .gallery li:nth-child(3) {
		    background: url(${ path }/images/mainpage/mainHeader_03.png) no-repeat center center;
		}
		.mainHeader_section .gallery li:nth-child(4) {
		    background: url(${ path }/images/mainpage/mainHeader_04.png) no-repeat center center;
		}
		.mainHeader_section .gallery li:nth-child(5) {
		    background: url(${ path }/images/mainpage/mainHeader_05.png) no-repeat center center;
		}
	</style>

	<section class="mainHeader_section">
        <ul class="gallery">
            <li>
                <div class="content">
                    <h2 class="titleText">환승연애 시즌 2</h2>
                    <p class="subText">- 이별한 커플들의 연애 정거장 - <br>다양한 이유로 이별한 커플들이 한 집에 모여 지나간 연애를 되짚고 <br>새로운 인연을 마주하며 자신만의 사랑을 찾아가는 연애 리얼리티 프로그램</p>
                    <a class="bla-1 btn trailerBtn" href="https://www.youtube.com/watch?v=3S1asSWEqpM">Watch Trailer</a> 
                </div>
            </li>
            <li>
                <div class="content">
                    <h2 class="titleText">범죄도시 2</h2>
                    <p class="subText">‘마석도’와 금천서 강력반은 한국과 베트남을 오가며 역대급 범죄를 저지르는 ‘강해상’을 <br>본격적으로 쫓기 시작하는데... 나쁜 놈들 잡는 데 국경 없다!<br> 통쾌하고 화끈한 범죄 소탕 작전이 다시 펼쳐진다!</p>
                    <!-- <button class="btn bla-1">Watch Trailer</button> -->
                    <a class="bla-1 btn trailerBtn" href="https://www.youtube.com/watch?v=aw9j_23nORs&t=1s">Watch Trailer</a> 
                </div>
            </li>
            <li>
                <div class="content">
                    <h2 class="titleText">라라랜드</h2>
                    <p class="subText">꿈을 꾸는 사람들을 위한 별들의 도시 ‘라라랜드’. <br>재즈 피아니스트 ‘세바스찬’(라이언 고슬링)과 배우 지망생 ‘미아’(엠마 스톤), <br>인생에서 가장 빛나는 순간 만난 두 사람은 미완성인 서로의 무대를 만들어가기 시작한다.</p>
                    <a class="bla-1 btn trailerBtn" href="https://www.youtube.com/watch?v=0pdqf4P9MB8">Watch Trailer</a> 
                </div>
            </li>
            <li>
                <div class="content">
                    <h2 class="titleText">스파이더맨 노 웨이 홈</h2>
                    <p class="subText">문제를 해결하기 위해 닥터 스트레인지를 찾아가 도움을 청하지만 뜻하지 않게 <br>멀티버스가 열리면서 각기 다른 차원의 불청객들이 나타난다. 숙적들의 강력한 공격에 <br>‘피터 파커’는 사상 최악의 위기를 맞게 되는데…</p>
                    <a class="bla-1 btn trailerBtn" href="https://www.youtube.com/watch?v=JfVOs4VSpmA">Watch Trailer</a> 
                </div>
            </li>
            <li>
                <div class="content">
                    <h2 class="titleText">완다비전</h2>
                    <p class="subText">슈퍼히어로 완다와 비전이 마침내 결혼해<br>웨스트뷰라는 마을에 정착해 행복한 생활을 이어가지만 <br>언제부터인가 현재의 삶이 현실이 아니라고 의심하면서 생기는 이야기</p>
                    <a class="bla-1 btn trailerBtn" href="https://www.youtube.com/watch?v=sj9J2ecsSpo">Watch Trailer</a> 
                </div>
            </li>
        </ul>
    </section>
  
  <div>
        <p style="text-align: center; padding: 200px 0; font-size: 2rem; margin: 0;">메인 페이지 내용</p>
    </div>
 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>