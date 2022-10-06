package com.project.ogg.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Answer {
	private int a_no;
	private String a_title;
	private String a_content;
	private Date a_date;
	private int a_m_no;
	private int q_no;
	private String a_m_name;
	
//	A_NO
//	A_TITLE
//	A_CONTENT
//	A_DATE
//	A_M_NO
//	Q_NO
}
