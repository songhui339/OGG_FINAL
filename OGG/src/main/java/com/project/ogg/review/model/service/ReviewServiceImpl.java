package com.project.ogg.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public int filmInsert(Film film) {
		return mapper.insertFilm(film);
	}
	
	@Override
	public Review getReviewByNo(int no) {
		return mapper.selectReviewByNo(no);
	}

	@Override
	public int getCmtCountByNo(int no) {
		return mapper.selectCmtCount(no);
	}
	
	@Override
	public List<ReviewCmt> getCmtByReviewNo(int no) {
		return mapper.selectCmtByReviewNo(no);
	}
	
	@Override
	@Transactional
	public int reviewWrite(Review review) {
		return mapper.insertReview(review);
	}
	
	@Override
	@Transactional
	public int reviewUpdate(Review review) {
		return mapper.updateReview(review);
	}

}
