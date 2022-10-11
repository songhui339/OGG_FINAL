package com.project.ogg.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.ogg.member.model.mapper.MemberMapper;
import com.project.ogg.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public int save(Member member) {
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
	public int idcheck(String m_id) {
		
		return mapper.idcheck(m_id);
	}
	
	// 아이디 찾기
	@Override
	public List<Member> findId(String m_id) {
		
		return mapper.findId(m_id);
	}

	@Override
	public int findIdCheck(String m_email) {

		return mapper.findIdCheck(m_email);
	}
	
	@Override
	public Member findPwd(String m_email) {

		return mapper.findPwd(m_email);
	}

	@Override
	public int pwdUpdate(Member member) {
		int result = 0;
		
		member.setM_pwd(passwordEncoder.encode(member.getM_pwd()));
		result = mapper.pwdUpdate(member);
		
		return result;
	}
	
	@Override
	public Member findMemberById(String m_id) {
		
		return mapper.selectMemberById(m_id);
	}

	// 카카오
	@Override
	public Integer loginLookup (Member member) {
		int result = 0;
		result = mapper.loginLookup(member);
		return result;
	}

	@Override
	public Member kakaoMemberConfirm(Member member) {

		return mapper.kakaoMemberConfirm(member);
	}

	@Override
	public int insertKakaoMember(Member member) {

		return mapper.insertKakaoMember(member);
	}

}