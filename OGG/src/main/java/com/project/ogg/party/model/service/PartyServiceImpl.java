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

}
