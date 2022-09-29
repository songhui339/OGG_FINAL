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
	            <div class="card" id="filmDetail0" style="height: 100%; border: none">
	
	            </div>
	        </div>
	        <div class="col-sm-9" style="margin-top: 5%;" >
	            <div id="filmDetail1">
	
	            </div>
	            <div class="row">
	                <div class="col-3 col-sm-3" style="margin-bottom: 10px;">
	                    <div class="star-rating space-x-4 mx-auto">
	                        <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
	                        <label for="5-stars" class="star pr-4">★&nbsp;</label>
	                        <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
	                        <label for="4-stars" class="star">★&nbsp;</label>
	                        <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
	                        <label for="3-stars" class="star">★&nbsp;</label>
	                        <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
	                        <label for="2-stars" class="star">★&nbsp;</label>
	                        <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
	                        <label for="1-star" class="star">★&nbsp;</label>
	                    </div>
	                </div>
	                <div class="col-3 col-sm-2">
	                    <a href="">
	                		<img src="${path}/images/review/plus.png" height="30px;">
	                        보고싶어요
	                    </a>
	                </div>
	                <div class="col-3 col-sm-3">
	                    <a href="">
	                		<img src="${path}/images/review/pen.png" height="30px;">
	                        코멘트
	                    </a>
	                </div>
	                <div class="col-3 col-sm-3"></div>
	            </div>
	        </div>
	    </div>
	</div>
	<hr>