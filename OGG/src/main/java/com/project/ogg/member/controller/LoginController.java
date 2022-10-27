package com.project.ogg.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.member.model.service.MemberService;
import com.project.ogg.member.model.vo.Member;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/member/kakao.do")
	public String kakaoLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		// kakaoId를 member id로 셋팅
		String kakaoid = request.getParameter("kakaoemail");
		Member member = new Member();	
		member.setM_id(kakaoid);
		
		// 카카오 계정으로 로그인한 적이 있는지 확인
		int resultLookup = service.loginLookup(member);
		
		// 회원이 아닌경우 (카카오 계정으로 처음 방문한 경우)
		// 카카오 회원정보 설정 창으로 이동
		if(resultLookup == 0) {
			request.setAttribute("kakaoid",request.getParameter("kakaoemail"));
			request.setAttribute("kakaoname",request.getParameter("kakaoname"));
			
			// 회원가입 창으로 이동
			return "member/kakaoJoin";
			
		// 이미 카카오로 로그인한 적이 있을 때 (최초 1회 로그인때 회원가입된 상태)
		} else {
			member = service.kakaoMemberConfirm(member);
			
			// 세션 저장
			session.setAttribute("kakaoid", member.getM_id());
			session.setAttribute("kakaoname", member.getM_nickname());
			
			return "home";
		}

	}
	
	// 카카오 회원정보 설정
	@PostMapping("/member/kakaoJoin.do")
	public ModelAndView kakaoJoin(ModelAndView model, @ModelAttribute Member member) {
		int result = 0;
		result = service.insertKakaoMember(member);
		
		if(result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/member/goHome.do");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.addObject("location", "/member/goLoginPage.do");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 카카오 로그아웃
	@GetMapping("/member/kakaoLogout.do")
	public String kakaoLogout(HttpSession session) {
		session.invalidate();
		return "member/login";
	}
	
}