$(document).ready(function() {

    const key = "afb1dcfbf52dedf12c2a78edaec38830";
	let url = "https://api.themoviedb.org/3/"+ftype+"/"+fcode+"?api_key=" + key + "&language=ko";
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
    
    $.ajax({
        async: true, 
        url: url ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
        
		    let orig_title = (ftype=='movie' ? result.original_title : result.original_name);
		    let title = (ftype=='movie' ? result.title : result.name);
		    let runtime = (ftype=='movie' ? result.runtime : result.episode_run_time);
		    let date = (ftype=='movie' ? result.release_date : result.first_air_date);
		    let vote_average = result.vote_average;

            let html = "";
                html += "<div class='row' style='font-size: 2em; font-weight: 700; margin-top: 35px; margin-bottom: 1px; margin-left: 1px;'>";
                html += title;
                html += "</div>";
                html += "<div class='row' style='font-size: 1em; color: grey; margin-bottom: 15px; margin-left: 1px;'>";
                html += orig_title + " " + date + "<br>" + "평점 : " + vote_average 
                html += "</div>";

            $("#filmDetail1").append(html);
        },
        error: function (error) {
            alert("서버호출 실패")
        }
    })
    
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
                html += overview;
                html += "</p>";

            $("#filmDetail2").append(html2);
        },
        error: function (error) {
            alert("서버호출 실패")
        }
    });
});