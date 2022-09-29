package com.project.ogg.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.member.model.service.MemberService;
import com.project.ogg.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/member/goJoin.do")
	public String joinPage() {
		return "member/join";
	}
	
	@GetMapping("/member/goAgreementBeforJoin.do")
	public String agreementJoin() {
		return "member/joinAgreement";
	}
	
	@GetMapping("/member/idcheck.do")
	@ResponseBody
	public int idcheck(HttpServletRequest req, HttpServletResponse resp, @RequestParam("m_id") String m_id) {
		int result = service.idcheck(m_id);
		return result;
	}
	
	@PostMapping("/member/join.do")
	public ModelAndView join(ModelAndView model, @ModelAttribute Member member) {
		
		int result = 0;
		result = service.save(member);
		
		if(result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.setViewName("home");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.setViewName("member/join");
		}
		
		model.addObject("common/msg");
		
		return model;
	}
	
	@GetMapping("/member/goLogin.do")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/member/goCutomLogin.do")
	public String customLogin(@RequestParam(value="error", required = false)String error,
			@RequestParam(value = "exception", required = false)String exception,
			Model model) {
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
	return "member/login";
	}
	
	@GetMapping("/member/goLogout.do")
	public String logout() {
		return "member/logout";
	}
	
	@GetMapping("/admin/admin.do")
	public String adminAccess() {
		return "admin/adminSample";
	}
	
	@GetMapping("/member/accessDenied.do")
	public String accessDenied() {
		return "member/accessDenied";
	}
	
	@PostMapping("/member/errorlogin.do")
	public String errorlogin() {
		return "member/login";
	}
	
	@GetMapping("/member/main.do")
	public String goMain() {
		return "home";
	}
	
}