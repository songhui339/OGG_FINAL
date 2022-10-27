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
    <link rel="stylesheet" href="${path}/css/main/ogg_mainPage.css?ver=1.04" class="css">
    <link rel="stylesheet" href="${path}/css/main/owl.carousel.min.css" class="css">
    <link rel="stylesheet" href="${path}/css/main/owl.theme.default.min.css" class="css">
    
    <!-- 유튜브 팝업창용 코드 -->
    <script type="text/javascript" src="${ path }/js/mainpage/YouTubePopUp.jquery.js"></script>
    <script type="text/javascript" src="${ path }/js/mainpage/owl.carousel.min.js"></script>
    
    <!-- animation 효과를 위한 CSS & JS  -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
	<script type="text/javascript">
		jQuery(function(){
			jQuery("a.bla-1").YouTubePopUp( );
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
  
  	<div class="scrollDown_new">
        <a href="#nextSection">
            <img src="${ path }/images/mainpage/icon_scrollDown.png" alt="scrollDown icon">
        </a>
    </div>
    
     <section class="party_section" id="nextSection">
        <div class="titleBox">
            <h2 class="titleText">OGG <span class="c_purple">파티</span></h2>
            <button onclick="location.href='${path}/party/ottlist_create'" class="btn writeBtn">파티 만들기</button>
        </div>

        <div class="owl-carousel owl-theme contentBox">
           <!-- Party Slide Item START -->
            <c:if test="${ not empty list }">
	            <c:forEach var="list" items="${ list }">
		            <div class="item itemBox" onclick="location.href='${path}/party/partyDetail?no=${list.p_no}'">
		                <div class="title">
		                    <div class="logoImg">
		                        <img src="${ path }/images/party/${ list.ott_thumb }.png" alt="logoImg">
		                    </div>
		                    <div class="titleText">
		                        <p class="text">${ list.plan_name }</p>
		                        <p class="subText">${ list.p_comment }</p>
		                    </div>
		                </div>
		                <input type="hidden" id="max_member" value="${ list.p_max_member }">
		                <input type="hidden" id="cur_member" value="${ list.p_cur_member }">
		                <div class="item-members">
		                	<c:forEach var="i" begin="0" end="${ list.p_max_member }" step="1">
		                		<c:if test="${ i <= list.p_cur_member }">
		                    		<span class="item-member"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small.png" alt=""></span>
		                		</c:if>
		                		<c:if test="${ i > list.p_cur_member }">
				                    <span class="item-member"><img src="https://buts.co.kr/thema/Buts/colorset/Basic/img/icon-butsicon-small-glay.png" alt=""></span>
		                		</c:if>
		                	</c:forEach>
		                </div>
		                <div class="item-info">
		                    <div class="item-date" id="period_day">
		                    <input type="hidden" id="end_date" value="${ list.p_end_date }">
		                        ${ list.p_end_date_output }<span class="pc-inline">까지</span>(<strong>${ list.p_period_day }</strong>일)
		                    </div>
		                    <div class="item-price"><span class="price">${ list.p_entry_price_output }</span>원</div>
		                </div>
		            </div>
	            </c:forEach>
			</c:if>
		            <!-- Party Slide Item END -->
			
        </div>

        <script>
            $('.owl-carousel').owlCarousel({
                nav:true,
                loop: true,
                dots: true,
                autoplay:true,
                rewind: true,
                autoplayTimeout: 2000,
                margin:10,
                responsiveClass:true,
                responsive:{
                    0:{
                        items:2,
                        nav:true
                    },
                    600:{
                        items:3,
                        nav:false
                    },
                    1000:{
                        items:3,
                        nav:true,
                        loop:false
                    }
                }
            });
        </script>
        
    </section>
    
    <section class="info_section">
        <script> 
            AOS.init(); 
        </script>
        <div class="titleBox">
            <img src="${ path }/images/logo/OGG_logo.png" alt="logoImg" class="logoImg">
            <!-- <p class="titleText" data-aos="fade-up" data-aos-duration="1000"> -->
            <p class="titleText">
                생활 속 모든 구독 서비스 부터<br>다양한 콘텐츠 리뷰와 커뮤니티까지!
                <br>모두 OGG에서 만나보세요.
            </p>
        </div>

        <!-- <div class="bannerWrap" data-aos="fade-up" data-aos-duration="5000"> -->
        <div class="bannerWrap">
            <div class="bannerBox partybanner" 
            		 data-aos="zoom-in-down"  data-aos-duration="1500"
            		 onclick="location.href='${ path }/party/ottlist_find';" >
                <div>
                    <label>#1 파티 시작하기</label>
                    <p class="text">내가 원하는, <br>나에게 딱 맞는 최적의 <br>파티를 시작해보세요.</p>
                </div>
                <div class="imgBox">
                    <img src="${ path }/images/mainpage/bannerimg_01.png" alt="img" >
                </div>
            </div>
            <div class="bannerBox reviewBanner" 
            		data-aos="zoom-in-up"  data-aos-duration="2500"
            		onclick="location.href='${ path }/film/list';">
                <div>
                    <label>#2 콘텐츠 리뷰</label>
                    <p class="text">다양한 콘텐츠 <br>정보 확인도 하고 <br>리뷰도 남겨보세요.</p>
                </div>
                <div class="imgBox">
                    <img src="${ path }/images/mainpage/bannerimg_02.png" alt="img" >
                </div>
            </div>
            <div class="bannerBox communityBanner" 
            		data-aos="zoom-in-down"  data-aos-duration="1500"
            		onclick="location.href='${ path }/community/list.do';">
                <div>
                    <label>#3 커뮤니티</label>
                    <p class="text">OGG 멤버들과 자유롭게 소통해보세요.</p>
                </div>
                <div class="imgBox">
                    <img src="${ path }/images/mainpage/bannerimg_03.png" alt="img" >
                </div>
            </div>
            
            <div class="bannerBox faqBanner" 
            		data-aos="zoom-in-up" data-aos-duration="3000"
            		onclick="location.href='${ path }/faq';">
                <div>
                    <label>#4 FAQ</label>
                    <p class="text">OGG 멤버들이 <br>자주 묻는 질문들! <br>보기 좋게 모아봤어요.</p>
                </div>
                <div class="imgBox">
                    <img src="${ path }/images/mainpage/bannerimg_04.png" alt="img" >
                </div>
            </div>
        </div>
    </section>
    
 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>