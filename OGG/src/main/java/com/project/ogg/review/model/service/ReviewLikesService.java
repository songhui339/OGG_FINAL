package com.project.ogg.review.model.service;

import java.util.List;

import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;
import com.project.ogg.review.model.vo.ReviewLikes;


public interface ReviewLikesService {

	Film filmcheck(int fcode);
	
	int filmInsert(Film film);

	int insertStar(ReviewLikes reviewLikes);
	
	ReviewLikes getStar(ReviewLikes reviewLikes);

	int insertLikes(ReviewLikes reviewLikes);

	int deleteLikes(ReviewLikes reviewLikes);

	ReviewLikes getLikes(ReviewLikes reviewLikes);

	Review getRTotalLikes(ReviewLikes reviewLikes);

	ReviewCmt getCTotalLikes(ReviewLikes reviewLikes);

	ReviewLikes setTotalLikes(ReviewLikes reviewLikes, String type);
	
	int updateTotalLikes(ReviewLikes reviewLikes, String type);

	ReviewLikes setLikes(ReviewLikes reviewLikes, String type);

	List<ReviewLikes> getStarRates(int fcode);

}
