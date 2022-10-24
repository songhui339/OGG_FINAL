package com.project.ogg.member.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.member.model.service.MemberService;
import com.project.ogg.member.model.vo.Member;

import lombok.Value;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@GetMapping("/member/goAgreementBeforJoin.do")
	public String agreementJoin() {
		return "member/joinAgreement";
	}
	
	@GetMapping("/member/goLoginPage.do")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/member/goJoinPage.do")
	public String join() {
		return "member/join";
	}
	
	@PostMapping("/member/join.do")
	public ModelAndView join(ModelAndView model, @ModelAttribute Member member) {
		
		int result = 0;
		result = service.save(member);
		
		if(result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/member/goLoginPage.do");
			model.setViewName("common/msg");
		} else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.addObject("location", "/member/goLoginPage.do");
			model.setViewName("common/msg");
		}
		return model;
	}
	
	@GetMapping("/member/idcheck.do")
	@ResponseBody
	public int idcheck(HttpServletRequest req,
					   HttpServletResponse resp,
					   @RequestParam("m_id") String m_id) {
		int result = service.idcheck(m_id);
		return result;
	}
	
	@GetMapping("/member/cutomLogin.do")
	public String customLogin(@RequestParam(value="error", required = false)String error,
			@RequestParam(value = "exception", required = false)String exception,
			Model model) {
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
		return "member/login";
	}
	
	@GetMapping("/admin/admin.do")
	public String adminAccess() {
		return "admin/admin";
	}
	
	@GetMapping("/board/member.do")
	public String boardAccess() {
		return "board/memberCanUse";
	}
	
	@GetMapping("/member/doLogout.do")
	public String logout() {
		return "member/logout";
	}
	
	@PostMapping("/member/errorlogin.do")
	public String errorlogin() {
		return "member/login";
	}
	
	@GetMapping("/member/accessDenied.do")
	public String accessDenied() {
		return "member/accessDenied";
	}
	
	@GetMapping("/member/goHome.do")
	public String goHome() {
		return "home";
	}
	
	// 아이디 찾기
	@GetMapping("/member/goFindId.do")
	public String findId() {
		return "member/findId";
	}
	
	@PostMapping("/member/findId.do")
	public String findId(Member member, Model model) {

		if(service.findIdCheck(member.getM_email()) == 0) {
			model.addAttribute("msg", "이메일을 확인해주세요.");
			return "member/findId";
		}  else {
			model.addAttribute("member", service.findId(member.getM_email()));
			return "member/findIdResult";
		}
	}
	
	// 비밀번호 찾기
	@GetMapping("/member/goFindPwd.do")
	public String findPwd() {
		return "member/findPwd";
	}
	
	@PostMapping("/member/findPwd.do")
	public ModelAndView findPwd(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String m_id = request.getParameter("m_id");
		String m_email = request.getParameter("m_email");
		
		Member member = service.findPwd(m_email);
		
		if(member != null) {
			Random random = new Random();
			int num = random.nextInt(999999);
			
			if(member.getM_id().equals(m_id)) {
				session.setAttribute(m_email, member.getM_email());
				
				String setfrom = "gnoejnimeel@gmail.com";
				String tomail = m_email;
				String title = "[OGG] 비밀번호변경 인증 이메일 입니다.";
				String content = "안녕하세요. "+ member.getM_name() +"회원님. OGG 비밀번호 찾기(변경) 인증번호는 " + num + " 입니다.";
				
				try {
					MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper messageHelper = new MimeMessageHelper(message);

					messageHelper.setFrom(setfrom); 
					messageHelper.setTo(tomail); 
					messageHelper.setSubject(title);
					messageHelper.setText(content); 
					
					mailSender.send(message);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				
				ModelAndView model = new ModelAndView();
				model.setViewName("member/findPwdNext");
				model.addObject("m_email", m_email);
				model.addObject("num" , num);
				return model;
				
			} else {
				ModelAndView model = new ModelAndView();
				model.addObject("msg", "아이디 또는 이메일 확인해주세요.");
				model.setViewName("member/findPwd");
				return model;
			}
		} else {
			ModelAndView model = new ModelAndView();
			model.addObject("msg", "아이디 또는 이메일 확인해주세요.");
			model.setViewName("member/findPwd");
			return model;
		}
	}
	
	@PostMapping("/member/findPwdConfirm.do")
	public ModelAndView fintPwd (ModelAndView model,
			@RequestParam(value="m_email") String m_email,
			@RequestParam(value="email_confirmation") String email_confirmation,
			@RequestParam(value="num") String num) throws IOException {
		
		if(email_confirmation.equals(num)) {
			model.addObject("m_email", m_email);
			model.setViewName("member/findPwdSetPwd");
			return model;
		} else {
			model.addObject("msg", "인증번호가 일치하지 않습니다.");
			model.addObject("location", "/member/goFindPwd.do");
			model.setViewName("common/msg");
			return model;
		}
	}
	
	@PostMapping("/member/findPwdSetNewPwd.do")
	public ModelAndView findPwd(ModelAndView model,
			@RequestParam(value="m_email") String m_email,
			Member member, HttpSession session) {
		int result = service.pwdUpdate(member);
		
		if(result == 1 ) {
			model.addObject("msg", "비밀번호 변경이 정상적으로 완료되었습니다.");
			model.addObject("location", "/member/goLoginPage.do");
			model.setViewName("common/msg");
			return model;
		} else {
			model.addObject("msg", "비밀번호 변경을 실패하였습니다.");
			model.addObject("location", "/member/goFindPwd.do");
			model.setViewName("common/msg");
			return model;
		}
	}

}