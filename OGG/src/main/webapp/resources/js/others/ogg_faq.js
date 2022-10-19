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

	$(".o_accordion > li:eq(0) a").addClass("active").next().slideDown();

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