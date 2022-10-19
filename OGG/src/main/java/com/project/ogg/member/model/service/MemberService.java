package com.project.ogg.member.model.service;

import java.util.List;

import com.project.ogg.member.model.vo.Member;

public interface  MemberService {

	int save(Member member);

	int idcheck(String m_id);
	
	List<Member> findId(String m_email);
	
	int findIdCheck(String m_email);

	Member findPwd(String m_email);

	int pwdUpdate(Member member);

	Member findMemberById(String m_id);

	Integer loginLookup(Member member);

	Member kakaoMemberConfirm(Member member);

	int insertKakaoMember(Member member); 

}