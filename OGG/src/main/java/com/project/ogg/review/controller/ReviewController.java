package com.project.ogg.review.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.member.model.vo.Member;
import com.project.ogg.review.model.service.ReviewService;
import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;
import com.project.ogg.review.model.vo.ReviewLikes;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@GetMapping("/review_detail")
	public ModelAndView reviewDetail(ModelAndView model,
			@AuthenticationPrincipal Member member,
			@RequestParam("fcode") String fcode,
			@RequestParam("ftype") String ftype,
			@RequestParam int no) {
		
		int cmtCount = 0;
		Review review = new Review();
		List<ReviewCmt> reviewCmt = new ArrayList<ReviewCmt>();
		
		review = service.getReviewByNo(no);
		cmtCount = service.getCmtCountByNo(no);
		reviewCmt = service.getCmtByReviewNo(no);
		
		System.out.println(review);
		System.out.println(cmtCount);
		System.out.println(reviewCmt);
		
		model.addObject("fcode", fcode);
		model.addObject("ftype", ftype);
		model.addObject("review", review);
		model.addObject("cmtCount", cmtCount);
		model.addObject("reviewCmt", reviewCmt);
		model.addObject("loginMember", member);
		model.setViewName("review/review_detail");
		
		return model;
	}
	
	@PostMapping("/review_write")
	public ModelAndView reviewWrite(ModelAndView model,
			@AuthenticationPrincipal Member member,
			@RequestParam("ftype") String ftype,
			@ModelAttribute Review review,
			@ModelAttribute Film film) {

		int fcode = 0;
		int insertFilm = 0;
		int reviewWrite = 0;
		Film filmCheck = null;
		if(member != null) {

			review.setRvWriterNo(member.getM_no());
			fcode = Integer.parseInt(review.getFCode());
			filmCheck = service.filmcheck(fcode);
			
			if(filmCheck == null) {
				insertFilm = service.filmInsert(film);
				
				if(insertFilm > 0) {
					reviewWrite = service.reviewWrite(review);
				} 
			} else {
				reviewWrite = service.reviewWrite(review);
			}
		}
		model.addObject("loginMember", member);
		model.setViewName("review/film_detail");
		
		return model;
	}
	
	@PostMapping("/review_update")
	public ModelAndView reviewUpdate(ModelAndView model,
			@AuthenticationPrincipal Member member,
			@RequestParam("fCode") String fCode,
			@RequestParam("ftype") String ftype,
			@ModelAttribute Review review) {
		
		int reviewUpdate = 0;
		if(member != null) {

			review.setRvWriterNo(member.getM_no());
			reviewUpdate = service.reviewUpdate(review);
			
			if(reviewUpdate > 0) {
				System.out.println("리뷰 수정 성공");
			}else {
				System.out.println("리뷰 수정 실패");
			}
		}
		model.setViewName("review/review_list");

		return model;
	}
	
}
