package com.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dao.MemberDao;
import com.dao.MyTicketDao;
import com.model.MemberVo;
import com.model.MyTicketVo;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	@Autowired
	MemberDao memberDao;
	@Autowired
	MyTicketDao myTicketDao;
	
	@RequestMapping("/myPage.do")	// 주소를 치면 myPage로 찾아감
	public ModelAndView myPageHandle(WebRequest webRequest ) {	// webRequest로 세션값을 받아옴
		ModelAndView mav = new ModelAndView();
		MemberVo mvo = (MemberVo) webRequest.getAttribute("auth", WebRequest.SCOPE_SESSION);	// 얘가 session.getAttribute("auth")랑 같음
		// 받아온 객체의 타입을 알면 그 타입으로 받고 모르면 object 아니까 MemberVo로 받아서 vo에 넣음
		mav.addObject("person",mvo);	// 받아온 객체를 ModelAndView에 담아서 person이라는 이름으로 보냄
		mav.setViewName("myPage");	// tiles의 이름을 찾아감
		return mav;
	}
	
	@RequestMapping("/modifyHandle.do")	// memberModi에서 submit하면 얘를 찾아서 실행
	public ModelAndView modifyHandle(WebRequest webRequest) {
		ModelAndView mav = new ModelAndView();
		MemberVo mvo = (MemberVo) webRequest.getAttribute("auth", webRequest.SCOPE_SESSION);
		mav.addObject("person",mvo);
		mav.setViewName("myModi");	// tiles에 쓰여있는 view이름과 같아야 함
		return mav;
	}
	
	@RequestMapping("/modiSucHandle.do")
	public ModelAndView modiSucHandle(@ModelAttribute MemberVo vo) {
		ModelAndView mav = new ModelAndView();
		int md = memberDao.updateMember(vo);
		if(md == 1 ) {
			mav.setViewName("modiSuc");
		}else {
			mav.setViewName("joinErr");
		}
		return mav;
	}
	
	@RequestMapping("/withdraw.do")	// 탈퇴버튼 누르면 이동
	public ModelAndView withHandle(WebRequest webRequest) {
		ModelAndView mav = new ModelAndView();
		MemberVo mvo = (MemberVo) webRequest.getAttribute("auth", webRequest.SCOPE_SESSION);
		mav.addObject("person",mvo);
		mav.setViewName("confirmSend");
		return mav;
	}
	
	@RequestMapping("/confirmHandle.do")	// 탈퇴하기 전 비밀번호 확인
	public ModelAndView memberDelete(@RequestParam String pass, WebRequest webRequest, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVo mvo = (MemberVo) webRequest.getAttribute("auth", webRequest.SCOPE_SESSION);
		String opass = mvo.getPass();	// 현재 로그인한 계정에 대한 패스워드가 pass에 저장됨(pass만 뽑아서)
		String email = mvo.getEmail();
		if(opass.equals(pass)) {
			int del = memberDao.deleteMember(email);
			session.setAttribute("auth", null);
			mav.setViewName("confirmPage");
			return mav;
		}else {
			mav.addObject("delFail", "비밀번호가 맞지 않습니다.");
			mav.setViewName("confirmSend");
			return mav;
		}
	}
	
	@RequestMapping("/deleteSuc.do")
	public ModelAndView complete(WebRequest webRequest) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mainPage");
		return mav;
		
	}
	
	@RequestMapping("/historyHandle.do")
	public ModelAndView ticketingHandle(@RequestParam Map map) {
		ModelAndView mav = new ModelAndView();
		System.out.println(map.get("email"));
		List<MyTicketVo> list = myTicketDao.findList((String) map.get("email"));
		mav.addObject("list", list);
		mav.setViewName("ticketingPage");
		return mav;
	}
	
	
	@RequestMapping("/cancelPage.do")	// 예매취소 완료
	public ModelAndView cancelHandle(@RequestParam Map map) {
		ModelAndView mav = new ModelAndView();
		List<String> list = new ArrayList<>(map.keySet());
		int del = 0;
		for(int i=0; i<list.size(); i++) {
			int no = Integer.parseInt(list.get(i));
			del = myTicketDao.ticketDel(no);
			myTicketDao.ticketRem(no);
		}
		if(del == 1) {	// 삭제되면 
			mav.setViewName("cancelPage");
		}else {
			mav.setViewName("joinErr");
		}
		return mav;
	}

	
	
	

}
