
package com.project.ogg.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomAuthenticationProvider implements AuthenticationProvider {
	
	@Autowired
	private CustomUserDetailsService CustomUserDetailsService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		String m_id = (String) authentication.getPrincipal();
		String m_pwd = (String) authentication.getCredentials();
		
		UsernamePasswordAuthenticationToken authToken = (UsernamePasswordAuthenticationToken) authentication;
		
		UserDetails user = CustomUserDetailsService.loadUserByUsername(authToken.getName());

		if (user == null) {
			throw new UsernameNotFoundException(m_id);
		}
		
		if(!passwordEncoder.matches(m_pwd, user.getPassword())) {
			throw new BadCredentialsException(m_id);
		}
		
		if (!user.isEnabled()) {
			throw new BadCredentialsException(m_id);
		}
		
		return new UsernamePasswordAuthenticationToken(m_id, m_pwd, user.getAuthorities());
	} 
	
	@Override
	public boolean supports(Class<?> authentication) {
    	return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}




