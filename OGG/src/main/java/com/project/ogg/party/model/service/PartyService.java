package com.project.ogg.party.model.service;

import java.util.List;

import com.project.ogg.common.util.PageInfo;
import com.project.ogg.party.model.vo.MyParty;
import com.project.ogg.party.model.vo.Ott;
import com.project.ogg.party.model.vo.Party;
import com.project.ogg.party.model.vo.Plan;
import com.project.ogg.party.model.vo.Point;
import com.project.ogg.pay.model.vo.Pay;

public interface PartyService {

	List<Ott> getOttList();

	List<Ott> getPlanInfo(String ottName);
	
	Ott getPlanName(int ottNo);

	Ott getOttInfo(int modal_ott_no);

	int partyCreate(Party party, int m_no);

	List<Party> getPartyList(Party party);

	Party selectParty(int no);

	int insertPartyMemeber(Party party);

	int partyMemberCheck(Party party);

	void updatePartyMember(Party party);

	void updateMemberPoint(Party party);

	void insertPoint(Point pointVo);

	List<Point> getPointList(PageInfo pageInfo, int m_no);

	int getPointCount(int m_no);

	List<MyParty> getPartyListByNo(int m_no);

	List<MyParty> partyMemberList(int no);

	int updateParty(Party party);

	List<Pay> getPayListByNo(PageInfo pageInfo, int m_no);

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
