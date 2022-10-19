package com.project.ogg.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.io.ResolverUtil.IsA;
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
		
		int fcode = 0;
		int filmSave = 0;
		int insertStar = 0;
		Film filmCheck = null;
		Map<String, ReviewLikes> map = new HashMap<>(); 
		
		reviewLikes.setMNo(member.getM_no());
		fcode = Integer.parseInt(reviewLikes.getFCode());
		filmCheck = service.filmcheck(fcode);
		
		if(filmCheck == null) {
			filmSave = service.filmInsert(film);
			insertStar = service.insertStar(reviewLikes);
			map.put("star", service.getStar(reviewLikes));
		}else {
			insertStar = service.insertStar(reviewLikes);
			map.put("star", service.getStar(reviewLikes));
		}
		return map;
	}
	
	@PostMapping("/get_star")
	@ResponseBody
	public Map<String, ReviewLikes> getStar(
			@AuthenticationPrincipal Member member,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewLikes reviewLikes)  {
		
		int fcode = 0;
		int filmSave = 0;
		int insertStar = 0;
		Film filmCheck = null;
		Map<String, ReviewLikes> map = new HashMap<>(); 
		
		reviewLikes.setMNo(member.getM_no());
		fcode = Integer.parseInt(reviewLikes.getFCode());
		filmCheck = service.filmcheck(fcode);
		map.put("star", service.getStar(reviewLikes));

		return map;
	}
	
	@PostMapping("/get_likes")
	@ResponseBody
	public Map<String, ReviewLikes> getLikes(
			@AuthenticationPrincipal Member member,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewLikes reviewLikes)  {

		Map<String, ReviewLikes> map = new HashMap<>(); 
		
		reviewLikes.setMNo(member.getM_no());
		map.put("likes", service.getLikes(reviewLikes));
		
		System.out.println("조회" + map);
		
		return map;
	}
	
	@PostMapping("/insert_likes")
	@ResponseBody
	public Map<String, ReviewLikes> insertLikes(
			@AuthenticationPrincipal Member member,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewLikes reviewLikes,
			@ModelAttribute Film film)  {
		
		int fcode = 0;
		int insertFilm = 0;
		int insertLikes = 0;
		int updateTotalLikes = 0;
		Film filmCheck = null;
		Map<String, ReviewLikes> map = new HashMap<>(); 
		Review review = new Review();

		reviewLikes.setMNo(member.getM_no());
		fcode = Integer.parseInt(reviewLikes.getFCode());
		filmCheck = service.filmcheck(fcode);
		
		if(filmCheck == null) {
			insertFilm = service.filmInsert(film);
			insertLikes = service.insertLikes(reviewLikes);
			review = service.getRTotalLikes(reviewLikes);
			reviewLikes.setNum(review.getRvLikes()+1);
			updateTotalLikes = service.updateTotalLikes(reviewLikes);
			map.put("likes", service.getLikes(reviewLikes));
		}else {
			insertLikes = service.insertLikes(reviewLikes);
			review = service.getRTotalLikes(reviewLikes);
			reviewLikes.setNum(review.getRvLikes()+1);
			updateTotalLikes = service.updateTotalLikes(reviewLikes);
			map.put("likes", service.getLikes(reviewLikes));
		}
		
		System.out.println("좋아요" + map);
		
		return map;
	}
	
	
	@PostMapping("/delete_likes")
	@ResponseBody
	public Map<String, ReviewLikes> deleteLikes(
			@AuthenticationPrincipal Member member,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewLikes reviewLikes)  {
		
		int deleteLikes = 0;
		int updateTotalLikes = 0;
		Map<String, ReviewLikes> map = new HashMap<>(); 
		Review review = new Review();

		reviewLikes.setMNo(member.getM_no());
		
		deleteLikes = service.deleteLikes(reviewLikes);
		review = service.getRTotalLikes(reviewLikes);
		reviewLikes.setNum(review.getRvLikes()-1);
		updateTotalLikes = service.updateTotalLikes(reviewLikes);
		map.put("likes", service.getLikes(reviewLikes));	
		System.out.println("삭제" + map);
		
		return map;
	}
	
}
