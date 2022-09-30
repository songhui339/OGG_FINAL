package com.project.ogg.party.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.party.model.service.PartyService;
import com.project.ogg.party.model.vo.Ott;
import com.project.ogg.party.model.vo.Party;

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
}
