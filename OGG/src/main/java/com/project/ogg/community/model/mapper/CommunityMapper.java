package com.project.ogg.community.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.project.ogg.community.model.vo.Community;
import com.project.ogg.community.model.vo.CommunityReply;

@Mapper
public interface CommunityMapper {

	List<Community> selectAll(RowBounds rowBounds);

	int selectCommunityCount();

	Community findCommunityByNo(@Param("c_no") int c_no);

	int insertCommunity(Community community);

	int loginConfirm(int m_no);

	int selectMemberId(String m_id);

	int communityDelete(@Param("c_no")int c_no, @Param("c_status")String c_status); 

	int modifyCommunity(Community community);
	
	public int communityViewcount (int c_no);

}