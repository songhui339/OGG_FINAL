package com.project.ogg.party.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Plan {
	private int plan_no;
	
	private int plan_price;
	
	private int ott_no;
	
	private String ott_name;
	
	private int ott_max_member;
	
	private String plan_price_output;
	
	private String ott_thumb;
	
	private String plan_name;
}
