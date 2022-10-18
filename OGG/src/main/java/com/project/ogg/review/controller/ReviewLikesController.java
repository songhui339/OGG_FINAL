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
import com.project.ogg.review.model.service.ReviewLikesService;
import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
import com.project.ogg.review.model.vo.ReviewCmt;
import com.project.ogg.review.model.vo.ReviewLikes;

@Controller
@RequestMapping("/review")
public class ReviewLikesController {
	
	@Autowired
	private ReviewLikesService service;
	
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
		int filmSave = 0;
		int insertStar = 0;
		Film filmCheck = null;
		Map<String, ReviewLikes> map = new HashMap<>(); 
		
		mNo = member.getM_no();
		reviewLikes.setMNo(mNo);
		fcode = Integer.parseInt(reviewLikes.getFCode());
		filmCheck = service.filmcheck(fcode);
		map.put("star", service.getStar(reviewLikes));

		return map;
	}
	
//	@PostMapping("/insert_likes")
//	@ResponseBody
//	public Map<String, ReviewLikes> insertLikes(
//			@AuthenticationPrincipal Member member,
//			@RequestParam("ftype") String ftype,
//			@ModelAttribute ReviewLikes reviewLikes)  {
//		
//		int mNo = 0;
//		int fcode = 0;
//		Map<String, ReviewLikes> map = new HashMap<>(); 
//		
//		mNo = member.getM_no();
//		reviewLikes.setMNo(mNo);
//		fcode = Integer.parseInt(reviewLikes.getFCode());
//		System.out.println(reviewLikes);
//		
//		map.put("star", service.getStar(reviewLikes));
//		System.out.println(map);
//		
//		return map;
//	}
	
}
