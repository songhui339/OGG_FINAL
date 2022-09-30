package com.project.ogg.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Question {

	private int q_no;
	private String q_title;
	private String q_content;
	private String q_status;
	private Date q_enrolldate;
	private int q_m_no;
	private int q_a_no;
	private int q_rno;
	private String q_m_name;
}
