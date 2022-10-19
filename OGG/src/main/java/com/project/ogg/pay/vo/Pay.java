package com.project.ogg.pay.vo;

import com.project.ogg.party.model.vo.Plan;

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
	
}
