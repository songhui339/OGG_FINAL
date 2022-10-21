<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

    <!-- 푸터 -->
    <footer>
        <div class="width-container">
            <div class="contentWrap">
                <div class="logoBox">
                    <img src="${ path }/images/logo/OGG_logo_footer.png"  alt="logo">
                </div>
                <a href="javascript:" target="_blank" class="v-bar">회사 소개</a>
                <a href="javascript:" target="_blank" class="v-bar">제휴문의</a>
                <a href="javascript:" target="_blank" class="v-bar">제휴문의</a>
                <a href="javascript:" target="_blank" class="v-bar">1:1문의하기</a>
                <a href="javascript:" target="_blank" class="v-bar"><strong>개인정보처리방침</strong></a>
                <a href="javascript:" target="_blank" class="v-bar">이용약관</a>
                <a href="${ path }/faq" target="_blank" class="v-bar">FAQ</a>
                <br><br>
                <span class="v-bar">상호 : OGG</span>
                <span>대표 : 이정후</span>
                <br>
                <span>주소 : 서울특별시 강남구 강남구 테헤란로14길 6</span>
				<br>
				<span class="v-bar">사업자등록번호 : 5151-5555-1111</span>
				<span class="v-bar"><a href="javascript:" target="_blank"> <strong>사업자정보확인</strong></a></span>
				<span>통신판매번호 : 제 2019-의정부송산-040호</span>
				<br>
				<span class="v-bar">개인정보보호책임 : 이정후</span> <span>호스팅 : Apache Tomcat</span>
				<br>
				<span class="v-bar">이메일 : <a href="mailto:manager@ogg.co.kr">manager@ogg.co.kr</a></span> <span>대표전화 : 070-4354-1015</span>
				<br>
				<br>
				<span>Copyright © 2022 OGG Inc. All rights reserved.</span>
            </div>
        </div>
    </footer>
    <footer>
        <div class="width-container">
        OGG는 통신판매중개자이며, 통신판매의 당사자가 아닙니다.파티정보, 구매에 관한 의무와 책임은 판매자에게 있습니다.<br>
        OGG는 소비자 보호와 안전거래를 위해고객센터(manager@ogg.co.kr)를 운영하고 있으며,분쟁이 발생 된 경우 별도의 분쟁처리절차에 의거분쟁해결 및 청약철회 등이 진행 됩니다.
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>