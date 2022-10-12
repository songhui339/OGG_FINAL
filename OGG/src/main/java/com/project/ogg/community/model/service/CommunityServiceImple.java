package com.project.ogg.community.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.ogg.common.util.PageInfo;
import com.project.ogg.community.model.mapper.CommunityMapper;
import com.project.ogg.community.model.vo.Community;
import com.project.ogg.community.model.vo.CommunityReply;

@Service
public class CommunityServiceImple implements CommunityService {

	@Autowired
	private CommunityMapper mapper;

	@Override
	public List<Community> getBoardList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);			
		
		return mapper.selectAll(rowBounds);
	}

	@Override
	public int getBoardCount() {

		return mapper.selectCommunityCount();
	}

	@Override
	public Community findCommunityByNo(int c_no) {
		
		return mapper.findCommunityByNo(c_no);
	}

	@Override
	public int insertCommunity(Community community) {
		int result = 0;
		
		if(community.getC_no() != 0) {
			result = mapper.modifyCommunity(community);

		} else {
			result = mapper.insertCommunity(community);
		}
		
		return result;
	}

	@Override
	public int loginConfirm(int m_no) {

		return mapper.loginConfirm(m_no);
	}

	@Override
	public int selectMemberId(String m_id) {

		return mapper.selectMemberId(m_id);
	}

	@Override
	public int communityDelete(int c_no) {
		int result = 0;
		result = mapper.communityDelete(c_no, "N");
		
		return result;
	}

	@Override
	public int communityViewcount(int c_no) {

		return mapper.communityViewcount(c_no);
	}

}