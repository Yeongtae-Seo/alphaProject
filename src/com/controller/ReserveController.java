package com.controller;


import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dao.ReserveDao;
import com.model.ReserveTimeVo;
import com.model.ReserveVo;

@Controller
@RequestMapping("/reserve")
public class ReserveController {

	@Autowired
	ReserveDao reserveDao;
	
	@RequestMapping("/page.do")
	public ModelAndView moveReserve(@RequestParam int day) {
		ModelAndView mav = new ModelAndView();	
		System.out.println(day);
		String selectDay = null;
		if(day != 0) {
			
			selectDay = String.valueOf(day);
		}
		
		java.util.Date date = new java.util.Date();
		java.sql.Date date2 = new java.sql.Date(date.getTime());
		SimpleDateFormat test1 = new SimpleDateFormat("yyyyMMddHHmm");
		SimpleDateFormat test2 = new SimpleDateFormat("yyyyMMdd");

		Map map = new HashedMap();
		map.put("thisTime", test1.format(date2));
		if(selectDay == null) {
			map.put("toDay", test2.format(date2));
		}else {
			map.put("toDay", selectDay);
		}
		
//		List<ReserveTimeVo> timeList= reserveDao.getMovieTime(test1.format(date2));
		List<ReserveTimeVo> timeList= reserveDao.getMovieTime(map);
		mav.addObject("selectDay", Integer.parseInt(test2.format(date2)));
		mav.addObject("timeList", timeList);
		mav.setViewName("reserveMainPage");
		return mav;
	}
	
	@RequestMapping("/selectSeat.do")
	public ModelAndView selectSeat(@RequestParam String reserveCode) {
		ModelAndView mav = new ModelAndView();
		ReserveTimeVo reserveVo = reserveDao.getReserveTime(reserveCode);
		List<String> list = reserveDao.getSeat(reserveCode);
		mav.addObject("selectMovie", reserveVo);
		mav.addObject("selectSeat", list);
		mav.setViewName("selectSeat");
		return mav;
	}
	
	@RequestMapping("/seatSelect.do")
	public ModelAndView seatSelect(@RequestParam Map map) {
		ModelAndView mav = new ModelAndView();
		ReserveTimeVo reserveTimeVo = reserveDao.getReserveTime((String) map.get("timeCode"));
		ReserveVo reserveVo = new ReserveVo();
		reserveVo.setEmail((String)map.get("email"));
		reserveVo.setMovieCode(reserveTimeVo.getMovieCode());
		reserveVo.setScreenCode(reserveTimeVo.getScreenCode());
		reserveVo.setSelectSeat((String)map.get("checkSeat"));
		int seatCode = reserveDao.getSeatCode();
		reserveVo.setSeatCode(seatCode);
		reserveVo.setTimeCode(reserveTimeVo.getTimeCode());
		int insertSeat = reserveDao.insertSeat(reserveVo);
		int insertReserve = reserveDao.insertReserve(reserveVo);
		
		if((insertSeat == 1) && (insertReserve == 1)) {
			mav.setViewName("reserveSuccess");
		}else {
			mav.setViewName("reserveFail");
		}
		return mav;
		
	}
	
}


































