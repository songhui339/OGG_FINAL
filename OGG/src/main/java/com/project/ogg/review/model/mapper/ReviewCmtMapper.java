package com.project.ogg.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.ogg.review.model.vo.ReviewCmt;

@Mapper
public interface ReviewCmtMapper {
	
	ReviewCmt selectCmt(ReviewCmt cmt);

	int updateCmtCount(int rvNo);

	int writeCmt(ReviewCmt cmt);

	int updateCmt(ReviewCmt cmt);

	List<ReviewCmt> selectReCmt(ReviewCmt cmt);

	int updateReCmt(ReviewCmt cmt);

}
