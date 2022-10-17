package com.project.ogg.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.common.util.PageInfo;
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
	
	@GetMapping("/film_list")
	public String filmList() {
		
		return "review/film_list";
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
	
	@PostMapping("/insert_star")
	@ResponseBody
	public Map<String, ReviewLikes> insertStar(
			@AuthenticationPrincipal Member member,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewLikes reviewLikes,
			@ModelAttribute Film film)  {
		
		int mNo = 0;
		int fcode = 0;
		int filmSave = 0;
		int insertStar = 0;
		Film filmCheck = null;
		Map<String, ReviewLikes> map = new HashMap<>(); 
		
		mNo = member.getM_no();
		reviewLikes.setMNo(mNo);
		fcode = Integer.parseInt(reviewLikes.getFCode());
		filmCheck = service.filmcheck(fcode);
		
		if(filmCheck == null) {
			filmSave = service.filmInsert(film);
			
			if(filmSave > 0) {
				System.out.println("필름 인서트 성공");
				insertStar = service.insertStar(reviewLikes);
				
				if(insertStar > 0) {
					map.put("star", service.getStar(reviewLikes));
					System.out.println("별점 성공");
				} else {
					System.out.println("별점 실패");
				}
			} else {
				System.out.println("필름 인서트 실패");
			}
		}else {
			insertStar = service.insertStar(reviewLikes);
			if(insertStar > 0) {
				map.put("star", service.getStar(reviewLikes));
				System.out.println(map);
				System.out.println("별점 성공");
			} else {
				System.out.println("별점 실패");
			}
		}
		return map;
	}
	
	@PostMapping("/get_star")
	@ResponseBody
	public Map<String, ReviewLikes> getStar(
			@AuthenticationPrincipal Member member,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewLikes reviewLikes)  {
		
		int mNo = 0;
		int fcode = 0;
		Map<String, ReviewLikes> map = new HashMap<>(); 
		
		mNo = member.getM_no();
		reviewLikes.setMNo(mNo);
		fcode = Integer.parseInt(reviewLikes.getFCode());
		System.out.println(reviewLikes);

		map.put("star", service.getStar(reviewLikes));
		System.out.println(map);
		
		return map;
	}
	
	@RequestMapping(value = {"/film_detail", "/review_list"})
	public String filmDetail(ModelMap model,
			HttpServletRequest request,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@AuthenticationPrincipal Member member,
			@RequestParam("fcode") String fcodes,
			@RequestParam("ftype") String ftype)  {
		
	    String requestUrl = null;
		List<Review> list = null;
		PageInfo pageInfo = null;
		int fcode = 0;
		
		fcode = Integer.parseInt(fcodes);
		requestUrl = (String)request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		pageInfo = new PageInfo(page, 10, service.getReviewCount(fcode), 10);
		list = service.getReviewListByFilm(pageInfo, fcode);
		
		model.addAttribute("list", list); 
		model.addAttribute("fcode", fcode);
		model.addAttribute("ftype", ftype);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("loginMember", member);
		
		if(requestUrl.contains("film_detail")) {
			return "review/film_detail";
		}else {
			return "review/review_list";
		}
	}
	
	@GetMapping("/review_detail")
	public ModelAndView reviewDetail(ModelAndView model,
			@AuthenticationPrincipal Member member,
			@RequestParam("fcode") String fcode,
			@RequestParam("ftype") String ftype,
			@RequestParam int no) {
		
		int cmtCount = 0;
		Review review = null;
		List<ReviewCmt> reviewCmt = null;
		
		review = service.getReviewByNo(no);
		cmtCount = service.getCmtCountByNo(no);
		reviewCmt = service.getCmtByReviewNo(no);
		
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

		review.setRvWriterNo(member.getM_no());
		fcode = Integer.parseInt(review.getFCode());
		filmCheck = service.filmcheck(fcode);
		
		if(filmCheck == null) {
			insertFilm = service.filmInsert(film);
			
			if(insertFilm > 0) {
				System.out.println("필름 인서트 성공");
				reviewWrite = service.reviewWrite(review);
				
				if(reviewWrite > 0) {
					System.out.println("리뷰 성공");
				} else {
					System.out.println("리뷰 실패");
				}
			} else {
				System.out.println("필름 인서트 실패");
			}
		} else {
			reviewWrite = service.reviewWrite(review);
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
		reviewUpdate = service.reviewUpdate(review);
		
		if(reviewUpdate > 0) {
			System.out.println("리뷰 수정 성공");
		}else {
			System.out.println("리뷰 수정 실패");
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
		
		int mNo = 0;
		int rvNo = 0; 
		int cmtNo = 0; 
		int cmtWrite = 0;
		int reviewCountUpdate = 0;
		Map<String, ReviewCmt> map = new HashMap<>(); 
		
		mNo = member.getM_no();
		cmt.setCmtWriterNo(mNo);
		rvNo = cmt.getRvNo();
		cmtWrite = service.cmtWrite(cmt);
		cmtNo = cmt.getCmtNo();

		if(cmtWrite > 0) {
			reviewCountUpdate = service.updateCmtCount(rvNo);
			if(reviewCountUpdate > 0) {
				map.put("cmt", service.getCmtByCmtNo(cmtNo));
				System.out.println("댓글 등록 성공");
			}
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
		
		int rvNo = 0; 
		int cmtUpdate = 0;
		int reviewCountUpdate = 0;
		
		cmt.setCmtWriterNo(member.getM_no());
		cmtUpdate = service.cmtUpdate(cmt);
		rvNo = cmt.getRvNo();
		
		if(cmtUpdate > 0) {
			reviewCountUpdate = service.updateCmtCount(rvNo);
			if(reviewCountUpdate > 0) {
				model.addObject("msg", "댓글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/");
			}
		}else {
				model.addObject("msg", "댓글 수정에 실패하였습니다.");
				model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
}
