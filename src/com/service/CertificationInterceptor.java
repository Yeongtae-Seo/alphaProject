package com.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.dao.MemberDao;
import com.model.MemberVo;

@Component("cert")
public class CertificationInterceptor implements HandlerInterceptor {

	@Autowired
	MemberDao dao;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		Cookie[] cookies = request.getCookies();
		System.out.println(cookies);
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				System.out.println(cookies[i].getName());
				if (cookies[i].getName().equals("keep")) {
					System.out.println("keep 값은 : " + cookies[i].getValue());
					String email = cookies[i].getValue();
					MemberVo cookieVo = dao.cookieVo(email);
					System.out.println("cookieVo : " + cookieVo);
					session.setAttribute("auth", cookieVo);
				}
			}
		}

		return true;
	}


}
