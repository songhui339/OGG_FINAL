package com.project.ogg.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import com.project.ogg.party.model.service.PartyService;
import com.project.ogg.party.model.vo.MyParty;
import com.project.ogg.party.model.vo.Party;
import com.project.ogg.party.model.vo.Point;
import com.project.ogg.pay.model.service.PayService;
import com.project.ogg.pay.model.vo.Pay;

import oracle.jdbc.proxy.annotation.GetProxy;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MypageService service;
	
	@Autowired
	private PartyService partyService;
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private MypageMapper mapper;
    
    // 마이페이지 메인
    @GetMapping("/main")
    public ModelAndView main (ModelAndView model,
                             @AuthenticationPrincipal Member member) {
        
        int m_no = member.getM_no();
        
        Member myPageMember = null;
        myPageMember = service.selectMemberByNo(m_no);
        
        model.addObject("myPageMember", myPageMember);
        model.setViewName("mypage/mypage_main");
        
        return model;
    }
    
    // 회원 정보 수정을 위한 비밀번호 체크
    @GetMapping("/pwdCheck")
    public String pwdCheck () {
        
        return "mypage/mypage_pwdCheck";
    }
    
    @PostMapping("/pwdCheck")
    public ModelAndView pwdCheck(ModelAndView model, 
    							@AuthenticationPrincipal Member member,
    							@RequestParam(value = "m_pwd") String m_pwd) {
    	
    	Member myPageMember = null;
    	myPageMember = service.selectMemberByNo(member.getM_no());
    	
    	if(passwordEncoder.matches(m_pwd, member.getM_pwd())) {
    		model.addObject("myPageMember", myPageMember); 
    		model.setViewName("mypage/mypage_updateMember");
    	} else {
    		model.addObject("msg", "비밀번호가 일치하지 않습니다.");
    		model.setViewName("common/msg");
    	}
    	
    	return model;
    }
    
    // 회원 정보 수정
    @PostMapping("/updateMember")
    public ModelAndView updateMember (ModelAndView model, 
			@AuthenticationPrincipal Member loginMember,
			@ModelAttribute Member member) {
    	
    	int result = 0;
    	member.setM_no(loginMember.getM_no());
    	result = service.save(member);
    	
    	if(result > 0) {
    		model.addObject("loginMember", service.selectMemberByNo(loginMember.getM_no()));
			model.addObject("msg", "회원 정보 수정을 완료했습니다.");
		} else {
			model.addObject("msg", "회원 정보 수정을 실패했습니다.");
		}
		
		model.addObject("location", "/mypage/main");
		model.setViewName("common/msg");
    	
        return model;
    }
    
    // 회원 탈퇴 관련 핸들러
    @GetMapping("/delete")
    public ModelAndView delete (
                ModelAndView model,
                @AuthenticationPrincipal Member member) {
       
        int result = 0;
        
        result = service.delete(member.getM_no());
        
        if(result > 0) {
            model.addObject("msg", "정상적으로 탈퇴 처리 되었습니다.");
            model.addObject("location", "/member/doLogout.do");
        } else {
            model.addObject("msg", "회원 탈퇴 처리에 실패했습니다");
            model.addObject("location", "/mypage/main");
        }
        
        model.setViewName("common/msg");
        
        return model;
    }
       
    // 비밀번호 변경 핸들러 
    @GetMapping("/updatePwd")
    public String updatePwd () {
        
        return "mypage/mypage_updatePwd";
    }
    
    @PostMapping("/updatePwd")
    public ModelAndView updatePwd (ModelAndView model,
                                   @AuthenticationPrincipal Member loginMember,
                                   @RequestParam(value = "m_pwd") String password,
                                   @RequestParam(value = "newpassword") String newpassword,
                                   @RequestParam(value = "newpasswordcheck") String newpasswordcheck) {
        
        int result = 0;
        
        if(passwordEncoder.matches(password, loginMember.getM_pwd())) {
            result = service.updatePwd(loginMember.getM_no(), passwordEncoder.encode(newpassword));
            
            if(result > 0) {
                model.addObject("msg", "비밀번호 변경이 완료되었습니다. 다시 로그인해주세요.");
                model.addObject("location", "/member/doLogout.do");
            } else {
                model.addObject("msg", "비밀번호 변경에 실패했습니다.");
                model.addObject("location", "/mypage/updatePwd");
            }
        } else {
            model.addObject("msg", "현재 비밀번호가 일치하지 않습니다");
            model.addObject("location", "/mypage/updatePwd");
        }
        
        model.setViewName("common/msg");
        
        return model;
    }
    
    // 공지사항
    @GetMapping("/notice")
	public ModelAndView goNotice(@RequestParam(value = "page", defaultValue="1") int page,ModelAndView model) {
		
		List<Notice> list = null;
		PageInfo pageInfo = null;
		pageInfo = new PageInfo(page, 5, service.getNoticeCount(), 5);
		
		list = service.getNoticeList(pageInfo);
		System.out.println(list);
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
		System.out.println(notice);
		model.addObject("notice",notice);
		model.setViewName("mypage/mypage_notice_detail");
		
		return model;
	}
    
    // 마이페이지 - 파티리스트
    @GetMapping("/party")
    public ModelAndView mypageParty (ModelAndView model,
    		@AuthenticationPrincipal Member member) {
    	List<MyParty> myParty = null;
    	int m_no = member.getM_no();
    	
    	myParty = partyService.getPartyListByNo(m_no);
    	
    	model.addObject("list", myParty);
    	model.setViewName("mypage/mypage_party");
    	
        return model;
    }
    
    // 마이페이지 - 파티상세(파티장)
    @GetMapping("/party/leader")
    public ModelAndView mypagePartyLeader (ModelAndView model,
    		@RequestParam int no,
    		@AuthenticationPrincipal Member member) {
        
    	Party party = new Party();
    	List<MyParty> partyMember = null;
    	int m_no = member.getM_no();
    	
    	party = partyService.selectParty(no);
    	partyMember = partyService.partyMemberList(no);
    	
    	model.addObject("party", party);
    	model.addObject("memberlist", partyMember);
    	model.addObject("m_no", m_no);
    	model.setViewName("mypage/mypage_party_leader");
    	
        return model;
    }
    
    // 마이페이지 - 파티상세(파티원)
    @GetMapping("/party/member")
    public ModelAndView mypagePartyMember (ModelAndView model,
    		@RequestParam int no,
    		@AuthenticationPrincipal Member member) {
        
    	Party party = new Party();
    	List<MyParty> partyMember = null;
    	int m_no = member.getM_no();
    	String m_id = member.getM_id();
    	
    	party = partyService.selectParty(no);
    	partyMember = partyService.partyMemberList(no);
    	
    	model.addObject("party", party);
    	model.addObject("memberlist", partyMember);
    	model.addObject("m_no", m_no);
    	model.addObject("m_id", m_id);
    	model.setViewName("mypage/mypage_party_member");
    	
        return model;
        
    }
    
    // 마이페이지 - 파티수정
    @PostMapping("/party/updateParty")
    public ModelAndView mypagePartyUpdate (ModelAndView model,
    		@RequestParam int p_no,
    		@ModelAttribute Party party) {
    	
    	int result = 0;
    	party.setP_no(p_no);
    	
    	result = partyService.updateParty(party);
    	
    	if(result > 0) {
    		model.addObject("msg", "공유 계정이 수정되었습니다.");
            model.addObject("location", "/mypage/party");
    	} else {
    		model.addObject("msg", "공유 계정 수정에 실패하였습니다.");
            model.addObject("location", "/mypage/party");
    	}
    	
    	model.setViewName("common/msg");
    	
    	return model; 
    }
    
    // 마이페이지 - 파티 탈퇴, 예약 결제 취소 (파티원)
    @PostMapping("/party/unschedule")
    private ModelAndView unschedule (ModelAndView model,
    		@RequestParam String customer_uid,
    		@RequestParam int p_no,
    		@AuthenticationPrincipal Member member){
    	int result = 0;
    	Party party = new Party();
    	List<Pay> pay = null;
    	party.setM_no(member.getM_no());
    	party.setP_no(p_no);
    	
    	partyService.removePartyMember(party);
    	result = partyService.deleteMemberParty(party);
    	pay = partyService.memberPayList(party);
    	
    	if(result > 0) {
    		payService.unschedulePay(customer_uid, pay);
    		partyService.deletePay(party);
    		model.addObject("msg", "파티를 탈퇴하였습니다.");
            model.addObject("location", "/mypage/party");
    	} else {
    		model.addObject("msg", "파티 탈퇴에 실패했습니다.");
            model.addObject("location", "/mypage/party");
    	}
    	
    	
    	model.setViewName("common/msg");
    	
    	return model;
    }
    // 마이페이지 - 파티 해체, 파티원 예약 결제 취소 (파티장)
    @PostMapping("/party/deleteParty")
    private ModelAndView deleteParty (ModelAndView model,
    		@RequestParam int p_no) {
    	String customer_uid = "";
    	List<Pay> payList = null;
    	List<Pay> merchantList = null;
    	Party party = new Party();
    	Pay pay = new Pay();
    	
    	payList = partyService.selectMemberParty(p_no);
    	for(int i = 0; i < payList.size(); i++) {
    		pay.setM_no(payList.get(i).getM_no());
    		pay.setP_no(payList.get(i).getP_no());
    		pay.setStatus(payList.get(i).getStatus());
    		party.setM_no(payList.get(i).getM_no());
    		party.setP_no(payList.get(i).getP_no());
    		
    		if(pay.getStatus() == "Y") {
    			partyService.deletePartyMember(pay);
    			continue;
    		} else {
    			customer_uid = partyService.getMemberId(pay.getM_no());
    			merchantList = partyService.memberPayList(party);
    			payService.unschedulePay(customer_uid, merchantList);
    			partyService.deletePartyMember(pay);
    		}
    	}
    	partyService.deleteParty(pay);
    	
    	return model;
    }
    
    // 마이페이지 - 결제 수단
    @GetMapping("/payment")
    public String mypagePayment () {
        
        return "mypage/mypage_payment";
    }
    
    // 마이페이지 - 결제 내역 확인
    @GetMapping("/payment_history")
    public ModelAndView mypagePaymentHistory (ModelAndView model,
    		@RequestParam(value = "page", defaultValue = "1") int page,
    		@AuthenticationPrincipal Member member) {
    	List<Pay> pay = null;
    	PageInfo pageInfo = null;
    	
        int m_no = member.getM_no();
        
        pageInfo = new PageInfo(page, 10, partyService.getPayCount(m_no), 8);
    	pay = partyService.getPayListByNo(pageInfo, m_no);    	
    	
    	model.addObject("list", pay);
    	model.addObject("pageInfo", pageInfo);
    	model.setViewName("mypage/mypage_paymentList");
    	
        return model;
    }
    
    // 마이페이지 - 포인트 내역 확인
    @GetMapping("/point")
    public ModelAndView mypagePoint (ModelAndView model,
    		@RequestParam(value = "page", defaultValue = "1") int page,
    		@AuthenticationPrincipal Member member) {
    	List<Point> point = null;
    	PageInfo pageInfo = null;
    	
        int m_no = member.getM_no();
        int m_point = member.getM_point();
        
        pageInfo = new PageInfo(page, 10, partyService.getPointCount(m_no), 8);
    	point = partyService.getPointList(pageInfo, m_no);    	
    	
    	model.addObject("list", point);
    	model.addObject("point", m_point);
    	model.addObject("pageInfo", pageInfo);
    	model.setViewName("mypage/mypage_point");
    	
        return model;
    }
    
    // 마이페이지 - 찜한 콘텐츠
    @GetMapping("/contents")
    public String mypageContents () {
        
        return "mypage/mypage_content";
    }
    
    // 마이페이지 - 커뮤니티
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
