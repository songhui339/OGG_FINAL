package com.project.ogg.party.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ott {
	private int ott_no;
	
	private String ott_name;
	
	private String ott_thumb;
	
	private String ott_class;
	
	private int ott_max_member;
	
	private String plan_price;
	
	private String ott_status;
}
