$(document).ready(function() {
    const key = "afb1dcfbf52dedf12c2a78edaec38830";
    const type1 = "movie";
    const type2 = "tv";
    let poster = 'https://image.tmdb.org/t/p/w500/';

    $.ajax({
            async: true, 
            url: "https://api.themoviedb.org/3/discover/movie?api_key=" + key + "&language=ko&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate" ,
            type: "GET",
            timeout: 3000,
            dataType: "json", 
            success: function (result) { 

                let html = "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
                for (let i = 0; i<5; i++) {  
                    let img = poster + result.results[i].poster_path;
                    let orig_title = result.results[i].original_title;
                    let title = result.results[i].title;
                    let date = result.results[i].release_date.replace(/-/gi, "").slice(0,-4);
                    let vote_average = result.results[i].vote_average;
                    let id = result.results[i].id;

                    html += "<div class='col' >";
                    html += "<a href='"+ contextpath +"/film/detail?fcode="+ id +"&ftype="+ type1 +"'>";
                    html += "<div class='card' id='card_film'>";
                    html += "<img src='" + img + "' id='img_film'>";
                    html += "<input id='fcode' hidden value='" + id +"'>";
                    html += "<div class='card-body'>";
                    html += "<div id='card-text1'>"+ title +"</div>";
                    html += "<div id='card-text2'>"+ orig_title + " " + date +"</div>";
                    html += "<div id='card-text3'> 평점 : "+ vote_average +"</div>";
                    html += "</div></div></a></div><br>";
                };
                $("#carousel1").append(html);

                let html2 = "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
                for (let i = 5; i<10; i++) {  
                    let poster = 'https://image.tmdb.org/t/p/w500/';
                    let img = poster + result.results[i].poster_path;
                    let orig_title = result.results[i].original_title;
                    let title = result.results[i].title;
                    let date = result.results[i].release_date.replace(/-/gi, "").slice(0,-4);
                    let vote_average = result.results[i].vote_average;
                    let id = result.results[i].id;

                    html2 += "<div class='col' >";
                    html2 += "<a href='"+ contextpath +"/film/detail?fcode="+ id +"&ftype="+ type1 +"'>";
                    html2 += "<div class='card' id='card_film'>";
                    html2 += "<img src='" + img + "' id='img_film'>";
                    html2 += "<div class='card-body'>";
                    html2 += "<div id='card-text1'>"+ title +"</div>";
                    html2 += "<div id='card-text2'>"+ orig_title + " " + date +"</div>";
                    html2 += "<div id='card-text3'> 평점 : "+ vote_average +"</div>";
                    html2 += "</div></div></a></div><br>";
                }
                $("#carousel2").append(html2);
            },
            error: function (error) {
                console.log('인기 영화 통신 오류');
            }
        });

    $.ajax({
        async: true, 
        url: "https://api.themoviedb.org/3/tv/popular?api_key=" + key + "&language=ko&page=1" ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
        
            let html = "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
            for (let i = 0; i<5; i++) {  
                let img = poster + result.results[i].poster_path;
                let name = result.results[i].name;
                let original_name = result.results[i].original_name;
                let date = result.results[i].first_air_date.replace(/-/gi, "").slice(0,-4);
                let vote_average = result.results[i].vote_average;
                let id = result.results[i].id;

                html += "<div class='col' >";
                html += "<a href='"+ contextpath +"/film/detail?fcode="+ id +"&ftype="+ type2 +"'>";
                html += "<div class='card' id='card_film'>";
                html += "<img src='" + img + "' id='img_film'>";
                html += "<div class='card-body'>";
                html += "<div id='card-text1'>"+ name +"</div>";
                html += "<div id='card-text2'>"+ original_name + " " + date +"</div>";
                html += "<div id='card-text3'> 평점 : "+ vote_average +"</div>";
                html += "</div></div></a></div><br>";
            };
            $("#carousel3").append(html);

            let html2 = "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
            for (let i = 5; i<10; i++) {  
                let img = poster + result.results[i].poster_path;
                let name = result.results[i].name;
                let original_name = result.results[i].original_name;
                let date = result.results[i].first_air_date.replace(/-/gi, "").slice(0,-4);
                let vote_average = result.results[i].vote_average;
                let id = result.results[i].id;

                html2 += "<div class='col' >";
                html2 += "<a href='"+ contextpath +"/review/film_detail?fcode="+ id +"&ftype="+ type2 +"'>";
                html2 += "<div class='card' id='card_film'>";
                html2 += "<img src='" + img + "' id='img_film'>";
                html2 += "<div class='card-body'>";
                html2 += "<div id='card-text1'>"+ name +"</div>";
                html2 += "<div id='card-text2'>"+ original_name + " " + date +"</div>";
                html2 += "<div id='card-text3'> 평점 : "+ vote_average +"</div>";
                html2 += "</div></div></a></div><br>";
            }
            $("#carousel4").append(html2);
        },
        error: function (error) {
            console.log('인기 드라마 통신 오류');
        }
    });

    $.ajax({
        async: true, 
        url: "https://api.themoviedb.org/3/movie/top_rated?api_key=" + key + "&language=ko&page=1" ,
        type: "GET",
        timeout: 3000,
        dataType: "json", 
        success: function (result) { 
        
            let html = "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
            for (let i = 0; i<5; i++) {  
                let img = poster + result.results[i].poster_path;
                let orig_title = result.results[i].original_title;
                let title = result.results[i].title;
                let date = result.results[i].release_date.replace(/-/gi, "").slice(0,-4);
                let vote_average = result.results[i].vote_average;
                let id = result.results[i].id;

                html += "<div class='col' >";
                html += "<a href='"+ contextpath +"/film/detail?fcode="+ id +"&ftype="+ type1 +"'>";
                html += "<div class='card' id='card_film'>";
                html += "<img src='" + img + "' id='img_film'>";
                html += "<div class='card-body'>";
                html += "<div id='card-text1'>"+ title +"</div>";
                html += "<div id='card-text2'>"+ orig_title + " " + date +"</div>";
                html += "<div id='card-text3'> 평점 : "+ vote_average +"</div>";
                html += "</div></div></a></div><br>";
            };
            $("#carousel5").append(html);

            let html2 = "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
            for (let i = 5; i<10; i++) {  
                let img = poster + result.results[i].poster_path;
                let orig_title = result.results[i].original_title;
                let title = result.results[i].title;
                let date = result.results[i].release_date.replace(/-/gi, "").slice(0,-4);
                let vote_average = result.results[i].vote_average;
                let id = result.results[i].id;

                html2 += "<div class='col' >";
                html2 += "<a href='"+ contextpath +"/film/detail?fcode="+ id +"&ftype="+ type1 +"'>";
                html2 += "<div class='card' id='card_film'>";
                html2 += "<img src='" + img + "' id='img_film'>";
                html2 += "<div class='card-body'>";
                html2 += "<div id='card-text1'>"+ title +"</div>";
                html2 += "<div id='card-text2'>"+ orig_title + " " + date +"</div>";
                html2 += "<div id='card-text3'> 평점 : "+ vote_average +"</div>";
                html2 += "</div></div></a></div><br>";
            }
            $("#carousel6").append(html2);
        },
        error: function (error) {
            console.log('별점 높은 영화 통신 오류');
        }
    });

    $.ajax({
        async: false,
        type : 'POST',
        url : contextpath + '/film/list',
        success : function (data) {
            arr = [];
    
            for (let i = 0; i < data.length; i++) {
                arr[i] = data[i].fcode;
            }
        },
        error: function (error) {
            console.log('영화 찜 데이터 통신 오류1');
        }
    });
    
    let html0 = "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
    let html9 = "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
    
    if(arr == ""){
        $('#mylikes').hide();
        console.log('로그인 x');
    }

    if(0 <= arr.length && arr.length <= 5){

        for(let i = 0; i < arr.length; i++){
            $.ajax({
                async: false, 
                url : "https://api.themoviedb.org/3/" + type1 + "/" + arr[i] + "?api_key=" + key + "&language=ko" ,
                type: "GET",
                timeout: 3000,
                dataType: "json", 
                success: function (result) { 
    
                // console.log(result);
    
                // let html0 = "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
                let img = poster + poster + result.poster_path;
                let orig_title = result.original_title;
                let title = result.title;
                let vote_average = result.vote_average;
                let date = result.release_date.replace(/-/gi, "").slice(0,-4);
                let id = result.id;
                
                html0 += "<div class='col'>";
                html0 += "<a href='"+ contextpath +"/film/detail?fcode="+ id +"&ftype="+ type1 +"'>";
                html0 += "<div class='card' id='card_film'>";
                html0 += "<img src='" + img + "' id='img_film'>";
                html0 += "<input id='fcode' hidden value='" + id +"'>";
                html0 += "<div class='card-body'>";
                html0 += "<div id='card-text1'>"+ title +"</div>";
                html0 += "<div id='card-text2'>"+ orig_title + " " + date +"</div>";
                html0 += "<div id='card-text3'> 평점 : "+ vote_average +"</div>";
                html0 += "</div></div></a></div><br>";
    
                $('#likebutton1').hide();
                $('#likebutton2').hide();

                },
                error: function (error) {
                    console.log('영화 찜 데이터 통신 오류2');
                    $('#mylikes').hide();
                }
            });
        }
        $("#carousel0").append(html0);
        html0 = "";

    }else{

        for(let i = 0; i < arr.length; i++){
            $.ajax({
                async: false, 
                url : "https://api.themoviedb.org/3/" + type1 + "/" + arr[i] + "?api_key=" + key + "&language=ko" ,
                type: "GET",
                timeout: 3000,
                dataType: "json", 
                success: function (result) { 
    
                    console.log(result);
        
                    // let html0 = "<div class='row row-cols-1 row-cols-sm-2 row-cols-md-5' id='carousel01'>";
                    
                    let img = poster + poster + result.poster_path;
                    let orig_title = result.original_title;
                    let title = result.title;
                    let vote_average = result.vote_average;
                    let date = result.release_date.replace(/-/gi, "").slice(0,-4);
                    let id = result.id;
        
                    if(i < 5){
                        html0 += "<div class='col'>";
                        html0 += "<a href='"+ contextpath +"/film/detail?fcode="+ id +"&ftype="+ type1 +"'>";
                        html0 += "<div class='card' id='card_film'>";
                        html0 += "<img src='" + img + "' id='img_film'>";
                        html0 += "<input id='fcode' hidden value='" + id +"'>";
                        html0 += "<div class='card-body'>";
                        html0 += "<div id='card-text1'>"+ title +"</div>";
                        html0 += "<div id='card-text2'>"+ orig_title + " " + date +"</div>";
                        html0 += "<div id='card-text3'> 평점 : "+ vote_average +"</div>";
                        html0 += "</div></div></a></div><br>";
                    }else{
                        html9 += "<div class='col' >";
                        html9 += "<a href='"+ contextpath +"/film/detail?fcode="+ id +"&ftype="+ type1 +"'>";
                        html9 += "<div class='card' id='card_film'>";
                        html9 += "<img src='" + img + "' id='img_film'>";
                        html9 += "<div class='card-body'>";
                        html9 += "<div id='card-text1'>"+ title +"</div>";
                        html9 += "<div id='card-text2'>"+ orig_title + " " + date +"</div>";
                        html9 += "<div id='card-text3'> 평점 : "+ vote_average +"</div>";
                        html9 += "</div></div></a></div><br>";
                    }
                },
                error: function (error) {
                    console.log('영화 찜 데이터 통신 오류3');
                }
            });
        }
        $("#carousel9").append(html9);
        html9 = "";          
    }
    
    $("#carousel0").append(html0);
    html0 = "";
});
