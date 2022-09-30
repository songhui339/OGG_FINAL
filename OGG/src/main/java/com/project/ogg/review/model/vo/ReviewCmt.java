package com.project.ogg.review.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewCmt {
	
	private int cmtNo;
	private int rvNo;
	private int cmtWriterNo;
	private Date cmtDate;
	private Date cmtUpDate;
	private String cmtContent;
	private String cmtStatus;
	private int cmtLikes;
	private int cmtGroup;
	private int cmtDepth;
	private String cmtNickname;
}
