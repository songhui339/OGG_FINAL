/* 
====================================================
OGG FAQ 페이지 JavaScript
====================================================
*/

/* ********** ********** ********** */
/*          O_ACCODION JS           */
/* ********** ********** ********** */

// **********************************
// FAQ 아코디언

jQuery(document).ready(function ($) {

	// $(".o_accordion > li:eq(0) a").addClass("active").next().slideDown();

	$(".o_accordion a").click(function (e) {
		var dropDown = $(this).closest("li").find(".textBox");
		$(this).closest(".o_accordion").find(".textBox").not(dropDown).slideUp();
		if ($(this).hasClass("active")) {
			$(this).removeClass("active");
		} else {
			$(this).closest(".o_accordion").find("a.active").removeClass("active");
			$(this).addClass("active");
		}
		dropDown.stop(false, true).slideToggle();
		e.preventDefault();
	});

});

/*
================================================
플로깅 코스 페이지 JavaScript
================================================
*/



jQuery(document).ready(function ($) {
    
    var btnAll = $('.faqTab_row_01 .btn_container section .btnBox');
    var tabAll = $('.faqTab_row_02 .o_accordion_section');


    // 이용 안내
    $('#faqTab_Icon_01').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#faqTab_Info_01').addClass('active');
        }
    });

    // 파티 문의
    $('#faqTab_Icon_02').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#faqTab_Info_02').addClass('active');
        }
    });
    
    // 회원가입 및  정보
    $('#faqTab_Icon_03').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#faqTab_Info_03').addClass('active');
        }
    });
    
    // 입출금 및  환불
    $('#faqTab_Icon_04').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#faqTab_Info_04').addClass('active');
        }
    });


});

