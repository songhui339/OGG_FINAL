package com.project.ogg.party.model.service;

import java.util.List;

import com.project.ogg.party.model.vo.Ott;
import com.project.ogg.party.model.vo.Party;
import com.project.ogg.party.model.vo.Plan;

public interface PartyService {

	List<Ott> getOttList();

	List<Plan> getPlanInfo(int ottNo);
	
	Plan getPlanName(int planNo);

	Plan getOttInfo(int modal_plan_no);


}
