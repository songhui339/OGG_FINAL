package com.project.ogg.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.ogg.main.model.mapper.MainMapper;
import com.project.ogg.party.model.vo.Party;

@Service
public class MainServiceImpl implements MainService {
    
    @Autowired
    private MainMapper mapper;

    @Override
    public List<Party> getPartyList() {
        
        return mapper.getPartyList();
    }

}
