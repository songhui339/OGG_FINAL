package com.project.ogg.mypage.controller;

import java.util.List;

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
import com.project.ogg.admin.model.vo.Question;
import com.project.ogg.common.util.PageInfo;
import com.project.ogg.community.model.service.CommunityService;
import com.project.ogg.community.model.vo.Community;
import com.project.ogg.member.model.vo.Member;
import com.project.ogg.mypage.model.service.MypageService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageService service;
    
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
//    @GetMapping("/ask/update")
//	public ModelAndView questionUpdate(@RequestParam int no,
//										ModelAndView model) {
//		
//		Question question = service.getQuestionView(no);
//		Answer answer = service.getAnswer(question.getQ_no());
//		
//		if(answer != null) {
//			model.addObject("msg","답변이 있을 경우 질문 수정이 불가능합니다.");
//			model.addObject("location","/admin/question/view?no="+no);
//			model.setViewName("common/msg");
//			return model;
//		}
//		
//		model.addObject("question",question);
//		model.setViewName("admin/ad_questionUpdate");
//		
//		return model;
//	}
//	@PostMapping("/ask/update")
//	public ModelAndView questionUpdate(@RequestParam int no,
//									ModelAndView model,
//									@ModelAttribute Question question) {
//		
//		System.out.println(question);
//		int result = service.updateQuestion(question);
//		
//		if(result > 0) {
//			model.addObject("msg","문의 수정 완료");
//			model.addObject("location","/admin/question/view?no="+no);
//		}else{
//			model.addObject("msg","문의 수정 실패");
//			model.addObject("location","/admin/question/view?no="+no);
//		}
//		model.setViewName("common/msg");
//		return model;
//	}
    
    
    
}
