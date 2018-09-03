package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.InfoDao;
import com.model.InfoVo;

@Controller
public class NavbarController {

	
	@Autowired
	InfoDao infoDao;
	
	@RequestMapping("/login.do")
	public String loginPage(HttpSession session) {
		
		return "loginPage";
	}

	
	@RequestMapping("/info.do")
	public ModelAndView infoHandle(@RequestParam int num, int page, int viewPage) {				// 공지 사항 페이지로 이동하는 메소드
		ModelAndView mav = new ModelAndView();
		List<InfoVo> list = infoDao.getList(viewPage);
		int pageCount = infoDao.getPageCount(page);
		double aa = (double)pageCount/10;
		mav.addObject("list", list);
		mav.addObject("num", num);
		mav.addObject("pageCount", Math.ceil(aa));
		mav.addObject("page", page);
		mav.setViewName("infoPage");
		return mav;
	}

	@RequestMapping("/join.do")	// 어떤 컨트롤러로 이동하는지
	public String joinPage(HttpSession session) {
		return "joinPage";	// 이동할 페이지
	}
	
}













