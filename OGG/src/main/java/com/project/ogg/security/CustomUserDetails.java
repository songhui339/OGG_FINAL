package com.project.ogg.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.project.ogg.member.model.vo.Member;

public class CustomUserDetails implements UserDetails {

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