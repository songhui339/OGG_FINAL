package com.project.ogg.review.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.common.util.PageInfo;
import com.project.ogg.member.model.vo.Member;
import com.project.ogg.review.model.service.FilmService;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewLikes;

@Controller
@RequestMapping("/film")
public class FilmController {
	
	@Autowired
	private FilmService service;
	
	@GetMapping("/list")
	public String filmList() {
		
		return "review/film_list";
	}

	@PostMapping("/list")
	@ResponseBody
	public List<ReviewLikes> filmList(@AuthenticationPrincipal Member member) {
		
		int no = 0;
		List<ReviewLikes> list = new ArrayList<ReviewLikes>();

		if(member != null) {
			no = member.getM_no();
			list = service.getFilmLikes(no);
		}else {
			list = service.getFilmLikes(no);
		}
		
		System.out.println(member);
		System.out.println(list);

		return list;
	}
	
	@GetMapping("/search")
	public ModelAndView filmSearch(ModelAndView model,
			@RequestParam("keyword") String keyword)  {
		
		if(keyword != null) {
			model.addObject("searchkeyword", keyword);
		}
		model.setViewName("review/film_search");
		
		return model;
	}
	
	@RequestMapping(value = {"/detail", "/review_list"})
	public String filmDetail(ModelMap model,
			HttpServletRequest request,
			@RequestParam(value = "page", defaultValue = "1") int page,
			@AuthenticationPrincipal Member member,
			@RequestParam("fcode") String fcodes,
			@RequestParam("ftype") String ftype)  {
		
	    String requestUrl = null;
		List<Review> list = new ArrayList<Review>();
		PageInfo pageInfo = null;
		int fcode = 0;
		Review review = new Review();
		
		fcode = Integer.parseInt(fcodes);
		requestUrl = (String)request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		pageInfo = new PageInfo(page, 10, service.getReviewCount(fcode), 10);
		list = service.getReviewListByFilm(pageInfo, fcode);
		
		if(member != null) {
			review.setFCode(fcodes);
			review.setRvWriterNo(member.getM_no());
			review = service.getReviewByMember(review);
		}
		
		System.out.println(review);
		
		model.addAttribute("list", list); 
		model.addAttribute("fcode", fcode);
		model.addAttribute("ftype", ftype);
		model.addAttribute("review", review);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("loginMember", member);
		
		if(requestUrl.contains("detail")) {
			return "review/film_detail";
		}else {
			return "review/review_list";
		}
	}
	
}
