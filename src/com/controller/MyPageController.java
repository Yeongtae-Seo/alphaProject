package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.model.MemberVo;

@Controller
public class MyPageController {
	
	@RequestMapping("/myPage.do")	// 마이페이지에서 요청이 들어오면 여기로
	public ModelAndView myPageHandle(WebRequest webRequest ) {	// webRequest로 세션값을 받아옴
		ModelAndView mav = new ModelAndView();
		MemberVo vo = (MemberVo) webRequest.getAttribute("auth", WebRequest.SCOPE_SESSION);	// 얘가 session.getAttribute("auth")랑 같음
		// 받아온 객체의 타입을 알면 그 타입으로 받고 모르면 object 아니까 MemberVo로 받아서 vo에 넣음
		mav.addObject("person",vo);	// 받아온 객체를 ModelAndView에 담아서 person이라는 이름으로 보냄
		mav.setViewName("myPage");	// tiles의 이름을 찾아감
		return mav;
	}

}
