package com.project.ogg.review.model.service;

import java.util.List;

import com.project.ogg.common.util.PageInfo;
import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;
import com.project.ogg.review.model.vo.ReviewLikes;


public interface ReviewService {
	
	Film filmcheck(int fcode);
	
	int filmInsert(Film film);

	Review getReviewByNo(int no);
	
	int getCmtCountByNo(int no);
	
	List<ReviewCmt> getCmtByReviewNo(int no);

	int reviewWrite(Review review);
	
	int reviewUpdate(Review review);

//	List<ReviewCmt> getReCmtByReviewNo(Review review);

}
