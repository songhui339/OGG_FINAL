package com.project.ogg.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.ogg.common.util.PageInfo;
import com.project.ogg.review.model.mapper.ReviewMapper;
import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public int getBoardCount(int fcode) {
		
		return mapper.selectBoardCount(fcode);
	}

	@Override
	public List<Review> getBoardListAll(PageInfo pageInfo) {
	    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
	    int limit = pageInfo.getListLimit();
	    RowBounds rowBounds = new RowBounds(offset, limit);   
		
		return mapper.selectAll(rowBounds);
	}

	@Override
	public List<Review> getBoardListByFilm(PageInfo pageInfo, int fcode) {
	    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
	    int limit = pageInfo.getListLimit();
	    RowBounds rowBounds = new RowBounds(offset, limit);   
		
		return mapper.selectReviewByFilm(rowBounds, fcode);
	}

	@Override
	public Review findReviewByNo(int no) {
		
		return mapper.selectReviewByNo(no);
	}

	@Override
	public int getCmtCountByNo(int no) {
		
		return mapper.selectCmtCount(no);
	}
	
	@Override
	public List<ReviewCmt> findReviewCmtByNo(int no) {
		
		return mapper.selectCmtByNo(no);
	}

	@Override
	public int reviewSave(Review review) {
		
		return mapper.insertReview(review);
	}

	@Override
	public Review updateCmtCount(int no) {
	
		return mapper.updateCmtCount(no);
	}

	@Override
	public int filmSave(Film film) {
		
		return mapper.insertFilm(film);
	}

	@Override
	public Film filmcheck(int fCode) {
		
		return mapper.checkFilm(fCode);
	}



}
