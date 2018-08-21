package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CustomerDao;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	CustomerDao customerdao;

	@RequestMapping("/center.do")
	public ModelAndView customerHandle() { // FAQ(������) �������� �̵�
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer");
		mav.addObject("top", customerdao.getTop5()); // ��񿡼� ��ȸ�� ���� 5�� ���� ��������
		mav.addObject("all", customerdao.getAll()); // ��񿡼� ��ü ���� ��������
		mav.addObject("cateCount", customerdao.getCateCount());
		
		return mav;
	}
	
	@RequestMapping("/faq.do")
	public ModelAndView categoryHandle() { // FAQ(������) �������� �̵�
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer");
		mav.addObject("top", customerdao.getTop5()); // ��񿡼� ��ȸ�� ���� 5�� ���� ��������
		mav.addObject("all", customerdao.getAll()); // ��񿡼� ��ü ���� ��������
		mav.addObject("cateCount", customerdao.getCateCount());
		
		return mav;
	}

}
