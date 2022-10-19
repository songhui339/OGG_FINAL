package com.project.ogg.community.model.service;

import java.util.List;

import com.project.ogg.common.model.CommonVO;
import com.project.ogg.common.util.PageInfo;
import com.project.ogg.community.model.vo.Community;

public interface CommunityService {
	
	int getBoardCount(CommonVO vo);

	List<Community> getBoardList(PageInfo pageInfo, CommonVO vo);

	Community findCommunityByNo(int c_no);

	int insertCommunity(Community community);

	int loginConfirm(int m_no);

	int selectMemberId(String m_id);

	int communityDelete(int c_no);
	
	// 게시글 조회수
	int communityViewcount(int c_no);


}