package com.project.ogg.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OttAdmin {
	private int ott_no;
	private int ott_rnum;
	
	private String ott_name;
	
	private String ott_thumb;
	
	private String ott_class;
	
	private int ott_max_member;
	
	private String plan_name;
	
	private String plan_price;
	
	private String ott_status;
}
