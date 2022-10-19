package com.project.ogg.pay.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.project.ogg.pay.service.PayService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PayService service;
	
	@PostMapping("/subpay")
	private void subpay (@RequestParam String customer_uid,
				@RequestParam String merchant_uid,
				@RequestParam String schedule_at,
				@RequestParam String amount
				) {
		service.requestSubPay(customer_uid, merchant_uid, schedule_at, amount);
	}
		
		

}

