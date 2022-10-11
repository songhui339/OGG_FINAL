<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ path }/css/party/ogg_submitParty.css">

<section class="submitPartyDetail_section">
    <div class="contentWrap">
        <div class="formBox">
            <div class="serviceInfoBox">
                <p class="text">
                    이용 서비스
                    <img src="../파이널 UI 설계 이미지/logo_netflix.png" alt="logoImg" class="logoImg">
                    <span class="nameText">넷플릭스 프리미엄</span>
                </p>
            </div>
            <form name="fregister" id="fregister" method="POST" autocomplete="off" class="form" role="form">
                <h3><span class="c_purple">파티 정보</span></h3>
                <div class="form-round-box">
                    <ul class="form-list">
                        <li>
                            <span class="subject">파티 기간</span>
                            <input type="text" name="" id="" required="" value="오늘 ~ 2023.03.22">
                        </li>
                        <li>
                            <span class="subject">파티 요금 (월, VAT 포함)</span>
                            <input type="text" name="" id="" required="" value="3,450원">
                        </li>
                        </ul>
                </div>

                <h3><span class="c_purple">결제 수단</span></h3>
                <div class="form-round-box">
                    <ul class="form-list">
                        <li>
                            <span class="subject">카드 번호</span>
                            <input type="text" name="" id="" required="" value="[현대] ******9413">
                            <span><a href="#">변경하기 <i class="bi bi-pencil-square"></i></a></span>
                        </li>
                        <li>
                            <span class="subject">정산일</span>
                            <input type="text" name="" id="" required="" value="매달 1일">
                        </li>
                    </ul>
                </div>


                <h3><span class="c_purple">파티 가입 규칙</span> 확인</h3>
                <div class="form-round-box">
                        <div class="ruleBox" style="margin-bottom: 20px;">
                            <p class="titleText"><i class="bi bi-check-lg" style="color: #7e69fe;"></i> 3,450원이 등록한 카드를 통해 결제될 예정이며, 결제 진행에 동의합니다.</p>
                        </div>

                        <div class="ruleBox" style="margin-bottom: 20px;">
                            <p class="titleText"><i class="bi bi-check-lg" style="color: #7e69fe;"></i> 파티 가입시 지불하는 파티 보증금 4,080원은 파티가 끝나면 100% 환급되며, 파티 중도 탈퇴 시 환급되지 않습니다.</p>
                        </div>

                        <div class="ruleBox" style="margin-bottom: 20px;">
                            <p class="titleText"><i class="bi bi-check-lg" style="color: #7e69fe;"></i> 다음 정산일(1일) 부터는 OGG 수수료가 포함된 3,450원의 파티 요금이 결제됩니다.</p>
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
                            <input type="text" name="" id="" required="" value="889원">
                        </li>
                        <li>
                            <span class="subject">파티 보증금</span>
                            <input type="text" name="" id="" required="" value="4,080원">
                        </li>
                        <li>
                            <span class="subject">합계</span>
                            <input type="text" name="" id="" required="" value="4,969원">
                        </li>
                        <hr>
                        <li>
                            <span class="subject price">카드 결제</span>
                            <input type="text" name="" id="" required="" value="4,969원" class="priceValue">
                        </li>
                    </ul>
                </div>

                <div class="buttonBox">
                    <button type="submit" class="button" onclick="location('')">뒤로 가기</button>
                    <button type="submit" class="button button-purple">결제하고 파티 시작하기</button>
                </div>

            </form>

        </div>
    </div>
</section>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>