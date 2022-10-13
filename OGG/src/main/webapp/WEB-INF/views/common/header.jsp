<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="ko">

<head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    
 	 <!-- Mainstyle CSS -->
    <link rel="stylesheet" href="${path}/css/common/ogg_common.css">
    
    <title>content</title>
</head>
<body>
    <!-- javascript -->
    <script src="https://d3js.org/d3.v3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
    <!-- 메인 로고와 상단 우측 메뉴 포함한 header> -->
    <header>
        <div class="width-container">
            <div class="logoBox">
                <a href="${ path }/"><img src="${ path }/images/logo/OGG_logo_menu.png"  alt="logo"></a>
            </div>

			<!-- 로그인 전 btnBox -->
            <div class="btnBox">
                <a href="javascript:" class="loginBtn">로그인</a>
            </div>
            
            <!-- 로그인 후 btnBox -->
            <%-- <div class="btnBox">
               <a href="javascript:" class="myPageBtn dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">${m_name} 님</a>
               
              <ul class="dropdown-menu">
               	<li><a class="dropdown-item" href="#">마이페이지</a></li>
               	<li><hr class="dropdown-divider"></li>
               	<li><a class="dropdown-item" href="#">로그아웃</a></li>
              </ul>
            </div> --%>
            
        </div>

        <div class="menu-container">
            <ul class="menuBox">
                <li>
                    <a href="javascript:">파티 만들기</a>
                </li>
                <li>
                    <a href="javascript:">파티 찾기</a>
                </li>
                <li>
                    <a href="javascript:">리뷰</a>
                </li>
                <li>
                    <a href="javascript:">커뮤니티</a>
                </li>
                <li>
                    <a href="javascript:">이벤트</a>
                </li>
            </ul>
        </div>
    </header>
