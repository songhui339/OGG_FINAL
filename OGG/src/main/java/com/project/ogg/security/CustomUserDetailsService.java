package com.project.ogg.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.ogg.member.model.mapper.MemberMapper;
import com.project.ogg.member.model.vo.Member;

@Service("UserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String m_id) throws UsernameNotFoundException {

		Member member = mapper.read(m_id);

		if(member == null) {
			throw new UsernameNotFoundException("username Not Found");
		}
		return member;
	}
}



