$(document).ready(function() {
    const key = 'afb1dcfbf52dedf12c2a78edaec38830';
	
    $.ajax({
        async: true, 

        url: "https://api.themoviedb.org/3/search/multi?api_key=" + key + "&language=ko&query=" + "Hong Sang-soo" + "&page=1&include_adult=false" ,

        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 

            let html = "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
            $.each(result.results, function (idx, item) { 

                let poster = 'https://image.tmdb.org/t/p/w500/';
                let img = poster + item.profile_path;

                let name2 = item.name;
                let known_for_department= item.known_for_department;
                let popularity = item.popularity;
                let gender = item.gender;
                let id = item.id;

                html += "<div class='col' >";
                html += "<div class='card' id='card_film3'>";
//                html += "<img src='" + img + "' id='img_film'>";
                html += "<div class='card-body'>";
                html += "<div id='card-text1'>"+ name2 +"</div>";
                html += "<div id='card-text2'>"+ known_for_department +"</div>";
                html += "<div id='card-text3'> 영화 평점 : "+ popularity +"</div>";
                html += "</div></div></div><br>";
            })
            $("#search1").append(html);
            
            console.log(result.results);

        },
        error: function (error) {
            alert("검색어를 입력해주세요")
        }
    });

});