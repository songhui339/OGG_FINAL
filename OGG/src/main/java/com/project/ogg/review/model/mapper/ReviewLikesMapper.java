package com.project.ogg.review.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;
import com.project.ogg.review.model.vo.ReviewLikes;

@Mapper
public interface ReviewLikesMapper {
	
	Film checkFilm(int fCode);
	
	int insertFilm(Film film);

	int insertStar(ReviewLikes reviewLikes);

	ReviewLikes selectStar(ReviewLikes reviewLikes);

	int insertLikes(ReviewLikes reviewLikes);

	int deleteLikes(ReviewLikes reviewLikes);

	ReviewLikes selectLikes(ReviewLikes reviewLikes);

	int updateTotalLikes(ReviewLikes reviewLikes);

	Review selectRTotalLikes(ReviewLikes reviewLikes);

	ReviewCmt selectCTotalLikes(ReviewLikes reviewLikes);
}
