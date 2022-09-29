$(document).ready(function() {

    const key = 'afb1dcfbf52dedf12c2a78edaec38830';
	const type1 = "movie";
	const type2 = "tv";
	let poster = 'https://image.tmdb.org/t/p/w500/';
    
    $.ajax({
        async: true, 
        url: "https://api.themoviedb.org/3/search/"+ type1 +"?api_key="+key+"&language=ko&query=" + searchkeyword + "&page=1&include_adult=false" ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 

            let html = "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
            $.each(result.results, function (idx, item) { 
                let img = poster + item.poster_path;
                let orig_title = item.original_title;
                let title = item.title;
                let date = item.release_date.replace(/-/gi, "").slice(0,-4);
                let vote_average = item.vote_average;
                let id = item.id;

                html += "<div class='col' >";
             	html += "<a href='"+ contextpath +"/review/film_detail?fcode="+ id +"&ftype="+ type1 +"'>";
                html += "<div class='card' id='card_film3'>";
                html += "<img src='" + img + "' id='img_film'>";
                html += "<div class='card-body'>";
                html += "<div id='card-text1'>"+ title +"</div>";
                html += "<div id='card-text2'>"+ orig_title + " " + date +"</div>";
                html += "<div id='card-text3'> 평점 : "+ vote_average +"</div>";
                html += "</div></div></a></div><br>";
            })
            $("#search1").append(html);
        },
        error: function (error) {
            alert("검색어를 입력해주세요")
        }
    });

});