package com.project.ogg.review.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.ReviewLikes;

@Mapper
public interface ReviewLikesMapper {
	
	Film checkFilm(int fCode);
	
	int insertFilm(Film film);

	int insertStar(ReviewLikes reviewLikes);

	ReviewLikes selectStar(ReviewLikes reviewLikes);
}
