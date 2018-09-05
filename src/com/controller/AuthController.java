package com.controller;

import java.sql.Date;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.dao.MemberDao;
import com.google.gson.Gson;
import com.model.MemberVo;
import com.service.AuthMap;
import com.service.Converter;

@Controller
public class AuthController {
	
	@Autowired
	MemberDao memberDao;
	@Autowired
	Gson gson;
	@Autowired
	AuthMap auth;
	
	@RequestMapping("/logining.do")	// do는 컨트롤러로 갈 때
	public ModelAndView loginHandle(@RequestParam Map map, HttpSession session, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		System.out.println(map);
		MemberVo vo = memberDao.findByEmailAndPass(map);
		if(auth.map.containsKey(vo.getEmail())) {
			((HttpSession) auth.map.get(vo.getEmail())).setAttribute("auth", null);;
			auth.map.put(vo.getEmail(), session);
		}else {
			auth.map.put(vo.getEmail(), session);
		}

		if(vo != null) {
			session.setAttribute("auth", vo);	// 로그인 성공하면 세션에 넣어두기
			
			// context.setAttribute(vo.getEmail(), true);
			
			mav.setViewName("mainPage");		// mainpage로 이동
				if(map.get("keep") != null && map.get("keep").equals("on")) {	// 쿠키
					Cookie cookie = new Cookie("keep", vo.getEmail());
					cookie.setPath("/");
					cookie.setMaxAge(60 * 60 * 24 * 30);
					response.addCookie(cookie);
			}

				
		}else {
			// mav.addObject("{\"fail\": \"email이나 password가 바르지 않습니다.\"}");
			mav.addObject("fail", "로그인 실패"); 
			mav.setViewName("loginPage");
		}
		System.out.println("아이디? : " + session.getAttribute("auth"));
		return mav;
	}
	
	// 여기서 쿠키 삭제
	@RequestMapping("/logout.do")	// 로그아웃		
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		MemberVo vo = (MemberVo) session.getAttribute("auth");
		session.setAttribute("auth", null);	// 세션을 날림
			// 쿠키를 가져와보고
			Cookie loginCookie = WebUtils.getCookie(request, "keep");
			if (loginCookie != null) {
				// null이 아니라 존재하면
				loginCookie.setPath("/");
				// 쿠키는 없앨 때 유효시간을 0으로 설정 invalidate 같은 것 없음
				loginCookie.setMaxAge(0);
				// 쿠키 설정을 적용
				response.addCookie(loginCookie);
			}
			session.invalidate();
//		}
		return "mainPage";
	}

	@RequestMapping("/joinHandle.do")	// joinPage에서 submit하면 얘를 찾아와서 실행, 회원가입
	public ModelAndView joinHandle(@ModelAttribute MemberVo memberVo, @RequestParam String hemail, String hpass, String hphone) {
		ModelAndView mav = new ModelAndView();
		System.out.println(hemail + "/" + hpass + "/" + hphone);
		Converter converter = new Converter();
		Date birth = converter.convertToDate(String.valueOf(memberVo.getBirth()));
		memberVo.setBirth(birth);
		System.out.println(memberVo);
		int md = 0;
		if(hemail.equals("a") && hpass.equals("a") && hphone.equals("a")) {
			md = memberDao.addMember(memberVo);
		}
		if(md == 1) {
			mav.setViewName("joinSucc");
		}else {
			mav.setViewName("joinErr");
		}
		return mav;
	}
	
	@RequestMapping(value="/emailCheckHandle.do", produces="application/json;charset=utf-8")	// 컨트롤러 여기 타고 들어옴, 이메일 중복확인
	@ResponseBody
	public String emailCheckHandle(@RequestParam String echeck) {	// parameter를 echeck로 받아옴
		int r = memberDao.emailCheck(echeck);
		String t;
		if(r == 0) {
			t = "YYYY";
		}else {
			t = "NNNN";
		}
		return "{\"rst\": \""+t+"\"}";
	}

	@RequestMapping(value="/phoneCheckHandle.do", produces="application/json;charset=utf-8")	// 컨트롤러 여기 타고 들어옴, 폰번호 중복확인
	@ResponseBody
	public String phoneCheckHandle(@RequestParam String pcheck) {	// parameter를 pcheck로 받아옴
		System.out.println("폰 첵크 : ");
		System.out.println(pcheck);
		int r = memberDao.phoneCheck(pcheck);
		String t;
		if(r == 0) {
			t = "YYYY";
		}else {
			t = "NNNN";
		}
		return "{\"rst\": \""+t+"\"}";
	}
	

	
	

	
}


