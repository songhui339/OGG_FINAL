package com.project.ogg.party.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.ogg.party.model.mapper.PartyMapper;
import com.project.ogg.party.model.vo.Ott;
import com.project.ogg.party.model.vo.Party;
import com.project.ogg.party.model.vo.Plan;

@Service
public class PartyServiceImpl implements PartyService {
	
	@Autowired
	private PartyMapper mapper;
	
	@Override
	public List<Ott> getOttList() {
		
		return mapper.selectOttList();
	}

	@Override
	public List<Plan> getPlanInfo(int ottNo) {

		return mapper.selectPlanList(ottNo);
	}

	@Override
	public Plan getPlanName(int planNo) {

		return mapper.selectPlan(planNo);
	}

	@Override
	public Plan getOttInfo(int modal_plan_no) {
		
		return mapper.selectOttInfo(modal_plan_no);
	}

}
