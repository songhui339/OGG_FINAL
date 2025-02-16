package com.kh.ogg.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

@Service("AuthenticationSuccessHandler")
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		System.out.println("AuthenticationSuccessHandler ����");
		
		List<String> authName = new ArrayList<String>();
		
		for(GrantedAuthority auth : authentication.getAuthorities()) {
			authName.add(auth.getAuthority());
		}
		
		System.out.println("AuthenticationSuccessHandler : " + authName);
		
		if(authName.contains("ROLE_ADMIN")) {
			response.sendRedirect("/admin/admin.do");
			return;
		}
		
		if(authName.contains("ROLE_USER")) {
			response.sendRedirect("/");
			return;
		}
		
		response.sendRedirect("/member/goLoginPage.do");
	}
	
}
