package com.project.ogg.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {

	int n_no;
	String n_title;
	String n_content;
	String n_path;
	int n_readcount;
	String n_status;
	Date n_Create_Date;
	int n_M_No;
	int n_rno;
	String n_m_name;
	
}
