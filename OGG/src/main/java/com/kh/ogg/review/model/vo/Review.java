package com.kh.ogg.review.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	
	private int rvNo;
	private String fCode;
	private int rvWriterNo;
	private Date rvDate;
	private Date rvUpdate;
	private String rvContent;
	private String rvStatus;
	private int rvLikes;
	private int rvReadCount;
	private String rvNickname;
}
