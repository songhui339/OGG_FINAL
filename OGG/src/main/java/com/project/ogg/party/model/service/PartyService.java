package com.project.ogg.party.model.service;

import java.util.List;

import com.project.ogg.party.model.vo.Ott;
import com.project.ogg.party.model.vo.Party;
import com.project.ogg.party.model.vo.Plan;

public interface PartyService {

	List<Ott> getOttList();

	List<Ott> getPlanInfo(String ottName);
	
	Ott getPlanName(int ottNo);

	Ott getOttInfo(int modal_ott_no);

	int partyCreate(Party party, int m_no);

	List<Party> getPartyList(String ottName);

	Party selectParty(int no);

	int insertPartyMemeber(Party party);

	int partyMemberCheck(Party party);

	void updatePartyMember(Party party);



}
