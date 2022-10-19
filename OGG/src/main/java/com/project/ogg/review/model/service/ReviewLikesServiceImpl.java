package com.project.ogg.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.ogg.review.model.mapper.ReviewLikesMapper;
import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;
import com.project.ogg.review.model.vo.ReviewLikes;

@Service
public class ReviewLikesServiceImpl implements ReviewLikesService {

	@Autowired
	private ReviewLikesMapper mapper;

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
	@Transactional
	public int insertStar(ReviewLikes reviewLikes) {
		return mapper.insertStar(reviewLikes);
	}

	@Override
	public ReviewLikes getStar(ReviewLikes reviewLikes) {
		return mapper.selectStar(reviewLikes);
	}

	@Override
	@Transactional
	public int insertLikes(ReviewLikes reviewLikes) {
		return mapper.insertLikes(reviewLikes);
	}

	@Override
	public int deleteLikes(ReviewLikes reviewLikes) {
		return mapper.deleteLikes(reviewLikes);
	}

	@Override
	@Transactional
	public ReviewLikes getLikes(ReviewLikes reviewLikes) {
		return mapper.selectLikes(reviewLikes);
	}

	@Override
	@Transactional
	public int updateTotalLikes(ReviewLikes reviewLikes) {
		return mapper.updateTotalLikes(reviewLikes);
	}

	@Override
	public Review getRTotalLikes(ReviewLikes reviewLikes) {
		return mapper.selectRTotalLikes(reviewLikes);
	}

	@Override
	public ReviewCmt getCTotalLikes(ReviewLikes reviewLikes) {
		return mapper.selectCTotalLikes(reviewLikes);
	}

}
