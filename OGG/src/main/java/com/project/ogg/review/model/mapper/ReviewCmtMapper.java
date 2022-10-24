package com.project.ogg.review.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.ogg.review.model.vo.ReviewCmt;

@Mapper
public interface ReviewCmtMapper {
	
	ReviewCmt selectCmtByCmtNo(int cmtNo);

	int updateCmtCount(int rvNo);

	int writeCmt(ReviewCmt cmt);

	int updateCmt(ReviewCmt cmt);

}
