package com.project.ogg.review.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewLikes;

@Mapper
public interface FilmMapper {
	
	List<Review> selectReviewAll(RowBounds rowBounds);
	
	List<Review> selectReviewByFilm(RowBounds rowBounds, int fcode);

	int selectReviewCount(int fcode);

	int selectCmtCount(int no);

	List<ReviewLikes> selectFilmLikes(int no);

	Review selectReviewByMember(Review review);
}
