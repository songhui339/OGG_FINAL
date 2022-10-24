package com.project.ogg.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.project.ogg.community.model.service.CommunityReplyService;
import com.project.ogg.community.model.vo.CommunityReply;
import com.project.ogg.member.model.vo.Member;

@Controller
public class CommunityReplyController {
	
	@Autowired
	private CommunityReplyService replyService;
	
	// 댓글 작성
	@PostMapping("/community/replyWrite.do")
	public String communityReplyWrite(CommunityReply communityReply,
									  @AuthenticationPrincipal Member member) {

		replyService.communityReplyWrite(communityReply);
		
		return "redirect:/community/view.do?c_no=" + communityReply.getCr_communityNo();
	}
	
	// 댓글 수정
	@PostMapping("/cummunity/replyModify.do")
	public ModelAndView communityReplutModify(ModelAndView model,
											  @AuthenticationPrincipal Member member,
											  @RequestParam int cr_no) {
		int result = 0;
		
		CommunityReply communityReply = null;
		communityReply = replyService.findCommunityReplyByNo(cr_no);

		if(communityReply.getCr_writerNo() == member.getM_no()) {
			result = replyService.communityReplutModify(communityReply);

			if(result > 0) {
				model.addObject("msg", "댓글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/community/view.do?c_no=" + communityReply.getCr_communityNo());
			} else {
				model.addObject("msg", "댓글 수정을 실패하였습니다.");
				model.addObject("location",  "/community/view.do?c_no=" + communityReply.getCr_communityNo());
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location",  "/community/view.do?c_no=" + communityReply.getCr_communityNo());
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 댓글 삭제
	@GetMapping("/cummunity/replyDelete.do")
	public ModelAndView communityReplyDelete(ModelAndView model,
											 @AuthenticationPrincipal Member member,
											 @RequestParam int cr_no) {
		
		int result = 0;
		CommunityReply communityReply = null;
		communityReply = replyService.selectReplyByNo(cr_no);
		
		if(communityReply.getCr_writerNo() == member.getM_no()) {
			result = replyService.communityReplyDelete(cr_no);
			
			if(result > 0) {
				model.addObject("msg", "댓글이 정상적으로 삭제되었습니다.");
				model.addObject("location", "/community/view.do?c_no=" + communityReply.getCr_communityNo());
			} else {
				model.addObject("msg", "댓글 삭제를 실패하였습니다.");
				model.addObject("location",  "/community/view.do?c_no=" + communityReply.getCr_communityNo());
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location",  "/community/view.do?c_no=" + communityReply.getCr_communityNo());
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
}