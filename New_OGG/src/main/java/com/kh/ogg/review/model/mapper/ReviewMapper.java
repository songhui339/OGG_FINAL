package com.kh.ogg.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.ogg.review.model.vo.Review;
import com.kh.ogg.review.model.vo.ReviewCmt;

@Mapper
public interface ReviewMapper {

	int selectBoardCount();

	List<Review> selectAll(RowBounds rowBounds);

	Review selectReviewByNo(int no);

	List<ReviewCmt> selectReviewCmtByNo(int no);
	
}
