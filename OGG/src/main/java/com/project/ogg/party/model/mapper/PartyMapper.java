package com.project.ogg.party.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.ogg.party.model.vo.Ott;
import com.project.ogg.party.model.vo.Party;

@Mapper
public interface PartyMapper {

	List<Ott> selectOttList();

}
