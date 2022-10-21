package com.project.ogg.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;
import com.project.ogg.review.model.vo.ReviewLikes;

@Mapper
public interface ReviewMapper {
	
	Film checkFilm(int fCode);
	
	int insertFilm(Film film);

	Review selectReviewByNo(int no);

	int selectCmtCount(int no);

	List<ReviewCmt> selectCmtByReviewNo(int no);

	int insertReview(Review review);
	
	int updateReview(Review review);

//	List<ReviewCmt> selectReCmtByReviewNo(List<ReviewCmt> reviewCmt);
}
