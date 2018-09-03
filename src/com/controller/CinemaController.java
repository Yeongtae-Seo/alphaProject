package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.model.MemberVo;

@Controller
@RequestMapping("/cinema")
public class CinemaController {
	
	@RequestMapping("/theater.do")	// 주소를 치면 myPage로 찾아감
	public ModelAndView theaterHandle(WebRequest webRequest ) {	// webRequest로 세션값을 받아옴
		ModelAndView mav = new ModelAndView();
		MemberVo mvo = (MemberVo) webRequest.getAttribute("auth", WebRequest.SCOPE_SESSION);	// 얘가 session.getAttribute("auth")랑 같음
		// 받아온 객체의 타입을 알면 그 타입으로 받고 모르면 object 아니까 MemberVo로 받아서 vo에 넣음
		mav.addObject("person",mvo);	// 받아온 객체를 ModelAndView에 담아서 person이라는 이름으로 보냄
		mav.setViewName("theater");	// tiles의 이름을 찾아감
		return mav;
	}


}
