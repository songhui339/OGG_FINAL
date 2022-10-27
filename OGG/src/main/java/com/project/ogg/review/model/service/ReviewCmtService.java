package com.project.ogg.review.model.service;

import java.util.List;

import com.project.ogg.review.model.vo.ReviewCmt;


public interface ReviewCmtService {

	ReviewCmt getCmt(ReviewCmt cmt);
	
	int updateCmtCount(int rvNo);
	
	int cmtWrite(ReviewCmt cmt);

	int cmtUpdate(ReviewCmt cmt);

	List<ReviewCmt> getReCmt(ReviewCmt cmt);

}
