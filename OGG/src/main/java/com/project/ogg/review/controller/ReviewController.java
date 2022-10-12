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
			@RequestParam(value = "page", defaultValue = "1") int page,
			@AuthenticationPrincipal Member member,
			@RequestParam("fcode") String fcodes,
			@RequestParam("ftype") String ftype)  {
		
		List<Review> list = null;
		PageInfo pageInfo = null;
		int fcode = Integer.parseInt(fcodes);
		
		pageInfo = new PageInfo(page, 10, service.getReviewCount(fcode), 10);
		list = service.getBoardListByFilm(pageInfo, fcode);
		
		model.addObject("list", list); 
		model.addObject("fcode", fcode);
		model.addObject("ftype", ftype);
		model.addObject("pageInfo", pageInfo);
		model.addObject("loginMember", member);
		model.setViewName("review/film_detail");
		
		return model;
	}
	
	@GetMapping("/review_list")
	public ModelAndView reviewList(ModelAndView model,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@AuthenticationPrincipal Member member,
			@RequestParam("fcode") String fcodes,
			@RequestParam("ftype") String ftype) {
		
		List<Review> list = null;
		PageInfo pageInfo = null;
		int fcode = Integer.parseInt(fcodes);
		
		pageInfo = new PageInfo(page, 10, service.getReviewCount(fcode), 10);
		list = service.getBoardListByFilm(pageInfo, fcode);
		
		model.addObject("list", list);
		model.addObject("fcode", fcode);
		model.addObject("ftype", ftype);
		model.addObject("pageInfo", pageInfo);
		model.addObject("loginMember", member);
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
		review = service.getReviewByNo(no);
		reviewCmt = service.getCmtByReviewNo(no);
		cmtCount = service.getCmtCountByNo(no);
		
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

		Film filmCheck = null;
		int filmSave = 0;
		int reviewWrite = 0;
		review.setRvWriterNo(member.getM_no());
		int fcode = Integer.parseInt(review.getFCode());
		
		filmCheck = service.filmcheck(fcode);
		
		if(filmCheck == null) {
			filmSave = service.filmSave(film);
			
			if(filmSave > 0) {
				reviewWrite = service.reviewSave(review);
				System.out.println("필름 인서트 성공");
				
				if(reviewWrite > 0) {
					System.out.println("리뷰 성공");
				} else {
					System.out.println("리뷰 실패");
				}
			} else {
				System.out.println("필름 인서트 실패");
			}
		} else {
			reviewWrite = service.reviewSave(review);
			if(reviewWrite > 0) {
				System.out.println("리뷰 성공");
			} else {
				System.out.println("리뷰 실패");
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
		review.setRvWriterNo(member.getM_no());
		int fcode = Integer.parseInt(review.getFCode());

		reviewUpdate = service.reviewUpdate(review);
		
		if(reviewUpdate > 0) {
			System.out.println("리뷰 수정 성공");
		}else {
			System.out.println("리뷰 수정 실패");
		}
		
		model.setViewName("review/review_list");

		return model;
	}
	
	@PostMapping("/review_delete")
	public ModelAndView reviewDelete(ModelAndView model,
			@AuthenticationPrincipal Member member,
			@RequestParam("fCode") String fCode,
			@RequestParam("ftype") String ftype,
			@ModelAttribute Review review) {
		
		int reviewDelete = 0;
		review.setRvWriterNo(member.getM_no());
		int fcode = Integer.parseInt(review.getFCode());
		
		reviewDelete = service.reviewDelete(review);
		
		if(reviewDelete > 0) {
			System.out.println("리뷰 삭제 성공");
		}else {
			System.out.println("리뷰 삭제 실패");
		}
		
		model.setViewName("review/review_list");
		
		return model;
	}
	
	@PostMapping("/cmt_write")
	@ResponseBody
	public Map<String, ReviewCmt> cmtWrite(
			@AuthenticationPrincipal Member member,
			@RequestParam("fCode") String fCode,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewCmt cmt) {
		
		int cmtWrite = 0;
		cmt.setCmtWriterNo(member.getM_no());
		int fcode = Integer.parseInt(fCode);
		Map<String, ReviewCmt> map = new HashMap<>(); 
		
		cmtWrite = service.cmtWrite(cmt);
		
		if(cmtWrite > 0) {
			System.out.println("댓글 등록 성공");
			map.put("cmt", service.getCmtByCmtNo(cmt.getCmtNo()));
		
		}else {
			System.out.println("댓글 등록 실패");
		}
		
		return map;
	}
	
	@PostMapping("/cmt_update")
	public ModelAndView cmtUpdate(ModelAndView model,
			@AuthenticationPrincipal Member member,
			@RequestParam("fCode") String fCode,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewCmt cmt) {
		
		int cmtUpdate = 0;
		cmt.setCmtWriterNo(member.getM_no());
		int fcode = Integer.parseInt(fCode);
		
		cmtUpdate = service.cmtUpdate(cmt);
		
		if(cmtUpdate > 0) {
			System.out.println("댓글 수정 성공");
		}else {
			System.out.println("댓글 수정 실패");
		}
		
		model.setViewName("review/review_list");
		
		return model;
	}
	
	@PostMapping("/cmt_delete")
	public ModelAndView cmtDelete(ModelAndView model,
			@AuthenticationPrincipal Member member,
			@RequestParam("fCode") String fCode,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewCmt cmt) {
		
		int cmtDelete = 0;
		cmt.setCmtWriterNo(member.getM_no());
		int fcode = Integer.parseInt(fCode);
		
		cmtDelete = service.cmtDelete(cmt);
		
		if(cmtDelete > 0) {
			System.out.println("댓글 삭제 성공");
		}else {
			System.out.println("댓글 삭제 실패");
		}
		
		model.setViewName("review/review_list");
		
		return model;
	}
	
}
