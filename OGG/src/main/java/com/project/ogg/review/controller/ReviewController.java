package com.project.ogg.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.common.util.PageInfo;
import com.project.ogg.member.model.vo.Member;
import com.project.ogg.review.model.service.ReviewService;
import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@GetMapping("/film_list")
	public ModelAndView filmList(ModelAndView model) {
		model.setViewName("review/film_list");
		
		return model;
	}
	
	@GetMapping("/film_search")
	public ModelAndView filmSearch(ModelAndView model,
			@RequestParam("keyword") String keyword)  {
		
		if(keyword != null) {
			model.addObject("searchkeyword", keyword);
		}
		model.setViewName("review/film_search");
		
		return model;
	}
	
	@GetMapping("/dir_search")
	public ModelAndView dirSearch(ModelAndView model,
			@RequestParam("name") String name)  {
		
		if(name != null) {
			model.addObject("searchkeyword", name);
		}
		model.setViewName("review/dir_search");
		
		return model;
	}
	
	@GetMapping("/film_detail")
	public ModelAndView filmDetail(ModelAndView model,
			@AuthenticationPrincipal Member member,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam("fcode") String fcodes,
			@RequestParam("ftype") String ftype)  {
		
		List<Review> list = null;
		PageInfo pageInfo = null;
		int fcode = Integer.parseInt(fcodes);
		
		pageInfo = new PageInfo(page, 10, service.getBoardCount(fcode), 10);
		list = service.getBoardListByFilm(pageInfo, fcode);
		
		model.addObject("list", list); 
		model.addObject("fcode", fcode);
		model.addObject("ftype", ftype);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("review/film_detail");
		
		return model;
	}
	
	@GetMapping("/review_list")
	public ModelAndView reviewList(ModelAndView model,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam("fcode") String fcodes,
			@RequestParam("ftype") String ftype) {
		
		List<Review> list = null;
		PageInfo pageInfo = null;
		int fcode = Integer.parseInt(fcodes);
		
		pageInfo = new PageInfo(page, 10, service.getBoardCount(fcode), 10);
		list = service.getBoardListByFilm(pageInfo, fcode);
		
		model.addObject("list", list);
		model.addObject("fcode", fcode);
		model.addObject("ftype", ftype);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("review/review_list");
		
		return model;
	}
	
	@GetMapping("/review_detail")
	public ModelAndView reviewDetail(ModelAndView model,
			@AuthenticationPrincipal Member member,
			@RequestParam("fcode") String fcode,
			@RequestParam("ftype") String ftype,
			@RequestParam int no) {
		Review review = null;
		List<ReviewCmt> reviewCmt = null;
		int cmtCount = 0;
		review = service.findReviewByNo(no);
		reviewCmt = service.findReviewCmtByNo(no);
		cmtCount = service.getCmtCountByNo(no);
//		cmtReview = service.updateCmtCount(no);
		
		model.addObject("fcode", fcode);
		model.addObject("ftype", ftype);
		model.addObject("member", member);
		model.addObject("review", review);
		model.addObject("cmtCount", cmtCount);
		model.addObject("reviewCmt", reviewCmt);
		model.setViewName("review/review_detail");
		
		return model;
	}
	
	@PostMapping("/review_write")
	public ModelAndView reviewWrite(ModelAndView model,
			@AuthenticationPrincipal Member member,
			@RequestParam("ftype") String ftype,
			@ModelAttribute Review review,
			@ModelAttribute Film film) {

		Film checkFilm = null;
		int insertFilm = 0;
		int writeReview = 0;
		review.setRvWriterNo(member.getM_no());
		int fcode = Integer.parseInt(review.getFCode());
		
		System.out.println("리셋");
		System.out.println(review);
		System.out.println(film);

		checkFilm = service.filmcheck(fcode);
		
		if(checkFilm == null) {
			insertFilm = service.filmSave(film);
			
			if(insertFilm > 0) {
				writeReview = service.reviewSave(review);
				
				if(writeReview > 0) {
					System.out.println("리뷰까지 성공");
		//			model.addObject("msg", "리뷰가 정상적으로 등록되었습니다.");
		//			model.addObject("location", "/review/review_detail?no=" + review.getRvNo() + "&fcode=" + fcode +  "&ftype=" + ftype );
				} else {
					System.out.println("리뷰 실패");
		//			model.addObject("msg", "리뷰 등록을 실패하였습니다.");
		//			model.addObject("location", "/review/film_detail?fcode=" + fcode + "&ftype=" + ftype );
				}
			} else {
				System.out.println("필름 인서트 실패");
			}
		} else {
			writeReview = service.reviewSave(review);
			if(writeReview > 0) {
				System.out.println("존재하는 필름 리뷰 성공");
			} else {
				System.out.println("존재하는 필름 리뷰 실패");
			}
		}
		model.setViewName("/review/film_detail?fcode=" + fcode + "&ftype=" + ftype);
		
		return model;
	}
	
	@PostMapping("/review_cmt_write")
	@ResponseBody
	public Map<String, Boolean> cmtWrite(@RequestParam String userId) {
		
		Map<String, Boolean> map = new HashMap<>();
		
//		map.put("duplicate", service.isDulicateID(userId));
		
		return map;
	}
	
}
