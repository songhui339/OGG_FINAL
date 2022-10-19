package com.project.ogg.community.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.ogg.community.model.vo.Community;
import com.project.ogg.community.model.vo.CommunityReply;

@Mapper
public interface CommunityReplyMapper {
	
	// 댓글 조회
	public List<CommunityReply> communityReplyList(int cr_communityNo);
	
	// 댓글 작성
	void communityReplyWrite(CommunityReply communityReply);
	
	// 댓글 수정
	int communityReplutModify(CommunityReply communityReply);
	
	CommunityReply findCommunityReplyByNo(int cr_no);
	
	// 댓글 삭제
	int communityReplyDelete(@Param("cr_no")int cr_no);
	
	// cr_no를 통한 댓글 데이터 조회
	CommunityReply selectReplyByNo(@Param("cr_no") int cr_no);

	
	
}