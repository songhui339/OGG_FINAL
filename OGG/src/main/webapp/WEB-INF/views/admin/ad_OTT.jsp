<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자페이지 OTT</title>
		<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path }/css/admin/admin.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>        
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="${path}/admin/home">관리자 페이지</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar-->
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
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
                        <h1 class="mt-4">OTT관리</h1>
                        <br>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                OTT 관리
                            </div> 
                            <div class="card-body"> 
                                <table id="datatablesSimple2">
                                <button type="button" class="btn btn-primary" style="float:right;" onclick="window.open('${path}/admin/addOTT','','left=500px,top=200px,width=570px,height=430px')" >OTT 추가하기</button>
                                    <br><br>
                                    <thead>
                                        <tr>
                                            <th>OTT 번호</th>
                                            <th>OTT 이름</th>
                                            <th>분류</th>
                                            <th>파티별 최대 인원</th>
                                            <th>플랜 이름</th>
                                            <th>플랜 금액</th>
                                            <th>이미지 소스</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="ott" items="${list}">
                                        <tr>
                                            <td>${ott.ott_no}</td>
                                            <td><a href="javascript:ottdel(${ott.ott_no})">${ott.ott_name }</a></td>
                                            <td>${ott.ott_class }</td>
                                            <td>${ott.ott_max_member }명</td>
                                            <td>${ott.plan_name }</td>
                                            <td>${ott.plan_price }</td>
                                            <td><a href='#'onclick="window.open('${path }/images/party/${ott.ott_thumb }.png','??','left=750px,top=300px,width=200px,height=200px')">${ott.ott_thumb }</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>OTT 이름</th>
                                            <th>OTT이름</th>
                                            <th>OTT썸네일</th>
                                            <th>분류</th>
                                            <th>파티별 최대 인원</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        이용자 수 그래프
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        OTT별 이용자 점유 수
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
         <script>
        var a = ${muser.marchUser};
        var b = ${muser.juneUser};
        var c = ${muser.sepUser};
        var d = ${muser.decUser};
        
        var fn = "${pielist[0].ott_name}";
        var fc = ${pielist[0].count}/${pc} *100;
        var sn = "${pielist[1].ott_name}";
        var sc = ${pielist[1].count}/${pc} *100;
        var tn = "${pielist[2].ott_name}";
        var tc = ${pielist[2].count}/${pc} *100;
        var forn = "${pielist[3].ott_name}";
        var forc = ${pielist[3].count}/${pc} *100;
        
        var pc = 100-fc-sc-tc-forc;
        
        
        function ottdel(e){
            if(confirm("정말로 OTT를 삭제 하시겠습니까?")) {
            	location.replace("${ path }/ott/delete?ott_no="+e);
            }	
        }
            
		</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/js/admin/script.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${path}/js/admin/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/js/admin/ottTable.js"></script>
        <script src="${path}/js/admin/bar.js"></script>
        <script src="${path}/js/admin/pie.js"></script>
    </body>
</html>
