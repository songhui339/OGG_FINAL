package com.project.ogg.party.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Party {
	private int p_no;
	
	private String ott_class;
	
	private int ott_no;
	
	private String p_share_id;
	
	private String p_share_pwd;
	
	private int p_max_member;
	
	private int p_cur_member;
	
	private String p_start_date;
	
	private int p_period;
	
	private String p_end_date;
	
	private String p_comment;
	
	private int p_entry_price;
	
	private String p_status;
	
	private String p_caution1;
	
	private String p_caution2;
	
	private String p_caution3;
	
	private String ott_name;
	
	private String ott_thumb;
	
	private String plan_name;
	
	private String plan_price;
	
	private String p_entry_price_output;
	
	private String p_deposit;
	
	private String p_accounts;
	
	private int accounts_count;
}
