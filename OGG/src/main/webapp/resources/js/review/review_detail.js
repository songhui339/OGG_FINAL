$(document).ready(function() {

    const key = "afb1dcfbf52dedf12c2a78edaec38830";
	let url = "https://api.themoviedb.org/3/" + ftype + "/" + fcode + "?api_key=" + key + "&language=ko";
	const type1 = "movie";
    const type2 = "tv";
	let poster = 'https://image.tmdb.org/t/p/w500/';
    var title;
    var name;

    $('#writerv').on("click", function() {
        let rvContent = document.getElementById('message-text').value
        let rvNo = document.getElementById('rvNo').value;
        
		$.ajax({
	        async: true,
			type : 'POST',
			url : contextpath + '/review/review_write',
			data : {
				'fTitle' : title, 
				'rvContent' : rvContent, 
				'fCode' : fcode,
				'ftype' : ftype
			},
			success : (data) => {
				alert('리뷰가 성공적으로 등록되었습니다');
				
			},
			error : (error) => {
				alert('리뷰 등록에 실패하였습니다');
			}
		});
        
    });
    
    $('#updaterv').on("click", function() {
        let rvContent = document.getElementById('message-text').value;
        let rvNo = document.getElementById('rvNo').value;
        
		$.ajax({
	        async: true,
			type : 'POST',
			url : contextpath + '/review/review_update',
			data : {
				'rvNo' : rvNo,
				'rvContent' : rvContent, 
				'fCode' : fcode,
				'ftype' : ftype
			},
			success : (data) => {
				alert('리뷰 수정에 성공하였습니다');
				location.replace(contextpath + '/review/review_detail?no=' + rvNo + '&fcode=' + fcode + '&ftype=' + ftype);
			},
			error : (error) => {
				alert('리뷰 수정에 실패하였습니다');
			}
		});
        
    });
    
    $('#deleterv').on("click", function() {
        let rvContent = document.getElementById('message-text').value
        let rvNo = document.getElementById('rvNo').value;
        
        if(confirm('리뷰를 삭제하시겠습니까?')){
        	
			$.ajax({
		        async: true,
				type : 'POST',
				url : contextpath + '/review/review_update',
				data : {
					'rvNo' : rvNo,
					'rvContent' : rvContent, 
					'fCode' : fcode,
					'ftype' : ftype
				},
				success : (data) => {
					alert('리뷰가 성공적으로 삭제되었습니다');
					location.replace(contextpath + '/film/review_list?fcode=' + fcode + '&ftype=' + ftype);
				},
				error : (error) => {
					alert('리뷰 삭제에 실패하였습니다');
				}
			});
        }
    });
    
    $('#writecmt').on("click", function() {
        let rvNo = document.getElementById('rvNo').value;
        // let cmtNo = document.getElementById('cmtNo').value;
        let cmtContent = document.getElementById('message-cmt').value;
        // let cmtNickname = document.getElementById('cmtNickname').value;
        // let cmtWriterNo = document.getElementById('cmtWriterNo').value;

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
				alert('댓글이 정상적으로 등록되었습니다.');
				console.log(data);

				let html = "<tr id='cmtlist'>";
					html += "<input id='cmtNo' type='hidden' value='"+ data.cmt.cmtNo +">";
					html += "<input id='cmtWriterNo' type='hidden' value='"+ data.cmt.cmtWriterNo +"'>";
					html += "<td id='board-text4'>" + data.cmt.cmtNickname + "</td>";
					html += "<td id='board-text5'>" + data.cmt.cmtContent + "</td>";
					html += "<td id='board-text7'>";
					html += "<div class='btn-group' role='group' aria-label='Basic mixed styles example'>";
					html += "<button class='btn btn-primary' type='button' onclick='showUpdateCmt(event)'>수정</button>";
					html += "<button class='btn btn-primary' type='button' onclick='deleteCmt(event)'>삭제</button>";
					html += "</div></td></tr>";
					html += "<tr id='cmtlist2' style='display: none;'>";
					html += "<td id='board-text4'>" + data.cmt.cmtNickname + "</td>";
					html += "<td id='board-text5-1'>";
					html += "<textarea id='message-cmt-2' style='border: 1px solid lightgrey; resize: none; width: 100%;'>${ reviewCmt.cmtContent }</textarea>";
					html += "</td><td id='board-text7-1'>";
					html += "<div class='btn-group' role='group' aria-label='Basic mixed styles example'>";
					html += "<button class='btn btn-primary' type='button' onclick='updateCmt(event)' >수정</button>";
					html += "<button class='btn btn-primary' type='button' onclick='updateCommentsCancel(event)'>취소</button>";
					html += "</div></td></tr>";

					$("#cmtTbody").append(html);
					$("#message-cmt").val('');
			},
			error : (error) => {
				alert('댓글 등록에 실패하였습니다');
			}
		});
    });

});