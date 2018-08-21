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

	@RequestMapping("/center")
	public ModelAndView customerHandle() {  //FAQ(������) �������� �̵�
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/center");
		mav.addObject("all", customerdao.getAll()); //��񿡼� ��ü ���� ��������
		mav.addObject("top", customerdao.getTop5()); //��񿡼� ��ȸ�� ���� 5�� ���� ��������
		return mav;
	}
	
}
