<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- favicon tags -->
<link rel="apple-touch-icon" sizes="180x180" href="${ path }/images/favicon_io/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${ path }/images/favicon_io/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${ path }/images/favicon_io/favicon-16x16.png">
<link rel="manifest" href="${ path }/images/favicon_io/site.webmanifest">
<title>공지사항 리스트</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="${path }/css/admin/admin.css" rel="stylesheet" />
<link rel="stylesheet" href="${path }/css/admin/notice.css">


<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="${path}/admin/home">관리자 페이지</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar-->
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<a class="nav-link" href="/">
                                <div class="sb-nav-link-icon"><i class="fa-sharp fa-solid fa-house"></i></div>
                                홈으로
                            </a>
                            <a class="nav-link" href="${path}/admin/home">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-toolbox"></i></div>
                                관리자 메인
                            </a>
                            <a class="nav-link" href="${path}/admin/OTT">
                                <div class="sb-nav-link-icon"><i class="fa-sharp fa-solid fa-video"></i></div>
                                OTT관리
                            </a>
                            <a class="nav-link" href="${path}/admin/member">
                                <div class="sb-nav-link-icon"><i class="fa-sharp fa-solid fa-user"></i></div>
                                회원관리
                            </a>
                            <a class="nav-link" href="${path}/admin/notice">
                                <div class="sb-nav-link-icon"><i class="fa-sharp fa-solid fa-bell"></i></div>
                                공지사항
                            </a>
                            <a class="nav-link" href="${path}/admin/question">
                                <div class="sb-nav-link-icon"><i class="fa-sharp fa-solid fa-envelope"></i></div>
                                문의/신고
                            </a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Start Bootstrap
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">공지 사항</h1>
					<br>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fa-sharp fa-solid fa-bell"></i>&nbsp;공지 사항
						</div>
						<div class="card-body">
							<div class="page-title">
								<div class="container">
									<br>
									<h3>공지사항</h3>
								</div>
							</div>
							<!-- board seach area -->
							<div id="board-search">
								<div class="container">
									<button id="goWrite" class="btn writeBtn" onclick="location='${path}/notice/write'" >글쓰기</button>
									<div class="search-window">
										<div class="search-wrap"></div>
									</div>
								</div>
							</div>

							<!-- board list area -->
							<div id="board-list">
								<div class="container">
									<table class="board-table">
										<thead>
											<tr>
												<th scope="col" class="th-num">번호</th>
												<th scope="col" class="th-title">제목</th>
												<th scope="col" class="th-writer">작성자</th>
												<th scope="col" class="th-date">등록일</th>
												<th scope="col" class="th-count">조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty list }">
												<tr>
													<td></td>
													<th><a href="#!">게시글이 없습니다.</a></th>
													<td></td>
													<td></td>
													<td></td>
												</tr>
											</c:if>

											<c:if test="${not empty list }">
												<c:forEach var="notice" items="${list}">
													<tr>
														<td>${notice.n_rno}</td>
														<th>
															<a href="${path}/admin/notice/view?no=${notice.n_no}">
																${notice.n_title}
															</a>
														</th>
														<td>${notice.n_m_name}</td>
														<td><fmt:formatDate type="date" value="${ notice.n_Create_Date }" /></td>
														<td>${notice.n_readcount}</td>
													</tr>
												</c:forEach>
											</c:if>

										</tbody>
									</table>
								</div>
							</div>



							<div id="pageBar">
								<!-- 맨 처음으로 -->
								<button onclick="location.href='${path}/admin/notice?page=1'">&lt;&lt;</button>

								<!-- 이전 페이지로 -->
								<button
									onclick="location.href='${path}/admin/notice?page=${pageInfo.prevPage }'">&lt;</button>

								<!--  10개 페이지 목록 -->

								<c:forEach begin="${pageInfo.startPage }"
									end="${pageInfo.endPage }" varStatus="status">
									<c:if test="${status.current == pageInfo.currentPage }">
										<button disabled
											style="background-color: black; color: white;">${status.current }</button>
									</c:if>

									<c:if test="${status.current != pageInfo.currentPage }">
										<button
											onclick="location.href='${path}/admin/notice?page=${status.current }'">${status.current }</button>
									</c:if>
								</c:forEach>


								<!-- 다음 페이지로 -->
								<button
									onclick="location.href='${path}/admin/notice?page=${pageInfo.nextPage }'">&gt;</button>

								<!-- 맨 끝으로 -->
								<button
									onclick="location.href='${path}/admin/notice?page=${pageInfo.maxPage }'">&gt;&gt;</button>
							</div>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2022</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${path}/js/admin/script.js"></script>
</body>
</html>
