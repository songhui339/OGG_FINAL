package com.project.ogg.review.model.service;

import java.util.List;

import com.project.ogg.common.util.PageInfo;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewLikes;


public interface FilmService {

	List<Review> getReviewListAll(PageInfo pageInfo);
	
	List<Review> getReviewListByFilm(PageInfo pageInfo, int fcode);
	
	int getReviewCount(int fcode);

	int getCmtCountByNo(int no);

	List<ReviewLikes> getFilmLikes(int no);

	Review getReviewByMember(Review review);

}
