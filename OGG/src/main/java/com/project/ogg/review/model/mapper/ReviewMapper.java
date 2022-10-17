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

	List<Review> selectReviewAll(RowBounds rowBounds);
	
	List<Review> selectReviewByFilm(RowBounds rowBounds, int fcode);
	Review selectReviewByNo(int no);

	int selectReviewCount(int fcode);

	int insertReview(Review review);
	
	int updateReview(Review review);
	
	List<ReviewCmt> selectCmtByReviewNo(int no);

	ReviewCmt selectCmtByCmtNo(int cmtNo);

	int selectCmtCount(int no);

	int updateCmtCount(int rvNo);

	int writeCmt(ReviewCmt cmt);

	int updateCmt(ReviewCmt cmt);

	int insertStar(ReviewLikes reviewLikes);

	ReviewLikes selectStar(ReviewLikes reviewLikes);
}
