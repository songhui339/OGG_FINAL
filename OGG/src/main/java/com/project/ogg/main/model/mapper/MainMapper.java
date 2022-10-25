package com.project.ogg.main.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.ogg.party.model.vo.Party;

@Mapper
public interface MainMapper {
    
    List<Party> getPartyList();
}
