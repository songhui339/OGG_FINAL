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
import org.springframework.web.servlet.ModelAndView;

import com.project.ogg.member.model.vo.Member;
import com.project.ogg.review.model.service.ReviewCmtService;
import com.project.ogg.review.model.vo.ReviewCmt;

@Controller
@RequestMapping("/review")
public class ReviewCmtController {
	
	@Autowired
	private ReviewCmtService service;
	
	@PostMapping("/cmt_write")
	@ResponseBody
	public Map<String, ReviewCmt> cmtWrite(
			@AuthenticationPrincipal Member member,
			@RequestParam("fCode") String fCode,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewCmt cmt) {
		
		int cmtWrite = 0;
		int reviewCountUpdate = 0;
		Map<String, ReviewCmt> map = new HashMap<>(); 
		if(member != null) {

			cmt.setCmtWriterNo(member.getM_no());
			cmtWrite = service.cmtWrite(cmt);
	
			if(cmtWrite > 0) {
				reviewCountUpdate = service.updateCmtCount(cmt.getRvNo());
				if(reviewCountUpdate > 0) {
					map.put("cmt", service.getCmt(cmt));
					System.out.println("댓글 등록 성공");
				}
			}else {
				System.out.println("댓글 등록 실패");
			}
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
		if(member != null) {

			if(cmtUpdate > 0) {
				reviewCountUpdate = service.updateCmtCount(rvNo);
				if(reviewCountUpdate > 0) {
					System.out.println("댓글 수정 성공");
				}
			}else {
					System.out.println("댓글 수정 실패");
			}
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	@PostMapping("/recmt_write")
	@ResponseBody
	public List<ReviewCmt> recmtWrite(
			@AuthenticationPrincipal Member member,
			@RequestParam("fCode") String fCode,
			@RequestParam("ftype") String ftype,
			@ModelAttribute ReviewCmt cmt) {
		
		int cmtWrite = 0;
		List<ReviewCmt> list = new ArrayList<ReviewCmt>();
		if(member != null) {

			cmt.setCmtWriterNo(member.getM_no());
			cmtWrite = service.cmtWrite(cmt);
	
			if(cmtWrite > 0) {
					list = service.getReCmt(cmt);
					System.out.println("대댓글 등록 성공");
			}else {
				System.out.println("대댓글 등록 실패");
			}
		}
		return list;
	}
}
