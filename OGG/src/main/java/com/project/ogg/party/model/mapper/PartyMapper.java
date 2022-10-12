package com.project.ogg.party.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.ogg.party.model.vo.Ott;
import com.project.ogg.party.model.vo.Party;
import com.project.ogg.party.model.vo.Plan;

@Mapper
public interface PartyMapper {

	List<Ott> selectOttList();

	List<Plan> selectPlanList(int ottNo);

	Plan selectPlan(int planNo);

	Plan selectOttInfo(int modal_plan_no);

	Party insertParty(Party party);
	
}
