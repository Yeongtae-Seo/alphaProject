package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.model.MemberVo;

public class MasterInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		if(request.getSession().getAttribute("auth") != null) {
			MemberVo vo = (MemberVo) request.getSession().getAttribute("auth");
			int r = vo.getGrade();
			if(r==0) {
				return true;
			}else {
				response.sendRedirect("/question/error.do");
				return false;
			}
			
		}else {	
			response.sendRedirect("/login.do");
			return false;
		}
	}
}
