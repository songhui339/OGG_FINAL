package com.project.ogg.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;

@Mapper
public interface ReviewMapper {
	
	Film checkFilm(int fCode);
	
	int insertFilm(Film film);

	List<Review> selectReviewAll(RowBounds rowBounds);
	
	List<Review> selectReviewByFilm(RowBounds rowBounds, int fcode);

	Review selectReviewByNo(int no);

	int selectReviewCount(int fcode);

	int writeReview(Review review);
	
	int updateReview(Review review);
	
	int deleteReview(Review review);
	
	List<ReviewCmt> selectCmtByReviewNo(int no);

	ReviewCmt selectCmtByCmtNo(int cmtNo);

	Review updateCmtCount(int no);

	int selectCmtCount(int no);

	int writeCmt(ReviewCmt cmt);

	int updateCmt(ReviewCmt cmt);

	int deleteCmt(ReviewCmt cmt);
}
