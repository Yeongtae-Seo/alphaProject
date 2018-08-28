package com.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dao.ReserveDao;
import com.model.ReserveTimeVo;

@Controller
@RequestMapping("/reserve")
public class ReserveController {

	@Autowired
	ReserveDao reserveDao;
	
	@RequestMapping("/page.do")
	public ModelAndView moveReserve(@RequestParam Map map) {
		ModelAndView mav = new ModelAndView();
		map.put("todate", "201808281300");
		List<ReserveTimeVo> timeList= reserveDao.getMovieTime(map);
		mav.addObject("timeList", timeList);
		mav.setViewName("reserveMainPage");
		return mav;
	}
}
