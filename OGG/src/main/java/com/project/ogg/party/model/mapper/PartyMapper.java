package com.project.ogg.party.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.project.ogg.common.util.PageInfo;
import com.project.ogg.party.model.vo.MyParty;
import com.project.ogg.party.model.vo.Ott;
import com.project.ogg.party.model.vo.Party;
import com.project.ogg.party.model.vo.Plan;
import com.project.ogg.party.model.vo.Point;
import com.project.ogg.pay.model.vo.Pay;


@Mapper
public interface PartyMapper {

	List<Ott> selectOttList();

	List<Ott> selectPlanList(String ottNo);

	Ott selectPlan(int ottNo);

	Ott selectOttInfo(int modal_ott_no);

	int insertParty(Party party);

	List<Party> getPartyList(Party party);

	Party selectParty(int no);

	int insertPartyMemeber(Party party);

	int getPartyNo(int m_no);

	int partyMemberCheck(Party party);

	void updatePartyMember(Party party);

	void updateMemberPoint(Party party);

	void insertPoint(Point pointVo);

	List<Point> getPointList(RowBounds rowBounds, int m_no);

	int getPointCount(int m_no);

	List<MyParty> getPartyListByNo(int m_no);

	List<MyParty> partyMemberList(int no);

	int updateParty(Party party);

	void insertPay(Pay pay);

	void firstSubpay(Pay pay);

	List<Pay> getPayListByNo(RowBounds rowBounds, int m_no);

	int getPayCount(int m_no);

	void removePartyMember(Party party);

	int deleteMemberParty(Party party);

	List<Pay> memberPayList(Party party);

	void deletePay(Party party);

	List<Pay> selectMemberParty(int p_no);

	List<Pay> partyPayList(Party party);

	String getMemberId(int m_no);

	void deletePartyMember(Pay pay);

	void deleteParty(Pay pay);

	
}
