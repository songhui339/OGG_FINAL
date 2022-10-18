package com.project.ogg.review.model.service;

import com.project.ogg.review.model.vo.ReviewCmt;


public interface ReviewCmtService {

	ReviewCmt getCmtByCmtNo(int cmtNo);
	
	int updateCmtCount(int rvNo);
	
	int cmtWrite(ReviewCmt cmt);

	int cmtUpdate(ReviewCmt cmt);

}
