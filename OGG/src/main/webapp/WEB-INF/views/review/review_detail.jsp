<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

    <!-- header -->
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <!-- my CSS -->
    <link rel="stylesheet" href="${path}/css/review/ogg_review.css">
    
    <!-- my JS -->
    <script defer src="${path}/js/review/film_detail.js"></script>
    
	<style id="hi">
    </style>

    <!-- 내용 전체 컨테이너 -->
    <div class="container">
        
        <!-- 1st row -->
        <jsp:include page="/WEB-INF/views/review/film_header.jsp"/>
        
        <!-- 2nd row -->
        <div id="fafa">
        <hr>
        <div class="col-3 col-sm-12" id="div_review">
            <!-- 리뷰 내용 -->
            <div id="div_review">
                <p id="board-text1">${ review.rvNickname }</p>
                <input id="rvNo" type="hidden" value="${ review.rvNo }">
                <hr>
                <p id="board-text3">
                    <br>
                    ${ review.rvContent }
                    <br><br>
                </p>
                <hr>
                <div class="row" id="detail-text">
                    <div class="col-sm-1">
                        <img src="${ path }/images/review/heart2.png" id="reviewLikes" style="margin-left: 10px; height:30px;" onclick="ReviewLikes(event)">
                        <img src="${ path }/images/review/heart3.png" id="reviewDisLikes" style="margin-left: 10px; display: none; height:30px;" onclick="ReviewDislikes(event)">
                        <span id="rvLikes">${ review.rvLikes }</span>
                    </div>
                    <div class="col-sm-8">
                        <img src="${ path }/images/review/comment2.png"  height="30px;">
                        <span id="rvCnt">${ cmtCount }</span>
                    </div>
                    <c:if test="${ loginMember.m_no == review.rvWriterNo }">
                        <div class="col-sm-3">
                            <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 55%;">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever=" 남기기">수정</button>
                                <button class="btn btn-primary" type="button" id="deleteReview">삭제</button>
                            </div>        
                        </div> 
                    </c:if>
                </div>
            </div>
            <br>
            <!-- 리뷰 내용 끝-->
            
            <!-- 댓글 테이블 -->
            <div id="div_comment">
            <table class="table table-hover" id="tata">
                <tbody id="cmtbody" >
                    <c:forEach var="reviewCmt" items="${ reviewCmt }">
                    <c:if test="${ reviewCmt.cmtDepth eq 0 }">
						<!-- 댓글 -->
                        <tr id="cmtlist">
                            <input id="cmtNo" type="hidden" value="${ reviewCmt.cmtNo }">
                            <input id="cmtWriterNo" type="hidden" value="${reviewCmt.cmtWriterNo }" >
                            <input id="cmtNickname" type="hidden" value="${reviewCmt.cmtNickname }" >
                            <td id="board-text4">${ reviewCmt.cmtNickname }</td>
                            <td id="board-text5" onclick="showCmt_Re(event)">${ reviewCmt.cmtContent }</td>
                            <td id="board-text7">
                                <c:if test="${ loginMember.m_no == reviewCmt.cmtWriterNo }">
                                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                        <button class="btn btn-primary" type="button" onclick="showUpdateCmt(event)">수정</button>
                                        <button class="btn btn-primary" type="button" onclick="deleteCmt(event)">삭제</button>
                                    </div>    
                                </c:if>
                            </td>
                        </tr>
                        <tr id="cmtlist_up" style="display: none;">
                            <td id="board-text4">${ reviewCmt.cmtNickname }</td>
                            <td id="board-text5-1">
                                <textarea id="message-cmt-2" style="border: 1px solid lightgrey; resize: none; width: 100%;"
                                <%-- >${ reviewCmt.cmtContent }</textarea> --%>
                                ></textarea>
                            </td>
                            <td id="board-text7-1">
                                <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                    <button class="btn btn-primary" type="button" onclick="updateCmt(event)">수정</button>
                                    <button class="btn btn-primary" type="button" onclick="updateCmtCancel(event)">취소</button>
                                </div>    
                            </td>
                        </tr>
            		    <!-- 대댓글 1 -->
                        <tr id="cmtlist_re" style="display: none;">
                            <input id="cmtWriterNo" type="hidden" value="${ loginMember.m_no }" >
                            <td id="board-text4-1">↳ &nbsp; ${ loginMember.m_nickname }</td>
                            <td id="board-text5-1">
                                <textarea id="message-cmt-1" style="border: 1px solid lightgrey; resize: none; width: 100%;"></textarea>
                            </td>
                            <td id="board-text7" style="padding-top: 15px;">
                                <button class="btn btn-primary" type="button" onclick="writeCmt_Re(event)" style="margin-left:25%; height: 35px;">등록</button>
                            </td>
                        </tr>
                    </c:if>
            		<!-- 대댓글 2 -->
                    <c:if test="${ reviewCmt.cmtDepth eq 1 }">
                        <tr id="cmtlist_re_orig">
                            <input id="cmtNo" type="hidden" value="${ reviewCmt.cmtNo }">
                            <input id="cmtWriterNo" type="hidden" value="${ reviewCmt.cmtWriterNo }" >
                            <td id="board-text4-1">↳ &nbsp; ${ reviewCmt.cmtNickname }</td>
                            <td id="board-text5-1">${ reviewCmt.cmtContent }</td>
                            <td id="board-text7">
                                <c:if test="${ loginMember.m_no == reviewCmt.cmtWriterNo }">
                                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                        <button class="btn btn-primary" type="button" onclick="showUpdateCmt_Re(event)">수정</button>
                                        <button class="btn btn-primary" type="button" onclick="deleteCmt_Re(event)">삭제</button>
                                    </div>    
                                </c:if>
                            </td>
                        </tr>
                        <tr id="cmtlist_up" style="display: none;">
                            <td id="board-text4-1">↳ &nbsp; ${ reviewCmt.cmtNickname }</td>
                            <td id="board-text5-1">
                                <textarea id="message-cmt-2" style="border: 1px solid lightgrey; resize: none; width: 100%;"
                                >${ reviewCmt.cmtContent }</textarea>
                            </td>
                            <td id="board-text7-1">
                                <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                                    <button class="btn btn-primary" type="button" onclick="updateCmt_Re(event)">수정</button>
                                    <button class="btn btn-primary" type="button" onclick="updateCmtCancel_Re(event)">취소</button>
                                </div>    
                            </td>
                        </tr>
                    </c:if>
                    </c:forEach>
                </tbody>
            </table>
            <!-- 리뷰 작성 컨테이너 -->
            <div class="mb-3">
                <div class="form-control" style="height: 85px;">
                    <textarea id="rvCmt" style="border: none; resize: none; width: 100%;"></textarea>
                </div>
                <div style="margin-top:10px;">
                    <button class="btn btn-primary" type="button" id="writeCmt" style="display: inline-block; margin-left:45%; height: 35px;">등록</button>
                    <button class="btn btn-primary" type="button" id="tolist" style=" display: inline-block; margin-left:44%; height: 35px;">목록</button>
                </div>
            </div>
        </div>
        </div>
        <!-- 2nd row 끝 -->
			
    </div>
    <!-- 내용 전체 컨테이너 끝 -->    
    <script>
    var fcode = "${ fcode }";
    var ftype = "${ ftype }";
    var m_no = "${ m_no }";
    var rvNo1 = document.getElementById('rvNo').value;
    var contextpath = "${ pageContext.request.contextPath }";

    function showUpdateCmt(event) {
        $(event.target).parents('#cmtlist').hide();
        $(event.target).parents('#cmtlist').next().show();
        $(event.target).parents('#cmtlist').next().find('#message-cmt-2').val($(event.target).parents('#cmtlist').find('#board-text5').text());
    }

    function showUpdateCmt_Re(event) {
        $(event.target).parents('#cmtlist_re_orig').hide();
        $(event.target).parents('#cmtlist_re_orig').next().show();
        $(event.target).parents("#cmtlist_re_orig").next().find('#message-cmt-2').val($(event.target).parents('#cmtlist_re_orig').find('#board-text5-1').text());
    }

    function showCmt_Re(event) {
        $(event.target).parents("#cmtlist").next().next().toggle();
    }

    function updateCmtCancel(event) {
        $(event.target).parents('#cmtlist_up').hide();
        $(event.target).parents("#cmtlist_up").prev().show();
    }

    function updateCmtCancel_Re(event) {
        $(event.target).parents('#cmtlist_up').hide();
        $(event.target).parents("#cmtlist_up").prev().show();
    }

    function cmtCntinc(h){
        let cnt = document.getElementById('rvCnt').innerHTML;
        if(h == 1){
            cnt = Number(cnt) + 1;
        }else{
            cnt = Number(cnt) - 1;
        }

        $("span#rvCnt").text(cnt);
    }

    ////////////
    ////대댓글////
    ////////////
    function writeCmt_Re(event) {
        let cmtContent = $(event.target).parents('#cmtlist_re').find('#message-cmt-1').val();
        let cmtNo = $(event.target).parents('#cmtlist_re').prev().prev().find('#cmtNo').val();

        if(cmtContent.trim()==""){
            alert("내용을 입력해주세요");
        }else{
        $.ajax({
            async: true,
            type : 'POST',
            url : contextpath + '/review/recmt_write',
            data : {
                'rvNo' : rvNo1,
                'cmtContent' : cmtContent, 
                'cmtGroup' : cmtNo,                 
                'cmtDepth': 1,
                'fCode' : fcode,
                'ftype' : ftype
            },
            success : (data) => {

            let html  = "<tr id='cmtlist_re_orig'>";
            	html += "<input id='cmtNo' type='hidden' value='" + data[0].cmtNo + "'>";
                html += "<input id='cmtWriterNo' type='hidden' value='"+ data[0].cmtWriterNo +"'>";
                html += "<td id='board-text4-1'>↳ &nbsp; " + data[0].cmtNickname + "</td>";
                html += "<td id='board-text5-1'>" + data[0].cmtContent + "</td>";
                html += "<td id='board-text7'>";
                html += "<div class='btn-group' role='group' aria-label='Basic mixed styles example'>";
                html += "<button class='btn btn-primary' type='button' onclick='showUpdateCmt_Re(event)'>수정</button>";
                html += "<button class='btn btn-primary' type='button' onclick='deleteCmt_Re(event)'>삭제</button>";
                html += "</div></td></tr>";
                html += "<tr id='cmtlist_up' style='display: none;'>";
                html += "<td id='board-text4-1'>↳ &nbsp; " + data[0].cmtNickname + "</td>";
                html += "<td id='board-text5-1'>";
                html += "<textarea id='message-cmt-2' style='border: 1px solid lightgrey; resize: none; width: 100%;'></textarea>";
                html += "</td><td id='board-text7-1'>";
                html += "<div class='btn-group' role='group' aria-label='Basic mixed styles example'>";
                html += "<button class='btn btn-primary' type='button' onclick='updateCmt_Re(event)'>수정</button>";
                html += "<button class='btn btn-primary' type='button' onclick='updateCmtCancel_Re(event)'>취소</button>";
                html += "</div></td>";

            $(event.target).parent().parent().hide();
            cmtCntinc(1);

            if($(event.target).parent().parent().siblings('#cmtlist_re_orig').is()){
                $(html).insertAfter($(event.target).parent().parent().siblings('#cmtlist_re_orig').last().next());
                $(event.target).parents('#cmtlist_re').find('#message-cmt-1').val('');
            }else{
                $("#cmtbody").append(html);
                $(event.target).parents('#cmtlist_re').find('#message-cmt-1').val('');
            }

            },
            error : (error) => {
                alert('대댓글 등록 실패');
            }
        });
        }
	}

    function updateCmt_Re(event) {

        let cmtContent = $(event.target).parents('#cmtlist_up').find('#message-cmt-2').val();
        let cmtGroup = $(event.target).parents('#cmtbody').find('#cmtNo').val();
        let cmtNo = $(event.target).parents('#cmtlist_up').prev().find('#cmtNo').val();

        console.log(cmtContent);
        console.log(cmtGroup);
        console.log(cmtNo);

        if(cmtContent.trim()==""){
            alert("내용을 입력해주세요");
        }else{
            $.ajax({
                async: true,
                type : 'POST',
                url : contextpath + '/review/cmt_update',
                data : {
                    'rvNo' : rvNo1,
                    'cmtNo' : cmtNo,
                    'cmtContent' : cmtContent, 
                    'cmtGroup': cmtGroup,
                    'cmtDepth': 1,
                    'fCode' : fcode,
                    'ftype' : ftype
                },
                success : (data) => {
                   	$(event.target).parents('#cmtlist_up').hide();
                    $(event.target).parents('#cmtlist_up').prev().show();
                    $(event.target).parents('#cmtlist_up').prev().find('#board-text5-1').text(cmtContent);
                },
                error : (error) => {
                    alert('댓글 수정에 실패하였습니다');
                }
            });
        }
    }

    function deleteCmt_Re(event) {
        let cmtNo = $(event.target).parents('#cmtlist_re_orig').find('#cmtNo').val();

        console.log(cmtNo);

        if(confirm('대댓글을 삭제하시겠습니까?')){
            $.ajax({
                async: true,
                type : 'POST',
                url : contextpath + '/review/cmt_update',
                data : {
                    'rvNo' : rvNo1,
                    'cmtNo' : cmtNo,
                    'cmtStatus' : 'N', 
                    'cmtDepth': 1,
                    'fCode' : fcode,
                    'ftype' : ftype
                },
                success : (data) => {
                    $(event.target).parents('#cmtlist_re_orig').remove();
                    cmtCntinc();
                },
                error : (error) => {
                    alert('댓글 삭제에 실패하였습니다');

                }
            });
        };
    }

	////////////
    /////댓글////
    ////////////
    $('#writeCmt').on("click", function() {
        let cmtContent = document.getElementById('rvCmt').value;
        let rvNo = document.getElementById('rvNo').value;

		if(cmtContent.trim()==""){
			alert("내용을 입력해주세요");
        }else{
            $.ajax({
                async: true,
                type : 'POST',
                url : contextpath + '/review/cmt_write',
                data : {
                    'rvNo' : rvNo,
                    'cmtContent' : cmtContent, 
                    'fCode' : fcode,
                    'ftype' : ftype
                },
                success : (data) => {
                    let html = "<tr id='cmtlist'>";
                        html += "<input id='cmtNo' type='hidden' value='"+ data.cmt.cmtNo +"'>";
                        html += "<input id='cmtWriterNo' type='hidden' value='"+ data.cmt.cmtWriterNo +"'>";
                        html += "<td id='board-text4'>" + data.cmt.cmtNickname + "</td>";
                        html += "<td id='board-text5' onclick='showCmt_Re(event)'>" + data.cmt.cmtContent + "</td>";
                        html += "<td id='board-text7'>";
                        html += "<div class='btn-group' role='group' aria-label='Basic mixed styles example'>";
                        html += "<button class='btn btn-primary' type='button' onclick='showUpdateCmt(event)'>수정</button>";
                        html += "<button class='btn btn-primary' type='button' onclick='deleteCmt(event)'>삭제</button>";
                        html += "</div></td></tr>";
                        html += "<tr id='cmtlist_up' style='display: none;'>";
                        html += "<td id='board-text4'>" + data.cmt.cmtNickname + "</td>";
                        html += "<td id='board-text5-1'>";
                        html += "<textarea id='message-cmt-2' style='border: 1px solid lightgrey; resize: none; width: 100%;'></textarea>";
                        html += "</td><td id='board-text7-1'>";
                        html += "<div class='btn-group' role='group' aria-label='Basic mixed styles example'>";
                        html += "<button class='btn btn-primary' type='button' onclick='updateCmt(event)'>수정</button>";
                        html += "<button class='btn btn-primary' type='button' onclick='updateCommentsCancel(event)'>취소</button>";
                        html += "</div></td></tr>";
                        html += "<tr id='cmtlist_re' style='display: none;'>";
                        html += "<input id='cmtWriterNo' type='hidden' value='${ loginMember.m_no }'>";
                        html += "<td id='board-text4-1'>↳ &nbsp; ${ loginMember.m_nickname }</td>";
                        html += "<td id='board-text5-1'>";
                        html += "<textarea id='message-cmt-1' style='border: 1px solid lightgrey; resize: none; width: 100%;'></textarea>";
                        html += "</td><td id='board-text7' style='padding-top: 15px;'>";
                        html += "<button class='btn btn-primary' type='button' onclick='writeCmt_Re(event)' style='margin-left:25%; height: 35px;'>등록</button>";
                        html += "</td></tr>"

                        $("#cmtbody").append(html);
                        $("#rvCmt").val('');
                        cmtCntinc(1);
                },
                error : (error) => {
                    alert('댓글 등록에 실패하였습니다');
                }
            });
        }
    });
    
    function updateCmt(event) {
        let cmtContent = $(event.target).parents('#cmtlist_up').find('#message-cmt-2').val();
        let cmtNo = $(event.target).parents('#cmtlist_up').prev().find('#cmtNo').val();
        
        if(cmtContent.trim()==""){
            alert("내용을 입력해주세요");
        }else{
            $.ajax({
                async: true,
                type : 'POST',
                url : contextpath + '/review/cmt_update',
                data : {
                    'rvNo' : rvNo1,
                    'cmtNo' : cmtNo,
                    'cmtContent' : cmtContent, 
                    'fCode' : fcode,
                    'ftype' : ftype
                },
                success : (data) => {
                    $(event.target).parents('#cmtlist_up').hide(); 
                    $(event.target).parents('#cmtlist_up').prev().show();
                    $(event.target).parents('#cmtlist_up').prev().find('#board-text5').text(cmtContent);
                },
                error : (error) => {
                    alert('댓글 수정에 실패하였습니다');
                }
            });
        }
    }

    function deleteCmt(event) {
        let cmtNo = $(event.target).parents('#cmtlist').find('#cmtNo').val();

        if(confirm('댓글을 삭제하시겠습니까?')){
            $.ajax({
                async: true,
                type : 'POST',
                url : contextpath + '/review/cmt_update',
                data : {
                    'rvNo' : rvNo1,
                    'cmtNo' : cmtNo,
                    'cmtStatus' : 'N', 
                    'fCode' : fcode,
                    'ftype' : ftype
                },
                success : (data) => {
                    $(event.target).parents("#cmtlist").remove();
                    cmtCntinc();
                },
                error : (error) => {
                    alert('댓글 삭제에 실패하였습니다');

                }
            });
        };
    }
	////////////
    ////좋아요////
    ////////////
	$(document).ready(function() {

	$.ajax({
		async: true,
		type : 'POST',
		url : contextpath + '/review/get_likes',
		data : {
			'rvNo' : rvNo1,
			'lType' : 'REVIEW',
			'fCode' : fcode,
			'ftype' : ftype
		},
		success : (data) => {
			console.log(data);
			if(data.likes.rvNo == 0 || data.likes.rvNo == null){
				console.log('ㅎㅎㅎ');
			}else{
				$('#reviewLikes').hide();
				$('#reviewDisLikes').show();
			}
		},
		error: function (error) {
			console.log('좋아요 통신 오류');
		}
	});

    function ReviewLikes(event) {
        $.ajax({
            async: true,
            type : 'POST',
            url : contextpath + '/review/insert_likes',
            data : {
                'rvNo' : rvNo1,
                'lType' : 'REVIEW',
                'fCode' : fcode,
                'ftype' : ftype
            },
            success : (data) => {
                let no = $(event.target).next().next().html();
                no = Number(no) + 1;

                $(event.target).hide();
                $(event.target).next().show();
                $(event.target).next().next().html(no);

            },
            error : (error) => {
                alert('로그인 후 가능합니다');
            }
        });
    };

    function ReviewDislikes(event) {
        $.ajax({
            async: true,
            type : 'POST',
            url : contextpath + '/review/delete_likes',
            data : {
                'rvNo' : rvNo1,
                'lType' : 'REVIEW',
                'fCode' : fcode,
                'ftype' : ftype
            },
            success : (data) => {
                let no = $(event.target).next().html();
                no = Number(no) - 1;
                
                $(event.target).hide();
                $(event.target).prev().show();
                $(event.target).next().html(no);

            },
            error : (error) => {
                alert('로그인 후 가능합니다');
            }
        });
    }

	});
    </script>  

    <!-- footer -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>