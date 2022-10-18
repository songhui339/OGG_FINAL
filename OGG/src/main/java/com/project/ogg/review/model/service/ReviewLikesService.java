package com.project.ogg.review.model.service;

import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.ReviewLikes;


public interface ReviewLikesService {

	Film filmcheck(int fcode);
	
	int filmInsert(Film film);

	int insertStar(ReviewLikes reviewLikes);

	ReviewLikes getStar(ReviewLikes reviewLikes);
}
