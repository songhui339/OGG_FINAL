package com.project.ogg.review.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewLikes {
	
	private int lNo;
	private int mNo;
	private int rvNo;
	private int cmtNo;
	private String fCode;
	private String fType;
	private int fLikes;
	private int fStar;
	private Date lDate;
	private Date lUpdate;
	private String lType;
	private int num;
	
}
