package com.project.ogg.review.model.mapper;

import java.util.List;

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

	int updateTotalLikes(ReviewLikes reviewLikes);

	Review selectRTotalLikes(ReviewLikes reviewLikes);

	ReviewCmt selectCTotalLikes(ReviewLikes reviewLikes);

	ReviewLikes selectReviewLikes(ReviewLikes reviewLikes);

	ReviewLikes selectCmtLikes(ReviewLikes reviewLikes);

	ReviewLikes selectFilmLikes(ReviewLikes reviewLikes);

	List<ReviewLikes> selectStarbyFilm(int fcode);
}
