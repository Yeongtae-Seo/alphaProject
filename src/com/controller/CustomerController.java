package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CustomerDao;
import com.google.gson.Gson;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	CustomerDao customerdao;

	@Autowired
	Gson gson;

	// 고객센터 메인
	@RequestMapping("/center.do")
	public ModelAndView customerHandle() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer");
		mav.addObject("top", customerdao.getTop5()); // top5 데이터
		mav.addObject("all", customerdao.getAll()); // 전체 데이터
		mav.addObject("allCount", customerdao.getAllCount()); // 전체 데이터 갯수
		mav.addObject("cateCount", customerdao.getCateCount()); // 카테고리별 이름 및 데이터 갯수
		return mav;
	}

	// 조회수 증가
	@RequestMapping(path = "/count.do", produces = "application/json;chatset=utf-8")
	@ResponseBody
	public String countHandle(@RequestParam int num) {
		// System.out.println(num);
		int n = customerdao.addCount(num); // 조회수 증가

		if (n == 0) {
			return "{\"rst\":\"false\"}"; // 실패시 false 반환
		} else {
			return "{\"rst\":\"true\"}"; // 성공시 true 반환
		}
	}

	// 카테고리 선택
	@RequestMapping("/category.do")
	public ModelAndView categoryHandle(@RequestParam("category") String category) {

		// System.out.println(category);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("category");
		mav.addObject("top", customerdao.getTop5()); // top5 데이터
		mav.addObject("all", customerdao.getAll()); // 전체 데이터
		mav.addObject("allCount", customerdao.getAllCount()); // 전체 데이터 갯수
		mav.addObject("cateCount", customerdao.getCateCount()); // 카테고리별 이름 및 데이터 갯수
		mav.addObject("category", customerdao.getCategory(category)); // 카테고리 데이터
		return mav;
	}

	// FAQ 작성 페이지
	@RequestMapping("/writeFaq.do")
	public String writeFaqHandle() {
		return "writeFaq";
	}

}
