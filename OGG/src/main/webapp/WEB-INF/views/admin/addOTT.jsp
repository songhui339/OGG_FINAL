<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- favicon tags -->
		<link rel="apple-touch-icon" sizes="180x180" href="${ path }/images/favicon_io/apple-touch-icon.png">
		<link rel="icon" type="image/png" sizes="32x32" href="${ path }/images/favicon_io/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="16x16" href="${ path }/images/favicon_io/favicon-16x16.png">
		<link rel="manifest" href="${ path }/images/favicon_io/site.webmanifest">
    <title>OTT 추가하기</title>
    <script src="${path }/js/jquery-3.6.0.min.js"></script>
    <link href="${path }/css/admin/admin_sh.css" rel="stylesheet" />
     <!-- <style>
        input{
            border: none;
        }
        table{
            width: 1064.4px;
        }
        th{
            background-color: rgb(189, 139, 235);
            width: 150px;
        }
    </style> -->
</head>
<body>
    <form action="${path}/admin/addOTT" method="POST" enctype="multipart/form-data">
        
        <div class="formBox">
            <ul class="form-list">
                <li>
                    <label>OTT 이름</label>
                    <input type="text" name="ott_name">
                </li>
                <li>
                    <label for="">서비스 종류</label>
                    <select name="ott_class" class="form-select" aria-label="Default select example">
                        <optgroup label="서비스 종류">
                            <option value="mediaService">미디어 서비스</option>
                            <option value="gameService">게임 서비스</option>
                            <option value="eduService">교육 서비스</option>
                            <option value="utilityService">유틸리티</option>
                            <option value="membershipService">멤버쉽 서비스</option>
                        </optgroup>
                        <option selected>============</option>
                    </select>
                </li>
                <li>
                    <label for="">파티별 최대 인원</label>
                    <input type="number" name="ott_max_member">
                </li>
                <li>
                    <label for="">플랜 이름</label>
                    <input type="text" name="plan_name">
                </li>
                <li>
                    <label for="">플랜 금액</label>
                    <input type="number" name="plan_price">
                </li>
                <li>
                    <label for="">이미지 소스</label>
                    <input type="file" name="img">
                </li>
            </ul>

            <div class="btnBox">
                <button type="submit" class="btn">추가</button>
                <button type="button" class="btn grayBtn" id="quit">닫기</button>
            </div>

            

        </div>
    </form>

    <script>
        $(document).ready(function(){

            $("#quit").on('click',function(){
                window.close();
            })
            
        })

        

    </script>
</body>
</html>