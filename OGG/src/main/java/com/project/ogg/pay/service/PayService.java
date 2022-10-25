package com.project.ogg.pay.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.project.ogg.pay.vo.Pay;

@Service
public class PayService {
	public String getToken() {
		
		RestTemplate restTemplate = new RestTemplate();
	
		HttpHeaders headers = new HttpHeaders();
	    headers.setContentType(MediaType.APPLICATION_JSON);
		
	    
	    Map<String, Object> map = new HashMap<>();
	    map.put("imp_key", "5450354708440048");
	    map.put("imp_secret", "d4qC5JFu5lbF9MpLO5MtesfJIRVy8RIe7siwEzHUZIFU9CKt2qjL3Qdo5uYl8zrqFq47AVPFW5RjSXBz");
	    
	    
	    Gson var = new Gson();
	    String json = var.toJson(map);
	   
	    HttpEntity<String> entity = new HttpEntity<>(json,headers);
		return restTemplate.postForObject("https://api.iamport.kr/users/getToken", entity, String.class);
		
		
	}
	
	public String requestSubPay(String customer_uid, String merchant_uid, String schedule_at, String amount) {

		String token = getToken();
		Gson str = new Gson();
		
		token = token.substring(token.indexOf("response") + 10);
		token = token.substring(0, token.length() - 1);

		Pay payVo = str.fromJson(token, Pay.class);

		String access_token = payVo.getAccess_token();


		RestTemplate restTemplate = new RestTemplate();

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setBearerAuth(access_token);
		
		JsonObject jsonObject = new JsonObject();
		
		jsonObject.addProperty("merchant_uid", merchant_uid);
		jsonObject.addProperty("schedule_at", schedule_at);
		jsonObject.addProperty("amount", amount);
		jsonObject.addProperty("currency", "KRW");
		
		JsonArray jsonArr = new JsonArray();
		
		jsonArr.add(jsonObject);
		
		JsonObject reqJson = new JsonObject();
		
		reqJson.addProperty("customer_uid", customer_uid);
		reqJson.add("schedules", jsonArr);

		String json = str.toJson(reqJson);
		System.out.println(json);
		
		HttpEntity<String> entity = new HttpEntity<>(json, headers);
		
		return restTemplate.postForObject("https://api.iamport.kr/subscribe/payments/schedule", entity, String.class);

	}
}
