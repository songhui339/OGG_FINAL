$(document).ready(function() {

    const key = "afb1dcfbf52dedf12c2a78edaec38830";
	let url = "https://api.themoviedb.org/3/" + ftype + "/" + fcode + "?api_key=" + key + "&language=ko";
	const type1 = "movie";
    const type2 = "tv";
	let poster = 'https://image.tmdb.org/t/p/w500/';

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
            alert("서버호출 실패")
        }
    });
    
    var title;
    
    $.ajax({
        async: false, 
        url: url ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
        
		    let orig_title = (ftype=='movie' ? result.original_title : result.original_name);
		    title = (ftype=='movie' ? result.title : result.name);
		    let runtime = (ftype=='movie' ? result.runtime : result.episode_run_time);
		    let date = (ftype=='movie' ? result.release_date : result.first_air_date);
		    let vote_average = result.vote_average;
		    let id = result.id;

            let html = "";
                html += "<a href='" + contextpath + "/review/film_detail?fcode=" + id + "&ftype=" + type1 + "'>";
                html += "<div class='row' style='font-size: 2em; font-weight: 700; margin-top: 35px; margin-bottom: 1px; margin-left: 1px;'>";
                html += title;
                html += "</div>";
                html += "</a>";
                html += "<div class='row' style='font-size: 1em; color: grey; margin-bottom: 15px; margin-left: 1px;'>";
                html += orig_title + " " + date + "<br>" + "평점 : " + vote_average 
                html += "</div>";
 	   

            $("#filmDetail1").append(html);
        },
        error: function (error) {
            alert("서버호출 실패")
        }
    })
    
 	  console.log('타이틀 : ' + title);
    
        $('#leavecomment').on("click", function() {
        let message = document.getElementById('message-text').value
        let fcodes = fcode;
        console.log(message);
        
		$.ajax({
	        async: true,
			type : 'POST',
			url : contextpath + '/review/review_write',
			data : {
				'fTitle' : title, 
				'rvContent' : message, 
				'fCode' : fcodes,
				'ftype' : ftype
			},
			success : (data) => {
				console.log(data);
				
			},
			error : (error) => {
				console.log(error);
			}
		});
        
    });
    
    $.ajax({
        async: true, 
        url: url ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
        
		    let overview = result.overview;
		    
            let html = "";
                html += "<p id='detail-text1'>기본 정보</p>";
                html += "<hr>";
                html += "<br>";
                html += "<p id='detail-text6'>";
                html += overview;
                html += "</p></p>";
                
            console.log(result);
            $("#filmDetail2").append(html);
        },
        error: function (error) {
            alert("서버호출 실패")
        }
    });

    $.ajax({
        url: "https://api.themoviedb.org/3/movie/" + fcode + "/credits?api_key=" + key + "&language=ko" ,
        async: false,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
            
            var name;
			console.log(result);

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
            alert("서버호출 실패4")
        }
    });
    
    var dirname = $("#dir").val();
    console.log('감독이름 : ' + dirname);
	
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
	                html += "<a href='"+ contextpath +"/review/film_detail?fcode="+ id +"&ftype="+ type1 +"'>";
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
            
            console.log(result);

            $("#carousel1").append(html);
        },
        error: function (error) {

            console.log(dirname);
            alert("서버호출 실패5")
        }
    });
});