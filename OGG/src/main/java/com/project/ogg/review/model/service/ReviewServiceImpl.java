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
	public Film filmcheck(int fCode) {
		return mapper.checkFilm(fCode);
	}

	@Override
	public int filmSave(Film film) {
		return mapper.insertFilm(film);
	}
	
	@Override
	public List<Review> getReviewListAll(PageInfo pageInfo) {
	    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
	    int limit = pageInfo.getListLimit();
	    RowBounds rowBounds = new RowBounds(offset, limit);   
		
		return mapper.selectReviewAll(rowBounds);
	}

	@Override
	public List<Review> getReviewListByFilm(PageInfo pageInfo, int fcode) {
	    int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
	    int limit = pageInfo.getListLimit();
	    RowBounds rowBounds = new RowBounds(offset, limit);   
		
		return mapper.selectReviewByFilm(rowBounds, fcode);
	}
	
	@Override
	public Review getReviewByNo(int no) {
		return mapper.selectReviewByNo(no);
	}

	@Override
	public int getReviewCount(int fcode) {
		return mapper.selectReviewCount(fcode);
	}

	@Override
	public int reviewSave(Review review) {
		return mapper.writeReview(review);
	}

	@Override
	public int reviewUpdate(Review review) {
		return mapper.updateReview(review);
	}

	@Override
	public int reviewDelete(Review review) {
		return mapper.deleteReview(review);
	}	
	
	@Override
	public List<ReviewCmt> getCmtByReviewNo(int no) {
		return mapper.selectCmtByReviewNo(no);
	}
	
	@Override
	public ReviewCmt getCmtByCmtNo(int cmtNo) {
		return mapper.selectCmtByCmtNo(cmtNo);
	}
	
	@Override
	public int getCmtCountByNo(int no) {
		return mapper.selectCmtCount(no);
	}
	
	@Override
	public int updateCmtCount(int rvNo) {
		return mapper.updateCmtCount(rvNo);
	}

	@Override
	public int cmtWrite(ReviewCmt cmt) {
		return mapper.writeCmt(cmt);
	}

	@Override
	public int cmtUpdate(ReviewCmt cmt) {
		return mapper.updateCmt(cmt);
	}

	@Override
	public int cmtDelete(ReviewCmt cmt) {
		return mapper.deleteCmt(cmt);
	}
}
