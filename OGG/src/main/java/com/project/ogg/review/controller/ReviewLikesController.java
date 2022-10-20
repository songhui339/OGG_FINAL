package com.project.ogg.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.ogg.member.model.vo.Member;
import com.project.ogg.review.model.service.ReviewLikesService;
import com.project.ogg.review.model.vo.Film;
import com.project.ogg.review.model.vo.Review;
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
		Film filmCheck = null;
		Map<String, ReviewLikes> map = new HashMap<>(); 
		
		reviewLikes.setMNo(member.getM_no());
		fcode = Integer.parseInt(reviewLikes.getFCode());
		filmCheck = service.filmcheck(fcode);
		map.put("star", service.getStar(reviewLikes));

		return map;
	}
	
	@PostMapping("/get_starrates")
	@ResponseBody
	public List<ReviewLikes> getStarRates(
			@RequestParam("fCode") String fCode,
			@RequestParam("ftype") String ftype)  {
		
		int fcode = 0;
		List<ReviewLikes> list = new ArrayList<ReviewLikes>();
		
		fcode = Integer.parseInt(fCode);
		list = service.getStarRates(fcode);
		
		System.out.println("레이츠 : " + list);
		
		return list;
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
		
//		System.out.println("조회" + map);
		
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
		Film filmCheck = null;
		Map<String, ReviewLikes> map = new HashMap<>(); 
		Review review = new Review();

		reviewLikes.setMNo(member.getM_no());
		fcode = Integer.parseInt(reviewLikes.getFCode());
		filmCheck = service.filmcheck(fcode);
		
		if(filmCheck == null) {
			insertFilm = service.filmInsert(film);
			insertLikes = service.updateTotalLikes(reviewLikes, "INSERT");
			if(insertLikes > 0) {
				map.put("likes", service.getLikes(reviewLikes));
			}
		}else {
			insertLikes = service.updateTotalLikes(reviewLikes, "INSERT");
			if(insertLikes > 0) {
				map.put("likes", service.getLikes(reviewLikes));
			}
		}
		
		return map;
	}
	
	
	@PostMapping("/delete_likes")
	@ResponseBody
	public Map<String, ReviewLikes> deleteLikes(
			@AuthenticationPrincipal Member member,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewLikes reviewLikes)  {
		
		int deleteLikes = 0;
		Map<String, ReviewLikes> map = new HashMap<>(); 
		Review review = new Review();

		reviewLikes.setMNo(member.getM_no());
		deleteLikes = service.updateTotalLikes(reviewLikes, "DELETE");
		
		if(deleteLikes > 0) {
			map.put("likes", service.getLikes(reviewLikes));
		}
		
		return map;
	}

	@PostMapping("/get_filmlikes")
	@ResponseBody
	public Map<String, ReviewLikes> getFilmLikes(
			@AuthenticationPrincipal Member member,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewLikes reviewLikes)  {

		Map<String, ReviewLikes> map = new HashMap<>(); 
		
		reviewLikes.setMNo(member.getM_no());
		map.put("likeFilm", service.getLikes(reviewLikes));
		
//		System.out.println("조회" + map);
		
		return map;
	}
	
	@PostMapping("/like_film")
	@ResponseBody
	public Map<String, ReviewLikes> likeFilm(
			@AuthenticationPrincipal Member member,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewLikes reviewLikes,
			@ModelAttribute Film film)  {
		
		int fcode = 0;
		int insertFilm = 0;
		int insertLikes = 0;
		Film filmCheck = null;
		Map<String, ReviewLikes> map = new HashMap<>(); 
		Review review = new Review();

		reviewLikes.setMNo(member.getM_no());
		fcode = Integer.parseInt(reviewLikes.getFCode());
		filmCheck = service.filmcheck(fcode);
		
		if(filmCheck == null) {
			insertFilm = service.filmInsert(film);
			service.setTotalLikes(reviewLikes, "INSERT");
			map.put("likeFilm", service.getLikes(reviewLikes));
		}else {
			service.setTotalLikes(reviewLikes, "INSERT");
			map.put("likeFilm", service.getLikes(reviewLikes));
		}
		
		return map;
	}

	
	@PostMapping("/dislike_film")
	@ResponseBody
	public Map<String, ReviewLikes> disLikeFilm(
			@AuthenticationPrincipal Member member,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewLikes reviewLikes)  {
		
		int deleteLikes = 0;
		Map<String, ReviewLikes> map = new HashMap<>(); 
		Review review = new Review();

		reviewLikes.setMNo(member.getM_no());
		service.setTotalLikes(reviewLikes, "DELETE");
		map.put("likeFilm", service.getLikes(reviewLikes));
		
		return map;
	}
}
