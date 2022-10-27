$(document).ready(function() {

    const key = 'afb1dcfbf52dedf12c2a78edaec38830';
	const type1 = "movie";
	const type2 = "tv";
	const type3 = "person";
	let poster = 'https://image.tmdb.org/t/p/w500/';

    $.ajax({
        async: true, 
        url: "https://api.themoviedb.org/3/search/"+ type1 +"?api_key=" + key + "&language=ko&query=" + searchkeyword + "&page=1&include_adult=false" ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
            console.log(result);

            if(result.results.length >= 1){

                let html = "<p class='row_name' style='margin-left: 5%;'>🎬 영화</p><hr></div>";
                    html += "<div id='search1' class='carousel slide' data-bs-ride='carousel'>";
                    html += "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";

                $.each(result.results, function (idx, item) { 
                    let img = poster + item.poster_path;
                    let orig_title = item.original_title;
                    let title = item.title;
                    let date = item.release_date.replace(/-/gi, "").slice(0,-4);
                    let vote_average = item.vote_average;
                    let id = item.id;

                    html += "<div class='col' >";
                    html += "<a href='"+ contextpath +"/film/detail?fcode="+ id +"&ftype="+ type1 +"'>";
                    html += "<div class='card' id='card_film3'>";
                    html += "<img src='" + img + "' id='img_film'>";
                    html += "<div class='card-body'>";
                    html += "<div id='card-text1'>"+ title +"</div>";
                    html += "<div id='card-text2'>"+ orig_title + " " + date +"</div>";
                    html += "<div id='card-text3'> 평점 : "+ vote_average +"</div>";
                    html += "</div></div></a></div><br>";
                })
                $("#searchdiv1").append(html);
            }
        },
        error: function (error) {
            alert("검색어를 입력해주세요")
        }
    });
    
    $.ajax({
        async: true, 
        url: "https://api.themoviedb.org/3/search/"+ type2 +"?api_key=" + key + "&language=ko&query=" + searchkeyword + "&page=1&include_adult=false" ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
            console.log(result);
            if(result.results.length >= 1){

                let html  = "<p class='row_name' style='margin-left: 5%;'>📺 시리즈</p><hr></div>";
                    html += "<div id='search2' class='carousel slide' data-bs-ride='carousel'>";
                    html += "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
                
                $.each(result.results, function (idx, item) { 
                    let img = poster + item.poster_path;
                    let orig_title = item.original_name;
                    let title = item.name;
                    let date = item.first_air_date.replace(/-/gi, "").slice(0,-4);
                    let vote_average = item.vote_average;
                    let id = item.id;
    
                    html += "<div class='col' >";
                    html += "<a href='"+ contextpath +"/film/detail?fcode="+ id +"&ftype="+ type2 +"'>";
                    html += "<div class='card' id='card_film3'>";
                    html += "<img src='" + img + "' id='img_film'>";
                    html += "<div class='card-body'>";
                    html += "<div id='card-text1'>"+ title +"</div>";
                    html += "<div id='card-text2'>"+ orig_title + " " + date +"</div>";
                    html += "<div id='card-text3'> 평점 : "+ vote_average +"</div>";
                    html += "</div></div></a></div><br>";
                })
                $("#searchdiv2").append(html);
            }
        },
        error: function (error) {
            alert("검색어를 입력해주세요")
        }
    });
    
    $.ajax({
        async: true, 
        url: "https://api.themoviedb.org/3/search/"+ type3 +"?api_key=" + key + "&language=ko&query=" + searchkeyword + "&page=1&include_adult=false" ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) {
            console.log(result);
            if(result.results.length >= 1){

                let html  = "<p class='row_name' style='margin-left: 5%;'>👤 인물</p><hr></div>";
                    html += "<div id='search3' class='carousel slide' data-bs-ride='carousel'>";
                    html += "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel02'>";

                $.each(result.results, function (idx, item) { 
                    let img = poster + item.profile_path;
                    let name = item.name;
                    let id = item.id;

                    html += "<div class='col' >";
                    html += "<a href='"+ contextpath +"/film/detail?fcode="+ id +"&ftype="+ type3 +"'>";
                    html += "<div class='card' id='card_film3'>";
                    html += "<img src='" + img + "' id='img_film'>";
                    html += "<div class='card-body'>";
                    html += "<div id='card-text1'>"+ name +"</div>";
                    html += "<div id='card-text2'></div>";
                    html += "<div id='card-text3'></div>";
                    html += "</div></div></a></div><br>";
                })
                $("#searchdiv3").append(html);
            }
        },
        error: function (error) {
            alert("검색어를 입력해주세요")
        }
    });

});