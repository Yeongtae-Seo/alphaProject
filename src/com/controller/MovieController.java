package com.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dao.MovieDao;

@Controller
@RequestMapping("/movie")
public class MovieController {

	@Autowired
	MovieDao moviedao;

	//영화 페이지
	@RequestMapping("/movieList.do")
	public ModelAndView movieListHandle() {

		ModelAndView mav = new ModelAndView();
		//System.out.println(moviedao.getMovieGrade());  
		mav.addObject("movie", moviedao.getMovieGrade());  //영화 평점순으로 정렬하여 데이터 가져오기
		mav.setViewName("movie");

		return mav;
	}
	
	//영화 관리자 페이지
	@RequestMapping("/movieManager.do")
	public ModelAndView movieManagerHandle() {

		ModelAndView mav = new ModelAndView();
		mav.addObject("genre", moviedao.getGenre());  //영화 장르 가져오기
		mav.addObject("rating", moviedao.getRating());  //영화 관람등급 가져오기
		mav.setViewName("manager");

		return mav;
	}
	
	//
	@RequestMapping("/insertManager.do")
	public ModelAndView insertManagerHandle() {

		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	//영화 상세 페이지
	@RequestMapping("/movieDetail.do")
	public ModelAndView detailHandle(@RequestParam("num") int num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("movie", moviedao.getMovie(num));  //영화 전체 정보 가져오기
		mav.addObject("allReview",moviedao.getReview(String.valueOf(num)));  //전체 댓글 리스트
		mav.addObject("num",num);
		mav.setViewName("detail");		
		return mav;
	}
	
	
	//영화 댓글 페이지
	@RequestMapping(path = "/comment.do", produces = "application/json;chatset=utf-8")
	@ResponseBody
	public ModelAndView commentHandle(@RequestParam Map map) {
		//System.out.println("mongo done"+map);
		moviedao.addReview(map); // DB에 댓글 등록
		String num = (String) map.get("num");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("detail");
		mav.addObject("allReview",moviedao.getReview(num));  //전체 댓글 리스트
		return mav;
		
	}

	
	//test 페이지
	@RequestMapping("/videoTest.do")
	public String testHandle() {
		return "/videoTest";	
	}
		
	
	
}
