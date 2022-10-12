package com.project.ogg.party.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.party.model.service.PartyService;
import com.project.ogg.party.model.vo.Ott;
import com.project.ogg.party.model.vo.Party;
import com.project.ogg.party.model.vo.Plan;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/party")
public class PartyController {
	
	@Autowired
	private PartyService service;
	
	@GetMapping("/ottlist")
	public ModelAndView ottlist(ModelAndView model) {
		
		List<Ott> list = null;
		
		list = service.getOttList();
		
		model.addObject("list", list);
		model.setViewName("party/createParty");
		
		return model;
	}
	
	@PostMapping("/modal")
	public ResponseEntity<List<Plan>> modal(@RequestParam int ottNo) {		
		
		List<Plan> list = null;
		
		list = service.getPlanInfo(ottNo);
		
		return new ResponseEntity<List<Plan>>(list, HttpStatus.OK);
		
	}
	
	@PostMapping("/getPlanName")
	public ResponseEntity<Map<String, Plan>> getPlanName(@RequestParam int planNo) {		
		Map<String, Plan> map = new HashMap<>();
		
		map.put("plan", service.getPlanName(planNo));
		
		return new ResponseEntity<Map<String, Plan>>(map, HttpStatus.OK);
		
	}
	
	@PostMapping("/modalCheck")
	public ModelAndView modalCheck(ModelAndView model, @RequestParam int modal_plan_no) {
		System.out.println(modal_plan_no);
		
		Plan plan = null;
		
		plan = service.getOttInfo(modal_plan_no);
		
		model.addObject("plan", plan);
		model.setViewName("party/createPartyWrite");
		
		return model;
	}
	
	@PostMapping("/createParty")
	public ModelAndView createParty(
			ModelAndView model,
			@ModelAttribute Party party) {
		
		service.partyCreate(party);
		
		model.setViewName("party/createPartyThxPage");
		
		return model;
	}
	
	@GetMapping("/prevPartyPage")
	public String prevPartyPage() {
		
		return "forward:/party/ottlist";
	}
}
