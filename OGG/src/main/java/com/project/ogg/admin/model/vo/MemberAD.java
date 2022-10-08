package com.project.ogg.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberAD {

	private int m_no; 
	private String m_name; 
	private Date m_joindate; 
	private String m_status; 
	private String m_authority; 
	private int r_time;
	private int m_point;
}
