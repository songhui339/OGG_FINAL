<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!-- 리뷰 내용 -->
<div id="div_review">
    <p id="board-text1">작성자</p>
    <hr>
    <p id="board-text3">
        영화 리뷰 내용 <br>
        영화 리뷰 내용 <br>
        영화 리뷰 내용 <br>
        영화 리뷰 내용 <br>
    </p><hr>
    <div class="row" id="detail-text">
        <div class="col-sm-1">
            <img src="${path}/images/review/heart2.png" style="margin-left: 10px;" height="30px;">
            2
        </div>
        <div class="col-sm-8">
            <img src="${path}/images/review/comment2.png"  height="30px;">
            13
        </div>
        <!--<div class="col-sm-1"><button class="btn btn-primary" type="button">수정</button></div>
        <div class="col-sm-1"><button class="btn btn-primary" type="button">삭제</button></div> -->
        <div class="col-sm-3">
            <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 55%;">
                <button class="btn btn-primary" type="button">수정</button>
                <button class="btn btn-primary" type="button">삭제</button>
            </div>        
        </div>
    </div>
</div>
<br>
<!-- 리뷰 내용 끝-->