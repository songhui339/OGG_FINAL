package com.project.ogg.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;

@Mapper
public interface ReviewMapper {

	int selectBoardCount(int fcode);

	List<Review> selectAll(RowBounds rowBounds);

	List<Review> selectReviewByFilm(RowBounds rowBounds, int fcode);

	Review selectReviewByNo(int no);

	int selectCmtCount(int no);

	List<ReviewCmt> selectCmtByNo(int no);

	
}
