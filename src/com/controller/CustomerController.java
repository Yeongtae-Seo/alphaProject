package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dao.CustomerDao;
import com.google.gson.Gson;
import com.model.CustomerVo;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	CustomerDao customerdao;

	@Autowired 
	Gson gson;

	@RequestMapping("/center.do")
	public ModelAndView customerHandle() { // FAQ(������) �������� �̵�
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer");
		mav.addObject("top", customerdao.getTop5()); 	// ��񿡼� ��ȸ�� ���� 5�� ���� ��������
		mav.addObject("all", customerdao.getAll()); 	// ��񿡼� ��ü ���� ��������
		mav.addObject("allCount", customerdao.getAllCount());  	// ī�װ� ��ü ����
		mav.addObject("cateCount", customerdao.getCateCount()); 	// ī�װ� �� ����
		return mav;
	}

	@RequestMapping(value="/ajax.do", produces="application/json;charset=utf-8")
	@ResponseBody
	public String ajaxHandle(@RequestParam("category") String category) {
		
		CustomerVo vo = new CustomerVo();
		
		if(category.equals("��ü")) {
			vo = (CustomerVo) customerdao.getAll();
		}else {
			vo = (CustomerVo) customerdao.getCategory(category);
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(vo);
		
		System.out.println(json);
		return json;
		
	}

	
	
	
	
}
