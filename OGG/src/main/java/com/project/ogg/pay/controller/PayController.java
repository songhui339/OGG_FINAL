package com.project.ogg.pay.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.ogg.member.model.vo.Member;
import com.project.ogg.pay.service.PayService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PayService service;
	
	@PostMapping("/subpay")
	private ResponseEntity<Map<String, String>> subpay (@RequestParam String customer_uid,
				@RequestParam String merchant_uid,
				@RequestParam long schedule_at,
				@RequestParam int amount,
				@AuthenticationPrincipal Member member
				) {
		int m_no = member.getM_no();
		
		Map<String, String> map = new HashMap<>();
		
		map.put("result", service.requestSubPay(customer_uid, merchant_uid, schedule_at, amount, m_no));
		
		return new ResponseEntity<Map<String,String>>(map, HttpStatus.OK);
	}
		
		

}

