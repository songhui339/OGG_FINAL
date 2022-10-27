package com.project.ogg.party.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MyParty {
	private int p_no;
	
	private int m_no;
	
	private String m_id;
	
	private String status;
	
	private String ott_thumb;
	
	private String plan_name;
	
	private int loginMember_no;
	
	private String start_date;
}
