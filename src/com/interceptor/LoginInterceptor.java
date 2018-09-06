package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.model.MemberVo;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		HttpSession session = request.getSession();
		MemberVo vo = (MemberVo) session.getAttribute("auth");
		vo.getGrade();
		if(request.getSession().getAttribute("auth") == null) {
			response.sendRedirect("/login.do");
			return false;
		}else {
			return true;
		}
	}

}
