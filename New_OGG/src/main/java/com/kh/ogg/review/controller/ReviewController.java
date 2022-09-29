package com.kh.ogg.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ogg.common.util.PageInfo;
import com.kh.ogg.review.model.service.FilmService;
import com.kh.ogg.review.model.service.ReviewService;
import com.kh.ogg.review.model.vo.Review;
import com.kh.ogg.review.model.vo.ReviewCmt;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@Autowired
	private FilmService filmService;
	
//	@GetMapping("/film_list")
//	public ModelAndView filmList(ModelAndView model) {
//		List<Kofic> kofic = filmService.getBoxOffice();
//		
//		System.out.println(kofic);
//		
//		List<Film> list = new ArrayList<>();
//		for(Kofic kf : kofic) {
//			Film film = filmService.getMovieDetail(kf.getMovieNm(), 0);
//			
//			list.add(film);
//		}
//		
//		System.out.println(list);
//		
//		model.addObject("kofic", kofic);
//		model.addObject("list", list);
//		model.setViewName("review/film_list");
//		
//		return model;
//	}
	
	@GetMapping("/film_list")
	public ModelAndView filmList(ModelAndView model) {
		model.setViewName("review/film_list");
		return model;
	}
	
//	@GetMapping("/film_search")
//	public ModelAndView filmSearch(ModelAndView model, 
//			@RequestParam(required = false) String keyword,
//			@RequestParam(value = "page", defaultValue = "1") int page)  {
//
//		List<Film> list = null;
//		page = (page - 1) * 10 + 1;
//		
//		System.out.println(keyword);
//
//		if(keyword != null) {
//			list = filmService.searchFilm(keyword, 8, page);
//			model.addObject("list", list);
//		}
//		
//		System.out.println(list);
//	
//		model.setViewName("review/film_search");
//		
//		return model;
//	}
	
	@GetMapping("/film_search")
	public ModelAndView filmSearch(ModelAndView model,
			@RequestParam("keyword") String keyword)  {
		
		System.out.println(keyword);
	
		if(keyword != null) {
			
			model.addObject("searchkeyword", keyword);
		}
		model.setViewName("review/film_search");
		
		return model;
	}
	
//	@GetMapping("/film_detail")
//	public ModelAndView filmDetail(ModelAndView model,
//			@RequestParam("keyword") String keyword, 
//			@RequestParam("year") String year) {
//		
//		if (keyword != null) {
//			if (year.trim().isEmpty()) {
//				year = "0";
//			}
//			Film film = filmService.getMovieDetail(keyword, Integer.parseInt(year));
//			model.addObject("film", film);
//		}
//		
//		model.setViewName("review/film_detail");
//		
//		return model;
//	}
	
	@GetMapping("/film_detail")
	public ModelAndView filmDetail(ModelAndView model,
			@RequestParam("fcode") String fcode,
			@RequestParam("ftype") String ftype)  {
		
		System.out.println(fcode);
		System.out.println(ftype);

		if(fcode != null && ftype != null) {
			
			model.addObject("fcode", fcode);
			model.addObject("ftype", ftype);
		}
		model.setViewName("review/film_detail");
		
		return model;
	}
	
	@GetMapping("/review_list")
	public ModelAndView reviewList(ModelAndView model,
			@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Review> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getBoardCount(), 10);
		list = service.getBoardList(pageInfo);
		
		System.out.println(list);
		
		model.addObject("list", list); // 게시글 표시
		model.addObject("pageInfo", pageInfo);
		model.setViewName("review/review_list");
		
		return model;
	}
	
	@GetMapping("/review_detail")
	public ModelAndView reviewDetail(ModelAndView model, @RequestParam int no) {
		Review review = null;
		List<ReviewCmt> reviewCmt = null;
		review = service.findReviewByNo(no);
		reviewCmt = service.findReviewCmtByNo(no);
		
		System.out.println(review);
		System.out.println(reviewCmt);
		
		model.addObject("review", review);
		model.addObject("reviewCmt", reviewCmt);
		model.setViewName("review/review_detail");
		
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
