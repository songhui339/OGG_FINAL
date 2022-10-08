/*
================================================
OGG Party Page JavaScript
================================================
*/

jQuery(document).ready(function ($) {
    
    let btnAll = $('.createPartyTab_row_01 .btn_container section .btnBox');
    let tabAll = document.querySelectorAll('.itemBox');
    let media = document.querySelectorAll('.mediaService');
    let game = document.querySelectorAll('.gameService');
    let edu = document.querySelectorAll('.eduService');
    let util = document.querySelectorAll('.utilityService');
    let member = document.querySelectorAll('.membershipService');

    // 전체
    $('#createPartyTab_Icon_01').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            for (let i = 0; i < tabAll.length; i++) {
                tabAll[i].hidden = false;         
            };

            // 활성화
            $(this).addClass('active');


        }
    });

    // 미디어
    $('#createPartyTab_Icon_02').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            for (let i = 0; i < tabAll.length; i++) {
                tabAll[i].hidden = true;         
            };

            // 활성화
            $(this).addClass('active');
            for (let i = 0; i < media.length; i++) {
                media[i].hidden = false;                
            };
        }
    });
    
    // 게임
    $('#createPartyTab_Icon_03').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            for (let i = 0; i < tabAll.length; i++) {
                tabAll[i].hidden = true;         
            };

            // 활성화
            $(this).addClass('active');
            for (let i = 0; i < game.length; i++) {
                game[i].hidden = false;                
            };
        }
    });
    
    // 교육/도서
    $('#createPartyTab_Icon_04').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            for (let i = 0; i < tabAll.length; i++) {
                tabAll[i].hidden = true;         
            };

            // 활성화
            $(this).addClass('active');
            for (let i = 0; i < edu.length; i++) {
                edu[i].hidden = false;                
            };
        }
    });

    // 유틸리티
    $('#createPartyTab_Icon_05').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            for (let i = 0; i < tabAll.length; i++) {
                tabAll[i].hidden = true;         
            };

            // 활성화
            $(this).addClass('active');
            for (let i = 0; i < util.length; i++) {
                util[i].hidden = false;                
            };
        }
    });

    // 멤버십
    $('#createPartyTab_Icon_06').click(function () {
        if ($(this).hasClass('active') === false) {
            // 초기화
            btnAll.removeClass('active');
            for (let i = 0; i < tabAll.length; i++) {
                tabAll[i].hidden = true;         
            };

            // 활성화
            $(this).addClass('active');
            for (let i = 0; i < member.length; i++) {
                member[i].hidden = false;                
            };
        }
    });

});