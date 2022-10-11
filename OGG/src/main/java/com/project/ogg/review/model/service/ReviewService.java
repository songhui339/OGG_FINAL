package com.project.ogg.review.model.service;

import java.util.List;

import com.project.ogg.common.util.PageInfo;
import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;


public interface ReviewService {

	int getBoardCount(int fcode);

	List<Review> getBoardListAll(PageInfo pageInfo);

	List<Review> getBoardListByFilm(PageInfo pageInfo, int fcode);

	Review findReviewByNo(int no);

	int getCmtCountByNo(int no);

	List<ReviewCmt> findReviewCmtByNo(int no);

	int reviewSave(Review review);

	Review updateCmtCount(int no);

	int filmSave(Film film);

	Film filmcheck(int fcode);

	int reviewUpdate(Review review);

	int reviewDelete(Review review);

}
