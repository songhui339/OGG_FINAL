package com.project.ogg.mypage.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.admin.model.vo.Answer;
import com.project.ogg.admin.model.vo.Notice;
import com.project.ogg.admin.model.vo.Question;
import com.project.ogg.common.util.PageInfo;
import com.project.ogg.community.model.service.CommunityService;
import com.project.ogg.community.model.vo.Community;
import com.project.ogg.member.model.vo.Member;
import com.project.ogg.mypage.model.mapper.MypageMapper;
import com.project.ogg.mypage.model.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageService service;
	
	@Autowired
	private MypageMapper mapper;
    
    // 마이페이지 메인
    @GetMapping("/main")
    public ModelAndView main (ModelAndView model,
                             @AuthenticationPrincipal Member member) {
        
        model.setViewName("mypage/mypage_main");
        
        return model;
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
	public ModelAndView goNotice(@RequestParam(value = "page", defaultValue="1") int page,ModelAndView model) {
		
		List<Notice> list = null;
		PageInfo pageInfo = null;
		pageInfo = new PageInfo(page, 5, service.getNoticeCount(), 5);
		
		list = service.getNoticeList(pageInfo);
		
		model.addObject("pageInfo",pageInfo);
		model.addObject("list",list);
		model.setViewName("mypage/mypage_notice");
		return model;
	}
	
    @GetMapping("/notice/view")
	public ModelAndView noticeView(@RequestParam("no")int no,
							ModelAndView model,
							HttpServletRequest request,
							HttpServletResponse response) {
		
		Cookie[] cookies = request.getCookies();
    	String noticeHistory = ""; // 조회한 게시글 번호를 저장하는 변수
    	boolean hasRead = false; // 읽은 글이면 true, 안 읽었으면 false
    	
    	if(cookies != null) {
    		String name = null;
    		String value = null;
    		for (Cookie cookie : cookies) {
				name = cookie.getName();
				value = cookie.getValue();
				
				// boardHistory인 쿠키 값을 찾기
				if(name.equals("noticeHistory")) {
					noticeHistory = value;
					
					if(value.contains("|" + no + "|")) {
						hasRead = true;
						
						break;
					}
				}
			}
    	}
    	
    	// 2. 읽지 않은 게시글이면 cookie에 기록
    	if(!hasRead) {
    		Cookie cookie = new Cookie("noticeHistory", noticeHistory + "|" + no + "|");
        	
        	cookie.setMaxAge(-1); // 브라우저 종료 시 삭제
        	response.addCookie(cookie);
    	}    	
    	
		
		Notice notice = service.getNoticeView(no);
		
		if(notice != null && !hasRead) {
			 mapper.updateReadCount(notice);
		}
		
		notice = service.getNoticeView(no);
		
		model.addObject("notice",notice);
		model.setViewName("mypage/mypage_notice_detail");
		
		return model;
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
//    @GetMapping("/board")
//    public String mypageBoard () {
//        
//        return "mypage/mypage_board";
//    }
    
    @GetMapping("/board")
    public ModelAndView boardList(ModelAndView model,
    							@AuthenticationPrincipal Member member,
    							@RequestParam(value = "page", defaultValue = "1") int page) {
    	List<Community> list = null;
    	PageInfo pageInfo = null;
    	int m_no = member.getM_no();
    	
    	pageInfo = new PageInfo(page, 10, service.getCommnityCount(m_no), 10);
    	list = service.getCommunityList(m_no, pageInfo);
    	
    	model.addObject("list", list);
    	model.addObject("pageInfo", pageInfo);
    	model.setViewName("mypage/mypage_board");
    	
    	return model;
    }
    
    // 마이페이지 - 1:1 문의
    @GetMapping("/ask")
	public ModelAndView mypageAsk(@RequestParam(value = "page", defaultValue = "1") int page,
								ModelAndView model,
								@AuthenticationPrincipal Member member) {

		List<Question> list = null;
		PageInfo pageInfo = null;
		int qmno = member.getM_no();
		pageInfo = new PageInfo(page, 5, service.getQuestionCount(qmno), 5);

		list = service.getQuestionList(pageInfo,qmno);

		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("mypage/mypage_ask");
		return model;
	}
    
    @GetMapping("/ask/view")
	public ModelAndView mypageAskDetail(@RequestParam("no") int no, ModelAndView model) {

		Question question = service.getQuestionView(no);

		//답변상태가 Y이면 답변을 찾는 로직
		if (question.getQ_status().equals("Y")) {
			Answer answer = service.getAnswer(question.getQ_no());
			model.addObject("answer", answer);
		}

		model.addObject("question", question);
		model.setViewName("mypage/mypage_ask_detail");

		return model;
	}
    
    @GetMapping("/ask/write")
    public String writeAsk () {
        
        return "mypage/mypage_ask_write";
    }
    
    @PostMapping("/ask/write")
	public ModelAndView questionWriting(@ModelAttribute Question question,
										ModelAndView model,
										@AuthenticationPrincipal Member member) {

    	question.setQ_m_no(member.getM_no());
		int result = service.writeQuestion(question);
		int no = question.getQ_no();
		System.out.println("no : " + no);

		if (result > 0) {
			model.addObject("msg", "문의 작성 완료");
			model.addObject("location", "/mypage/ask/view?no="+ no);
		} else {
			model.addObject("msg", "문의 작성 실패");
			model.addObject("location", "/mypage/ask/write");
		}

		model.setViewName("common/msg");

		return model;
	}
    
    
    
    
}
