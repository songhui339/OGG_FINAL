package com.project.ogg.review.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.ogg.common.util.PageInfo;
import com.project.ogg.review.model.mapper.FilmMapper;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewLikes;

@Service
public class FilmServiceImpl implements FilmService {

	@Autowired
	private FilmMapper mapper;

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
	public int getReviewCount(int fcode) {
		return mapper.selectReviewCount(fcode);
	}

	@Override
	public int getCmtCountByNo(int no) {
		return mapper.selectCmtCount(no);
	}

	@Override
	public List<ReviewLikes> getFilmLikes(int no) {
		return mapper.selectFilmLikes(no);
	}

	@Override
	public Review getReviewByMember(Review review) {
		return mapper.selectReviewByMember(review);
	}

}
