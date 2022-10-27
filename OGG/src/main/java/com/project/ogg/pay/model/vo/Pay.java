package com.project.ogg.pay.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pay {
	
	private String access_token;
	
	private long now;
	
	private long expired_at;
	
	private int m_no;
	
	private Date date;
	
	private int amount;
	
	private int r_num;
	
	private String status;
	
	private int pay_no;
	
	private String amount_output;
	
	private String merchant_uid;
	
	private int p_no;
	
}
