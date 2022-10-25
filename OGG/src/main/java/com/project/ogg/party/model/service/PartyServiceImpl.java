package com.project.ogg.party.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.ogg.party.model.mapper.PartyMapper;
import com.project.ogg.party.model.vo.Ott;
import com.project.ogg.party.model.vo.Party;

@Service
public class PartyServiceImpl implements PartyService {
	
	@Autowired
	private PartyMapper mapper;
	
	@Override
	public List<Ott> getOttList() {
		
		return mapper.selectOttList();
	}

	@Override
	public List<Ott> getPlanInfo(String ottName) {

		return mapper.selectPlanList(ottName);
	}

	@Override
	public Ott getPlanName(int ottNo) {

		return mapper.selectPlan(ottNo);
	}

	@Override
	public Ott getOttInfo(int modal_ott_no) {
		
		return mapper.selectOttInfo(modal_ott_no);
	}

	@Override
	public int partyCreate(Party party, int m_no) {
		mapper.insertParty(party);
		
		//Party getm_no = mapper.getPartyNo(m_no);
		
		
		return mapper.getPartyNo(m_no);
	}

	@Override
	public List<Party> getPartyList(String ottName) {
		
		return mapper.getPartyList(ottName);
	}

	@Override
	public Party selectParty(int no) {
		
		return mapper.selectParty(no);
	}

	@Override
	public int insertPartyMemeber(Party party) {
		
		return mapper.insertPartyMemeber(party);
	}

	@Override
	public int partyMemberCheck(Party party) {

		return mapper.partyMemberCheck(party);
	}

	@Override
	public void updatePartyMember(Party party) {
		
		mapper.updatePartyMember(party);	
	}

}
