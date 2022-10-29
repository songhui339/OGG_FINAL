<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<script src="${ path }/js/jquery-3.6.0.min.js"></script>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ path }/css/mypage/ogg_myPage.css">

<section class="myPage_section">
    <div class="myPage_Wrap">
        <!-- 메뉴 영역 -->
        <div class="menuBox">
            <div class="box01 longver">
                <div class="menuList">
                    <p class="titleText">회원 정보 관리</p>
                    <!-- <hr> -->
                    <a href="${ path }/mypage/main">
                        <div class="item">회원 정보 수정 / 탈퇴</div>
                    </a>
                    <a href="${ path }/mypage/party">
                        <div class="item">내 파티 관리</div>
                    </a>
                    <a href="${ path }/mypage/board">
                        <div class="item">내 게시글 관리</div>
                    </a>
                    <a href="${ path }/mypage/contents">
                        <div class="item">찜한 컨텐츠</div>
                    </a>
                </div>

                <div class="menuList">
                    <p class="titleText" style="margin-top: 32px;">결제 정보 관리</p>
                    <!-- <hr> -->
                    <a href="${ path }/mypage/payment">
                        <div class="item">결제 수단 / 계좌 관리</div>
                    </a>
                    <a href="${ path }/mypage/point">
                        <div class="item">포인트 관리</div>
                    </a>
                    <a href="${ path }/mypage/payment_history">
                        <div class="item">정산 내역 확인</div>
                    </a>
                    
                </div>
            </div>

            <div class="box02">
                <div class="notice" onclick="location.href='${ path }/mypage/notice';">
                    <!-- <img src="https://linkid.pw/static/media/ic-speaker-24.b2c49cdf.svg" alt="" style="width: 24px; height: 24px; vertical-align: baseline;"> -->
                    <i class="bi bi-megaphone"></i>
                    <p class="text">공지사항</p>
                </div>
                <div class="notice" onclick="location.href='${ path }/mypage/ask';">
                    <i class="bi bi-chat-left-text"></i>
                    <p class="text">1:1 문의 내역</p>
                </div>
            </div>

            
        </div>

        <!-- 정보 영역 -->
        <div class="infoBox">
            <p class="titleText">1:1 문의 내역 <a href="${path }/mypage/ask/write" class="button">문의 작성</a></p>
            
            <div class="line"></div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">제목</th>
                        <th scope="col">작성 날짜</th>
                        <th scope="col">답변 여부</th>
                    </tr>
                </thead>
				<tbody class="partyitem">
					<c:if test="${empty list }">
						<tr>
							<th>문의내역이 없습니다.</th>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:if>

					<c:if test="${not empty list }">
						<c:forEach var="question" items="${list}">
							<tr
								onclick="location.href='${path}/mypage/ask/view?no=${question.q_no}';">
								<th scope="row">${question.q_rno}</th>
								<td>${question.q_title}</td>
								<td><fmt:formatDate type="date"
										value="${ question.q_enrolldate }" /></td>
								<c:if test="${question.q_status == 'Y'}">
									<td><span class="statusY">답변 완료</span></td>
								</c:if>
								<c:if test="${question.q_status == 'N'}">
									<td><span class="statusN">답변 대기</span></td>
								</c:if>
							</tr>

						</c:forEach>
					</c:if>

				</tbody>
			</table>

            <!-- Page 네비게이션 -->
            <div class="pageNav" id="pageBar">
                <!-- 맨 처음으로 -->
                <button class="btn arrowBtn" onclick="location.href='${path}/mypage/ask?page=1'">&lt;&lt;</button>
    
                <!-- 이전 페이지로 -->
                <button class="btn arrowBtn" onclick="location.href='${path}/mypage/ask?page=${pageInfo.prevPage }'">&lt;</button>
    
                <!--  10개 페이지 목록 -->
                <c:forEach begin="${pageInfo.startPage }" end="${pageInfo.endPage }"
                                    varStatus="status">
                <c:if test="${status.current == pageInfo.currentPage }">
                    <button class="btn" disabled>${ status.current }</button>
                </c:if>
                <c:if test="${status.current != pageInfo.currentPage }">
                    <button class="btn pageNoBtn" onclick="location.href='${path}/mypage/ask?page=${status.current }'">${status.current }</button>
                </c:if>
                </c:forEach>
    
                <!-- 다음 페이지로 -->
                <button class="btn arrowBtn" onclick="location.href='${path}/mypage/ask?page=${pageInfo.nextPage }'">&gt;</button>
    
                <!-- 맨 끝으로 -->
                <button class="btn arrowBtn" onclick="location.href='${path}/mypage/ask?page=${pageInfo.maxPage }'">&gt;&gt;</button>
            </div>

        </div>


        <!-- 배너 영역 -->
        <div class="bannerBox">
            <div class="banner">
                <p class="text">더 궁금한 내용이 있으신가요?</p>
                <div class="imgNbtn">
                    <a href="${ path }/faq">FAQ 자세히 보기<i class="bi bi-chevron-right"></i></a>
                    <img src="${ path }/images/common/img_faqBanner.png" alt="faq" class="question">
                </div>
            </div>
        </div>

    </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>