$(document).ready(function() {

    const key = "afb1dcfbf52dedf12c2a78edaec38830";
	let url = "https://api.themoviedb.org/3/" + ftype + "/" + fcode + "?api_key=" + key + "&language=ko";
	const type1 = "movie";
    const type2 = "tv";
	let poster = 'https://image.tmdb.org/t/p/w500/';
	let poster2 = 'https://image.tmdb.org/t/p/original/';
    // var title;
    var name;

    ////////////
    //필름 디테일//
    ////////////
    $.ajax({
        async: true, 
        url: url ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
        
			let img = poster2 + result.backdrop_path;
			
            let html = "";
                html += "#baback { background-image: url('";
                html += img + "'); ";
                html += "background-size : cover; ";
                html += "background-repeat : no-repeat; ";
                // html += "background-position : 10px; 50px; ";
                html += "}";

            $("#hi").append(html);
        },
        error: function (error) {
            console.log('영화포스터 가져오기 통신 오류');
        }
    });
    
    $.ajax({
        async: true, 
        url: url ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
        
			let img = poster + result.poster_path;
			
            let html = "";
                html += "<img src='" + img + "' id='img_film3'>";

            $("#filmDetail0").append(html);
        },
        error: function (error) {
            console.log('영화포스터 가져오기 통신 오류');
        }
    });

    $.ajax({
        async: false, 
        url: url ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
        
            console.log(result)

		    let orig_title = (ftype=='movie' ? result.original_title : result.original_name);
		    title = (ftype=='movie' ? result.title : result.name);
		    let runtime = (ftype=='movie' ? result.runtime : result.episode_run_time);
		    let date = (ftype=='movie' ? result.release_date.replace(/-/gi, ". ") : result.first_air_date.replace(/-/gi, ". "));
		    // let date = (ftype=='movie' ? result.release_date.replace(/-/gi, ".").slice(0,-4) : result.first_air_date);
		    // let date = (ftype=='movie' ? result.release_date : result.first_air_date);
		    let vote_average = result.vote_average;
		    let id = result.id;
            let genres = [];
            for(let i = 0; i < result.genres.length; i++){
                genres[i] = result.genres[i].name;
            }
            let genre = genres.join(' ・ ');
            
            let html = "";
                html += "<a href='" + contextpath + "/film/detail?fcode=" + id + "&ftype=" + type1 + "'>";
                html += "<div class='row' style='font-size: 2em; font-weight: 700; margin-top: 35px; margin-bottom: 1px; margin-left: 1px;'>";
                html += title;
                html += "</div>";
                html += "</a>";
                html += "<div class='row' style='font-size: 0.9em; color: grey; margin-bottom: 15px; margin-left: 7px;'>";
                // html += orig_title + "<br> 장르 ・ " + genre + " " + "<br> 개봉 ・ " + date + " <br> 러닝타임 ・ " + runtime +"분 " 
                html += orig_title + " ・ " + genre + " " + "<br> 개봉 ・ " + date + " <br> 러닝타임 ・ " + runtime +"분 " 
                html += "</div>";

            $("#filmDetail1").append(html);
        },
        error: function (error) {
            console.log('영화정보 가져오기 통신 오류');
        }
    })
    
    $.ajax({
        async: true, 
        url: url ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
            
            console.log(result);

		    let overview = result.overview;
		    // let production_countries = result.production_countries[0].name;
		    let belongs_to_collection = (result.belongs_to_collection == null ? " " : result.belongs_to_collection.name);
		    let tagline = (result.tagline == null ? " " : result.tagline);
		    
            let html = "";
                html += "<p id='detail-text1'>기본 정보</p>";
                html += "<hr>";
                // html += "<br>";
                html += "<p id='detail-text6'>";
                html += belongs_to_collection + " ・ " + tagline;
                html += "<p id='detail-text3'>";
                html += overview;
                html += "</p></p>";
                
            $("#filmDetail2").append(html);
        },
        error: function (error) {
            alert("영화줄거리 가져오기 통신 오류")
        }
    });

    $.ajax({
        url: "https://api.themoviedb.org/3/movie/" + fcode + "/credits?api_key=" + key + "&language=ko" ,
        async: false,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
            
            for (let i = 0; i < result.crew.length; i++) {
                let job = result.crew[i].job;
                
                if(job == 'Director'){
                    name = result.crew[i].name;
                }
            }

            let html = "";
                html += "<input type='text' id='dir' value='" + name +"' hidden>";
            
            $("#detail-text1").append(html);
        },
        error: function (error) {
            console.log('영화감독 가져오기 통신 오류');
        }
    });
    
    var dirname = $("#dir").val();
    
    $.ajax({
        async: true, 

        url: "https://api.themoviedb.org/3/search/person?api_key=" + key + "&language=ko&query=" + dirname + "&page=1&include_adult=false" ,

        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 

            let html = "<div class='container' id='carousel00'><div class='row row-cols-auto'>";
            for (let i = 0; i<result.results[0].known_for.length; i++) {  
            
            	if (result.results[0].known_for[i].media_type == 'movie'){
            	
	                let poster = 'https://image.tmdb.org/t/p/w500/';
	                let img = poster + result.results[0].known_for[i].poster_path;
	                let title = result.results[0].known_for[i].title;
	                let orig_title = result.results[0].known_for[i].original_title;
	                //let date = result.results[0].known_for[i].release_date.replace(/-/gi, "").slice(0,-4);
	                let vote_average = result.results[0].known_for[i].vote_average;
	                let id = result.results[0].known_for[i].id;
	
	                html += "<div class='col' id='dir_film'>";
	                html += "<a href='"+ contextpath +"/film/detail?fcode="+ id +"&ftype="+ type1 +"'>";
	                html += "<div class='card' id='card_film2'>";
	                html += "<img src='" + img + "' id='img_film2'>";
	                html += "<div class='card-body'>";
	                html += "<div id='card-text1'>" + title + "</div>";
	                //html += "<div id='card-text2'>" + orig_title + " " + date + "</div>";
	                html += "<div id='card-text3'> 평점 : " + vote_average + "</div>";
	                html += "</div></div></a></div>";
                } else {
                	html += "추천 작품이 존재하지 않습니다";
                } 
            }

            $("#carousel1").append(html);
        },
        error: function (error) {
            console.log('영화 추천 통신 오류');
        }
    });

    ////////////
    /////키업////
    ////////////
    $("#message-text").keyup(function(e) {
	    var content = $(this).val();
	    $("#textLengthCheck").text("(" + content.length + " / 2000)");
	    if (content.length > 2000) {
	        alert("최대 2000자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 2000));
	        $('#textLengthCheck').text("(2000 / 2000");
	    }
	});
    
    $("#message-text2").keyup(function(e) {
	    var content = $(this).val();
	    $("#textLengthCheck2").text("(" + content.length + " / 2000)");
	    if (content.length > 2000) {
	        alert("최대 2000자까지 입력 가능합니다.");
	        $(this).val(content.substring(0, 2000));
	        $('#textLengthCheck2').text("(2000 / 2000");
	    }
	});

    ////////////
    /////리뷰////
    ////////////
    function convertbr(){
        str = document.getElementById("message-text").value;
        str = str.replace(/\r\n|\n/g,'<br>');
        console.log(str);
        document.getElementById('html5').value = str;
    }

    $('#writeReview').on("click", function() {
        let rvContent = document.getElementById('message-text').value;
        
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
                location.replace(contextpath + '/film/review_list?fcode=' + fcode + '&ftype=' + ftype);
            },
			error : (error) => {
				alert('리뷰 등록에 실패하였습니다');
			}
		});
        
    });

    $('#updateReview').on("click", function() {
        let rvContent = document.getElementById('message-text2').value;
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
    
    $('#deleteReview').on("click", function() {
        let rvNo = document.getElementById('rvNo').value;

        if(confirm('리뷰를 삭제하시겠습니까?')){
			$.ajax({
		        async: true,
				type : 'POST',
				url : contextpath + '/review/review_update',
				data : {
					'rvNo' : rvNo,
					'rvStatus' : 'N', 
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

    $('#tolist').on("click", function() {
        location.href = contextpath + "/film/review_list?fcode=" + fcode + "&ftype=" + ftype;
    });

});