package com.project.ogg.community.model.service;

import java.util.List;

import com.project.ogg.community.model.vo.Community;
import com.project.ogg.community.model.vo.CommunityReply;

public interface CommunityReplyService {
	
	// 댓글 조회
	public List<CommunityReply> communityReplyList(int cr_communityNo);
	
	// 댓글 작성
	public void communityReplyWrite(CommunityReply communityReply);
	
	// 댓글 수정
	int communityReplutModify(CommunityReply communityReply);
	
	CommunityReply findCommunityReplyByNo(int cr_no);
	
	// 댓글 삭제
	int communityReplyDelete(int cr_no);
	
	// cr_no를 통한 댓글 데이터 조회
	CommunityReply selectReplyByNo (int cr_no);
	
}
