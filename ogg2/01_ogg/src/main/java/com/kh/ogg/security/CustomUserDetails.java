package com.kh.ogg.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.kh.ogg.member.model.vo.Member;

public class CustomUserDetails implements UserDetails { // = VO

//	private String USERNAME; // 사용자 고유 아이디
//	private String PASSWORD; // 암호화 패스워드
//	private String AUTHORITY; // 사용자 권한
//	private String ENABLED; // 계정 활성화 여부
	
	private Member member;
	
	public CustomUserDetails(Member member) {
		this.member = member; 
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collection = new ArrayList<GrantedAuthority>();
		
		collection.add(new GrantedAuthority() {
			
			@Override
			public String getAuthority() {
				return member.getM_authority();
			}
		});
		
		return collection;
	}
	
	@Override
	public String getPassword() {
		return member.getM_pwd();
	}
	
	@Override
	public String getUsername() {
		return member.getM_id();
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override
	public boolean isEnabled() {
		return true;
	}
	
}