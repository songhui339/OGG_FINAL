<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 
	<!-- 1st row -->
	<div class="container" id="baback">
	</div>
	<div class="container" id="aback">
	</div>
	<div class="container" id="back">
	    <div class="row"> 
	        <div class="col-sm-3" id="filmDetail0" style="height: 100%; width: 13em; padding-top:30px;">
	        </div>
	        <div class="col-sm-9" style="margin-top: 5%; padding-top:30px;">
	            <div id="filmDetail1">
	
	            </div>
	            <div class="row">
	                <div class="col-3 col-sm-3" style="margin-bottom: 30px;">
	                    <div class="star-rating space-x-4 mx-auto">
	                        <input type="radio" id="5-star" name="rating" value="5" v-model="ratings" onclick="starFilm(event)"/>
	                        <label for="5-star" class="star pr-4">★&nbsp;</label>
	                        <input type="radio" id="4-star" name="rating" value="4" v-model="ratings" onclick="starFilm(event)"/>
	                        <label for="4-star" class="star">★&nbsp;</label>
	                        <input type="radio" id="3-star" name="rating" value="3" v-model="ratings" onclick="starFilm(event)"/>
	                        <label for="3-star" class="star">★&nbsp;</label>
	                        <input type="radio" id="2-star" name="rating" value="2" v-model="ratings" onclick="starFilm(event)"/>
	                        <label for="2-star" class="star">★&nbsp;</label>
	                        <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" onclick="starFilm(event)"/>
	                        <label for="1-star" class="star">★&nbsp;</label>
	                    </div>
	                </div>
	                <div class="col-3 col-sm-2">
	                    <c:if test="${ loginMember != null }">
								<p id="likeFilm" onclick="likeFilm(event)"> 
									<img src="${path}/images/review/plus.png" height="30px;" id="filmBefore">
									&nbsp;보고싶어요
								</p>
								<p id="dislikeFilm" style="display: none;" onclick="dislikeFilm(event)"> 
									<img src="${path}/images/review/checked.png" style ="height:30px;" id="filmAfter">
									&nbsp;추가된 영화
								</p>
						</c:if>
	                    <c:if test="${ loginMember == null }">
		                    <a href="" onclick="alert('로그인 후 이용 가능합니다')">
		                		<img src="${path}/images/review/plus.png" height="30px;">
		                        &nbsp;보고싶어요
		                    </a>
						</c:if>
	                </div>
	                <div class="col-3 col-sm-3">
        				<c:if test="${ loginMember != null }">
							<c:if test="${ review == null }">
								<a href="" data-bs-toggle="modal" data-bs-target="#reviewModal" data-bs-whatever="남기기">
									<img src="${path}/images/review/pen.png" height="30px;">
									리뷰
								</a>
            				</c:if>
							<c:if test="${ review != null }">
								<a href="" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="남기기">
									<img src="${path}/images/review/pen.png" height="30px;">
									수정
								</a>
            				</c:if>
						</c:if>
						<c:if test="${ loginMember == null }">
		                    <a href="" onclick="alert('로그인 후 이용 가능합니다')">
		                		<img src="${path}/images/review/pen.png" height="30px;">
		                        리뷰
		                    </a>
	                    </c:if>
	                </div>
	                <div class="col-3 col-sm-3">
					<!-- 모달 -->
					<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header"id="modal-header">
									<h5 class="modal-title" id="reviewModalLabel">영화 이름</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form>
									<div class="mb-3">
										<label for="message-text" class="col-form-label"></label>
										<textarea class="form-control" id="message-text" placeholder="이 작품에 대한 생각을 자유롭게 표현해주세요." style="height: 300px;"></textarea>
									</div>
									</form>
								</div>
								<div class="modal-footer">
									<span id="textLengthCheck">(0 / 2000)</span>
									<button type="button" class="btn btn-primary" id="writeReview" data-bs-dismiss="modal">저장</button>
								</div>
							</div>
						</div>
					</div>
					<%-- 모달 2 --%>
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
							<div class="modal-content">
								<div class="modal-header"id="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">리뷰 수정</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<form>
									<div class="mb-3">
										<label for="message-text2" class="col-form-label"></label>
										<textarea class="form-control" id="message-text2" style="height: 300px;">${ review.rvContent }</textarea>
									</div>
									</form>
								</div>
								<div class="modal-footer">
									<span id="textLengthCheck2">(0 / 2000)</span>
									<button type="button" class="btn btn-primary" id="updateReview" data-bs-dismiss="modal">저장</button>
								</div>
							</div>
						</div>
					</div>
					</div>
	            </div>
	        </div>
	    </div>
	</div>
	<%-- <hr> --%>
	<script>
	$(document).ready(function() {

		$.ajax({
			async: true,
			type : 'POST',
			url : contextpath + '/review/get_star',
			data : {
				'fCode' : fcode,
				'ftype' : ftype
			},
			success : (data) => {

				if(data.star != null){
					let num = data.star.fstar;
					console.log(num);

					$('#' + num + '-star').attr('checked', 'checked');
					console.log('영화 별점 있음');
				}
					console.log('영화 별점 없음');
			},
			error: function (error) {
				console.log('별점 통신 에러');
			}
		});

		$.ajax({
			async: true,
			type : 'POST',
			url : contextpath + '/review/get_filmlikes',
			data : {
				'lType' : 'FILM',
				'fCode' : fcode,
				'ftype' : ftype
			},
			success : (data) => {

				if(!data){
					console.log('영화 찜 없음');
				}else{
					if(data.likeFilm.fcode == null || data.likeFilm.flikes == 0){
					}else{
						$('#likeFilm').hide();
						$('#dislikeFilm').show();
						console.log('영화 찜 있음');
					}
				}
			},
			error: function (error) {
				console.log('영화 찜 가져오기 통신 오류');
			}
		});
	});

	function starFilm(event) {
		fStar = document.querySelector('.star-rating :checked').value;

		$.ajax({
			async: true,
			type : 'POST',
			url : contextpath + '/review/insert_star',
			data : {
				'fStar' : fStar, 
				'fTitle' : title, 
				'fCode' : fcode,
				'ftype' : ftype
			},
			success : (data) => {
				alert('별점이 등록되었습니다');
			},
			error : (error) => {
				alert('로그인 후 이용 가능합니다');
			}
		});
	}

	function likeFilm(event) {
		$.ajax({
			async: true,
			type : 'POST',
			url : contextpath + '/review/like_film',
			data : {
				'fTitle' : title, 
				'lType' : 'FILM',
				'fCode' : fcode,
				'ftype' : ftype
			},
			success : (data) => {
				$(event.target).hide();
				$(event.target).next().show();
			},
			error : (error) => {
				alert('영화 찜하기 통신오류');
			}
		});
	}

	function dislikeFilm(event) {
		$.ajax({
			async: true,
			type : 'POST',
			url : contextpath + '/review/dislike_film',
			data : {
				'fTitle' : title, 
				'lType' : 'FILM',
				'fCode' : fcode,
				'ftype' : ftype
			},
			success : (data) => {
				$(event.target).hide();
				$(event.target).prev().show();
			},
			error : (error) => {
				alert('영화 찜취소 통신오류');
			}
		});
	}
	</script>