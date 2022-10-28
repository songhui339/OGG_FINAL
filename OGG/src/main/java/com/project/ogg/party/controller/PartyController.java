package com.project.ogg.party.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.member.model.vo.Member;
import com.project.ogg.party.model.service.PartyService;
import com.project.ogg.party.model.vo.Ott;
import com.project.ogg.party.model.vo.Party;
import com.project.ogg.party.model.vo.Plan;
import com.project.ogg.party.model.vo.Point;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/party")
public class PartyController {
	
	@Autowired
	private PartyService service;
	
	@GetMapping("/ottlist_create")
	public ModelAndView ottlist_create(ModelAndView model,
			@AuthenticationPrincipal Member member) {
		
		if(member != null) {
			List<Ott> list = null;
			
			list = service.getOttList();
		
			model.addObject("list", list);
			model.setViewName("party/createParty");	
		} else {			
			model.addObject("msg", "로그인 후 이용할 수 있습니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
	
		
		return model;
	}
	
	@GetMapping("/ottlist_find")
	public ModelAndView ottlist_find(ModelAndView model) {
		
		List<Ott> list = null;
		
		list = service.getOttList();
		
		model.addObject("list", list);
		model.setViewName("party/submitParty");
		
		return model;
	}
	
	@GetMapping("/findPartyList")
	public ModelAndView findPartyList(ModelAndView model, @RequestParam String ottName,
			@AuthenticationPrincipal Member member) {
		
		if(member != null) {
			List<Party> list = null;
			Party party = new Party();
			party.setM_no(member.getM_no());
			party.setOtt_name(ottName);
			
			list = service.getPartyList(party);
			
			model.addObject("list", list);
			model.setViewName("party/submitParty_list");
		} else {
			model.addObject("msg", "로그인 후 이용할 수 있습니다.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
		
		
		return model;
	}
	
	@GetMapping("/partyDetail")
	public ModelAndView partyDetail(ModelAndView model, @RequestParam int no, @AuthenticationPrincipal Member member) {
		
		Party party = null;
		
		party = service.selectParty(no);
		
		party.setM_id(member.getM_id());
		party.setM_email(member.getM_email());
		party.setM_name(member.getM_name());
		party.setM_tel(member.getM_phonenumber());
		
		model.addObject("party", party);
		model.setViewName("party/submitParty_detail");
		
		return model;
	}
	
	@PostMapping("/planSelect")
	public ResponseEntity<List<Ott>> modal(@RequestParam String ottName) {		
		
		List<Ott> list = null;
		
		list = service.getPlanInfo(ottName);
		
		return new ResponseEntity<List<Ott>>(list, HttpStatus.OK);
		
	}
	
	@PostMapping("/getPlanName")
	public ResponseEntity<Map<String, Ott>> getPlanName(@RequestParam int ottNo) {		
		Map<String, Ott> map = new HashMap<>();
		
		map.put("ott", service.getPlanName(ottNo));
		
		return new ResponseEntity<Map<String, Ott>>(map, HttpStatus.OK);
		
	}
	
	@PostMapping("/modalCheck")
	public ModelAndView modalCheck(ModelAndView model, @RequestParam int modal_ott_no) {
		
		Ott ott = null;
		
		ott = service.getOttInfo(modal_ott_no);
		
		model.addObject("ott", ott);
		model.setViewName("party/createPartyWrite");
		
		return model;
	}
	
	@PostMapping("/createParty")
	public ModelAndView createParty(
			ModelAndView model,
			@ModelAttribute Party party,
			@AuthenticationPrincipal Member member) {
		int result = 0;
		int m_no = member.getM_no();
		party.setM_no(member.getM_no());
		party.setM_status("Y");
		party.setP_no(service.partyCreate(party, m_no));
		
		result = service.insertPartyMemeber(party);
		
		if(result > 0) {
			model.setViewName("party/createPartyThxPage");			
		} else {
			model.addObject("msg", "파티 등록을 실패하였습니다.");
			model.addObject("location", "/party/modalCheck");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	

	@GetMapping("/submitParty")
	public ModelAndView submitParty(
			ModelAndView model,
			@RequestParam int no,
			@RequestParam int point,
			@AuthenticationPrincipal Member member) {
		
		int result = 0;
		Party party = new Party();
		Point pointVo = new Point();
		
		party = service.selectParty(no);
		result = service.partyMemberCheck(party);
		
		System.out.println(party);
		
		pointVo.setPo_point(point);
		pointVo.setM_no(party.getM_no());
		
		if(result > 0) {
			party.setPoint(point);
			System.out.println(party);
			service.updateMemberPoint(party);
			service.insertPoint(pointVo);
			
			party.setP_cur_member(party.getP_cur_member() + 1);
			party.setM_no(member.getM_no());
			party.setM_status("N");
			
			service.updatePartyMember(party);
			service.insertPartyMemeber(party);
			model.setViewName("party/submitPartyThxPage");			
		} else {
			model.addObject("msg", "파티 등록을 실패하였습니다.");	
			model.addObject("location", "/party/partyDetail");
			model.setViewName("common/msg");
		}
				
		return model;
	}
}
