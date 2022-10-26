package com.project.ogg.party.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Party {
	private int p_no;
	
	private int m_no;
	
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
	
	private String ott_name;
	
	private String ott_thumb;
	
	private String plan_name;
	
	private String plan_price;
	
	private String p_entry_price_output;
	
	private String p_deposit;
	
	private String p_accounts;
	
	private int accounts_count;
	
	private String p_end_date_output;
	
	private int p_period_day;
	
	private String m_status;
	
	private String m_id;
	
	private String m_email;
	
	private String m_name;
	
	private String m_tel;
	
	private int point;
	
	
}
