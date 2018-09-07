package com.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dao.MemberDao;
import com.dao.ReserveDao;
import com.model.ReserveTimeVo;
import com.model.ReserveVo;
import com.service.Converter;

@Controller
@RequestMapping("/reserve")
public class ReserveController {

	@Autowired
	ReserveDao reserveDao;
	@Autowired
	MemberDao memberDao;
	
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
		
		Converter con = new Converter();
		
//		List<ReserveTimeVo> timeList= reserveDao.getMovieTime(test1.format(date2));
		List<ReserveTimeVo> timeList= reserveDao.getMovieTime(map);
		mav.addObject("selectDay", Integer.parseInt(test2.format(date2)));
		
		List<ReserveTimeVo> timeList1 = new ArrayList<>() ;
		List<ReserveTimeVo> timeList2 = new ArrayList<>() ;
		List<ReserveTimeVo> timeList3 = new ArrayList<>() ;
		
		for(int i = 0 ; i<timeList.size(); i++) {
			ReserveTimeVo a = timeList.get(i);
			if(a.getScreenCode() == 10) {
				timeList1.add(a);
			}
			else if(a.getScreenCode() == 20) {
				timeList2.add(a);
			}
			else if(a.getScreenCode() == 30) {
				timeList3.add(a);
			}
		}
		System.out.println(timeList1);
		System.out.println(timeList2);
		System.out.println(timeList3);
		
		mav.addObject("timeList", timeList);
		mav.addObject("timeList1", timeList1);
		mav.addObject("timeList2", timeList2);
		mav.addObject("timeList3", timeList3);
		if(day != 0) {
			mav.addObject("day", day);
		}else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			mav.addObject("day", sdf.format(new Date()));
		}
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
		String c = (String) map.get("selectSeat");
		String[] a = c.split(",");
		int insertSeat = 0;
		int insertReserve = 0;
		ReserveTimeVo reserveTimeVo = reserveDao.getReserveTime((String) map.get("timeCode"));
		
		try {
			for(int i=0; i<a.length ; i++) {
				ReserveVo reserveVo = new ReserveVo();
				reserveVo.setEmail((String)map.get("email"));
				reserveVo.setMovieCode(reserveTimeVo.getMovieCode());
				reserveVo.setScreenCode(reserveTimeVo.getScreenCode());
				reserveVo.setSelectSeat(a[i]);
				int seatCode = reserveDao.getSeatCode();
				reserveVo.setSeatCode(seatCode);
				reserveVo.setTimeCode(reserveTimeVo.getTimeCode());
				insertSeat = reserveDao.insertSeat(reserveVo);
				insertReserve = reserveDao.insertReserve(reserveVo);
				Map maps = new HashMap<>();
				int d = reserveDao.getReserveCount((String)map.get("email"));
				int grade = 0;
				if(d >= 30) {
					grade = 3;
					maps.put("email", (String)map.get("email"));
					maps.put("grade", grade);
					memberDao.gradeUpdate(maps);
				}else if(d >= 15) {
					grade = 2;
					maps.put("email", (String)map.get("email"));
					maps.put("grade", grade);
					memberDao.gradeUpdate(maps);
				}
				
			}
			
			if((insertSeat == 1) && (insertReserve == 1)) {
				mav.setViewName("reserveSuccess");
			}else {
				mav.setViewName("reserveFail");
			}
		}
		catch(Exception e) {
			mav.addObject("reserveCode", reserveTimeVo.getTimeCode());
			mav.setViewName("reserveFail");
		}
		System.out.println(map.get("selectSeat"));
		return mav;
		
	}
	
}


































