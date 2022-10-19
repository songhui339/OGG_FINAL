<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
 
	<!-- 1st row -->
	<div class="container" style="height: 250px;">
	    <div class="row" style="height: 100%;"> 
	        <div class="col-sm-3" style="height: 100%; width: 13em;">
	            <div class="card" id="filmDetail0" style="height: 100%; border: none;">
	
	            </div>
	        </div>
	        <div class="col-sm-9" style="margin-top: 5%;" >
	            <div id="filmDetail1">
	
	            </div>
	            <div class="row">
	                <div class="col-3 col-sm-3" style="margin-bottom: 10px;">
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
		                    <a href="">
		                		<img src="${path}/images/review/plus.png" height="30px;">
		                        보고싶어요
		                    </a>
						</c:if>
	                    <c:if test="${ loginMember == null }">
		                    <a href="" onclick="alert('로그인 후 이용 가능합니다')">
		                		<img src="${path}/images/review/plus.png" height="30px;">
		                        보고싶어요
		                    </a>
						</c:if>
	                </div>
	                <div class="col-3 col-sm-3">
        				<c:if test="${ loginMember != null }">
		                    <a href="" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="남기기">
		                		<img src="${path}/images/review/pen.png" height="30px;">
		                        리뷰
		                    </a>
						</c:if>
						<c:if test="${ loginMember == null }">
		                    <a href="" onclick="alert('로그인 후 이용 가능합니다')">
		                		<img src="${path}/images/review/pen.png" height="30px;">
		                        리뷰
		                    </a>
	                    </c:if>
	                </div>
	                <div class="col-3 col-sm-3"></div>
	            </div>
	        </div>
	    </div>
	</div>
	<hr>

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
					console.log(num)

					$('#' + num + '-star').attr('checked', 'checked');
					console.log('got star');
				}
			},
			error: function (error) {
				console.log('do nothing');
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
				// console.log(data.star)
			},
			error : (error) => {
				alert('서버와 연결에 실패하였습니다');
			}
		});
	}
	</script>