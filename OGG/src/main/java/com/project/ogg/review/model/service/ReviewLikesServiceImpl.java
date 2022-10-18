package com.project.ogg.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.ogg.review.model.mapper.ReviewLikesMapper;
import com.project.ogg.review.model.vo.Film;
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
	public int insertStar(ReviewLikes reviewLikes) {
		
		return mapper.insertStar(reviewLikes);
	}

	@Override
	public ReviewLikes getStar(ReviewLikes reviewLikes) {
		
		return mapper.selectStar(reviewLikes);
	}
}
