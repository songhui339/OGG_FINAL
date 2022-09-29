package com.kh.ogg.member.model.service;

import com.kh.ogg.member.model.vo.Member;

public interface MemberService {

	int save(Member member);

	int idcheck(String m_id);
	
}
