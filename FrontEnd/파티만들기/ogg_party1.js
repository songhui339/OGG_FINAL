/*
================================================
OGG Party Page JavaScript
================================================
*/

jQuery(document).ready(function ($) {
    
    var btnAll = $('.createPartyTab_row_01 .btn_container section .btnBox');
    var tabAll = $('.createPartyTab_row_02 .content_container');


    // 전체
    $('#createPartyTab_Icon_01').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#allService').addClass('active');
        }
    });

    // 미디어
    $('#createPartyTab_Icon_02').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#mediaService').addClass('active');
        }
    });
    
    // 게임
    $('#createPartyTab_Icon_03').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#gameService').addClass('active');
        }
    });
    
    // 교육/도서
    $('#createPartyTab_Icon_04').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#eduService').addClass('active');
        }
    });

    // 유틸리티
    $('#createPartyTab_Icon_05').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#utilityService').addClass('active');
        }
    });

    // 멤버십
    $('#createPartyTab_Icon_06').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            tabAll.removeClass('active');
            // 활성화
            $(this).addClass('active');
            $('#membershipService').addClass('active');
        }
    });

});

