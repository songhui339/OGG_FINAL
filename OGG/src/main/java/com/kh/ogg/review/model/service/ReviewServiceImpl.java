package com.kh.ogg.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ogg.common.util.PageInfo;
import com.kh.ogg.review.model.mapper.ReviewMapper;
import com.kh.ogg.review.model.vo.Review;
import com.kh.ogg.review.model.vo.ReviewCmt;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public int getBoardCount() {
		
		return mapper.selectBoardCount();
	}

	@Override
	public List<Review> getBoardList(PageInfo pageInfo) {
	    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
	    int limit = pageInfo.getListLimit();
	    RowBounds rowBounds = new RowBounds(offset, limit);   
		
		return mapper.selectAll(rowBounds);
	}

	@Override
	public Review findReviewByNo(int no) {
		
		return mapper.selectReviewByNo(no);
	}

	@Override
	public List<ReviewCmt> findReviewCmtByNo(int no) {
		
		return mapper.selectReviewCmtByNo(no);
	}

}
