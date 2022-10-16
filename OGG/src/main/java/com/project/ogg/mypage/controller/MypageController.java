package com.project.ogg.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
    
    // 회원 정보 수정 페이지
    @GetMapping("/main")
    public String mypageMember () {
        
        return "mypage/mypage_main";
    }
    
    // 공지사항
    @GetMapping("/notice")
    public String mypageNotice () {
        
        return "mypage/mypage_notice";
    }
    
    @GetMapping("/notice/detail")
    public String mypageNoticeDetail () {
        
        return "mypage/mypage_notice_detail";
    }
    
    // 마이페이지 - 파티
    @GetMapping("/party")
    public String mypageParty () {
        
        return "mypage/mypage_party";
    }
    
    
}
