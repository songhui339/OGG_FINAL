package com.project.ogg.member.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.project.ogg.member.model.vo.Member;


@Mapper
public interface MemberMapper {

	public int insertMember(Member member);

	public int idcheck(String m_id);

	public Member read(String m_id);
	
	public List<Member> findId(String m_email);
	
	public int findIdCheck(String m_email);
	
	public Member findPwd(String m_email);
	
	public int pwdUpdate(Member member);

	public Member selectMemberById(String m_id);

	public int loginLookup(Member member);

	public Member kakaoMemberConfirm(Member member);

	public int insertKakaoMember(Member member);

	public int updateMember(Member member);

}