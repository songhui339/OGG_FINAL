package com.project.ogg.review.model.service;

import java.util.List;

import com.project.ogg.common.util.PageInfo;
import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;


public interface ReviewService {

	Film filmcheck(int fcode);
	
	int filmSave(Film film);

	List<Review> getBoardListAll(PageInfo pageInfo);
	
	List<Review> getBoardListByFilm(PageInfo pageInfo, int fcode);
	
	Review getReviewByNo(int no);
	
	int getReviewCount(int fcode);

	int reviewSave(Review review);
	
	int reviewUpdate(Review review);
	
	int reviewDelete(Review review);

	List<ReviewCmt> getCmtByReviewNo(int no);

	ReviewCmt getCmtByCmtNo(int cmtNo);

	Review updateCmtCount(int no);

	int getCmtCountByNo(int no);

	int cmtWrite(ReviewCmt cmt);

	int cmtUpdate(ReviewCmt cmt);

	int cmtDelete(ReviewCmt cmt);
}
