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

	List<Review> getReviewListAll(PageInfo pageInfo);
	
	List<Review> getReviewListByFilm(PageInfo pageInfo, int fcode);
	
	Review getReviewByNo(int no);
	
	int getReviewCount(int fcode);

	int reviewWrite(Review review);
	
	int reviewUpdate(Review review);

	List<ReviewCmt> getCmtByReviewNo(int no);

	ReviewCmt getCmtByCmtNo(int cmtNo);

	int getCmtCountByNo(int no);

	int updateCmtCount(int rvNo);

	int cmtWrite(ReviewCmt cmt);

	int cmtUpdate(ReviewCmt cmt);

	int insertStar(ReviewLikes reviewLikes);

	ReviewLikes getStar(ReviewLikes reviewLikes);


}
