package com.project.ogg.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
    
    // 마이페이지 메인
    @GetMapping("/main")
    public String main () {
        
        return "mypage/mypage_main";
    }
    
    // 회원 정보 수정을 위한 비밀번호 체크
    @GetMapping("/pwdCheck")
    public String pwdCheck () {
        
        return "mypage/mypage_pwdCheck";
    }
    
    // 회원 정보 수정을 위한 비밀번호 체크
    @GetMapping("/updateMember")
    public String updateMember () {
        
        return "mypage/updateMember";
    }
    
    // 공지사항
    @GetMapping("/notice")
    public String mypageNotice () {
        
        return "mypage/mypage_notice";
    }
    
    @GetMapping("/notice/view")
    public String mypageNoticeDetail () {
        
        return "mypage/mypage_notice_detail";
    }
    
    // 마이페이지 - 파티
    @GetMapping("/party")
    public String mypageParty () {
        
        return "mypage/mypage_party";
    }
    
    @GetMapping("/party/leader")
    public String mypagePartyLeader () {
        
        return "mypage/mypage_party_leader";
    }
    
    @GetMapping("/party/member")
    public String mypagePartyMember () {
        
        return "mypage/mypage_party_member";
    }
    
    // 마이페이지 - 결제 수단
    @GetMapping("/payment")
    public String mypagePayment () {
        
        return "mypage/mypage_payment";
    }
    
    @GetMapping("/payment_history")
    public String mypagePaymentHistory () {
        
        return "mypage/mypage_paymentList";
    }
    
    @GetMapping("/point")
    public String mypagePoint () {
        
        return "mypage/mypage_point";
    }
    
    // 마이페이지 - 찜한 콘텐츠
    @GetMapping("/contents")
    public String mypageContents () {
        
        return "mypage/mypage_content";
    }
    
    
    // 마이페이지 - 내 게시글
    @GetMapping("/board")
    public String mypageBoard () {
        
        return "mypage/mypage_board";
    }
    
    // 마이페이지 - 1:1 문의
    @GetMapping("/ask")
    public String mypageAsk () {
        
        return "mypage/mypage_ask";
    }
    
    @GetMapping("/ask/view")
    public String mypageAskDetail () {
        
        return "mypage/mypage_ask_detail";
    }
    
    @GetMapping("/ask/write")
    public String writeAsk () {
        
        return "mypage/mypage_ask_write";
    }
    
    
    
    
}
