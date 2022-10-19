package com.project.ogg.party.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.ogg.party.model.vo.Ott;
import com.project.ogg.party.model.vo.Party;
import com.project.ogg.party.model.vo.Plan;

@Mapper
public interface PartyMapper {

	List<Ott> selectOttList();

	List<Ott> selectPlanList(String ottNo);

	Ott selectPlan(int ottNo);

	Ott selectOttInfo(int modal_ott_no);

	Party insertParty(Party party);
	
}
