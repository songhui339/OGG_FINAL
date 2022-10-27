package com.project.ogg.review.model.service;

import java.util.List;

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
	public ReviewLikes getLikes(ReviewLikes reviewLikes) {
		String type = reviewLikes.getLType();
		
		if(type.equals("REVIEW")) {
			return mapper.selectReviewLikes(reviewLikes);
			
		}else if (type.equals("CMT")) {
			return mapper.selectCmtLikes(reviewLikes);
			
		}else {
			return mapper.selectFilmLikes(reviewLikes);
		}
	}

	@Override
	@Transactional
	public ReviewLikes setLikes(ReviewLikes reviewLikes, String type) {
		int insertLikes = 0;
		int deleteLikes = 0;
//		Review review = new Review();
//		ReviewCmt cmt = new ReviewCmt();
		
		if (type.equals("INSERT")) {
			insertLikes = insertLikes(reviewLikes);
			
		}else if (type.equals("DELETE")) {
			deleteLikes = deleteLikes(reviewLikes);
		}
		
		return reviewLikes;
	}
	
	@Override
	public ReviewLikes setTotalLikes(ReviewLikes reviewLikes, String type) {
		int insertLikes = 0;
		int deleteLikes = 0;
		Review review = new Review();
		ReviewCmt cmt = new ReviewCmt();
		
		if (type.equals("INSERT")) {
			insertLikes = insertLikes(reviewLikes);
			
			if(insertLikes > 0 && reviewLikes.getLType().equals("REVIEW")) {
				review = this.getRTotalLikes(reviewLikes);
				reviewLikes.setNum(review.getRvLikes()+1);
				
			}else if(insertLikes > 0 && reviewLikes.getLType().equals("CMT")) {
				cmt = this.getCTotalLikes(reviewLikes);
				reviewLikes.setNum(cmt.getCmtLikes()+1);
			}
		}else if(type.equals("DELETE")) {
			deleteLikes = deleteLikes(reviewLikes);
			
			if(deleteLikes > 0 && reviewLikes.getLType().equals("REVIEW") ) {
				review = this.getRTotalLikes(reviewLikes);
				reviewLikes.setNum(review.getRvLikes()-1);
				
			}else if(deleteLikes > 0 && reviewLikes.getLType().equals("CMT")) {
				cmt = this.getCTotalLikes(reviewLikes);
				reviewLikes.setNum(cmt.getCmtLikes()-1);
			}
		}
		
		return reviewLikes;
	}

	@Override
	@Transactional
	public int updateTotalLikes(ReviewLikes reviewLikes, String type) {
		int result = 0;
		
		this.setTotalLikes(reviewLikes, type);
		result = mapper.updateTotalLikes(reviewLikes);
		
		return result;
	}

	@Override
	public Review getRTotalLikes(ReviewLikes reviewLikes) {
		return mapper.selectRTotalLikes(reviewLikes);
	}

	@Override
	public ReviewCmt getCTotalLikes(ReviewLikes reviewLikes) {
		return mapper.selectCTotalLikes(reviewLikes);
	}

	@Override
	public List<ReviewLikes> getStarRates(int fcode) {
		return mapper.selectStarbyFilm(fcode);
	}


}
