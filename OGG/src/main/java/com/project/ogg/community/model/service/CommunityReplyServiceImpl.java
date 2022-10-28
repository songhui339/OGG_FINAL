package com.project.ogg.community.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.ogg.community.model.mapper.CommunityReplyMapper;
import com.project.ogg.community.model.vo.Community;
import com.project.ogg.community.model.vo.CommunityReply;

@Service
public class CommunityReplyServiceImpl implements CommunityReplyService {
	
	@Autowired
	private CommunityReplyMapper mapper;
	
	// 댓글 조회
	@Override
	public List<CommunityReply> communityReplyList(int cr_communityNo) {

		return mapper.communityReplyList(cr_communityNo);
	}
	
	// 댓글 작성
	@Override
	public void communityReplyWrite(CommunityReply communityReply) {

		mapper.communityReplyWrite(communityReply);
	}
	
	// 댓글 수정
	@Override
	public int communityReplutModify(CommunityReply communityReply) {

		int result = 0;
		result = mapper.communityReplutModify(communityReply);
		return result;
	}
	
	@Override
	public CommunityReply findCommunityReplyByNo(int cr_no) {

		return mapper.findCommunityReplyByNo(cr_no);
	}
	
	// 댓글 삭제
	@Override
	public int communityReplyDelete(int cr_no) {
		int result = 0;
		
		result = mapper.communityReplyDelete(cr_no);
		
		return result;
	}

	@Override
	public CommunityReply selectReplyByNo(int cr_no) {

		return mapper.selectReplyByNo(cr_no);
	}



}