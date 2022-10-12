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
    <title>Document</title>
    <script src="${path }/js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form action="${path}/admin/addOTT" method="POST" enctype="multipart/form-data">
        
        <table border>
            <thead>
                <tr>
                    <th>OTT 이름</th>
                    <th>분류</th>
                    <th>파티별 최대 인원</th>
                    <th>플랜 이름</th>
                    <th>플랜 금액</th>
                    <th>이미지 소스</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="text" name="ott_name"></td>
                    <td>
                        <select name="ott_class">
                            <optgroup label="서비스 종류">
                                <option value="mediaService">미디어 서비스</option>
                                <option value="gameService">게임 서비스</option>
                                <option value="eduService">교육 서비스</option>
                                <option value="utilityService">유틸리티</option>
                                <option value="membershipService">멤버쉽 서비스</option>
                            </optgroup>
                            <option selected>============</option>
                        </select>
                        </td>
                    <td><input type="number" name="ott_max_member"></td>
                    <td><input type="text" name="plan_name"></td>
                    <td><input type="number" name="plan_price"></td>
                    <td><input type="file" name="img"></td>
                </tr>
            </tbody>
        </table>
        <div style="text-align: center;">
            <input type="submit" value="추가">
            <input type="button" id="quit" value="닫기">
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