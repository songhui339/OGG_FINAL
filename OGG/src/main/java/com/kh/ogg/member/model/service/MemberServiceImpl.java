package com.kh.ogg.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.ogg.member.model.mapper.MemberMapper;
import com.kh.ogg.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public int save (Member member) {
		int result = 0;
		
		if(member.getM_no() != 0) {
			// update
		} else {
			// insert
			member.setM_pwd(passwordEncoder.encode(member.getM_pwd()));
			result = mapper.insertMember(member);
		}
		return result;
	}

	@Override
	public int idcheck (String m_id) {

		return mapper.idcheck(m_id);
	}

}
