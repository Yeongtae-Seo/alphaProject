package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dao.MovieDao;

@Controller
@RequestMapping("/movie")
public class MovieController {

	@Autowired
	MovieDao moviedao;

	@RequestMapping("/movieList.do")
	public ModelAndView movieListHandle() {

		ModelAndView mav = new ModelAndView();
		System.out.println(moviedao.getMovieGrade());
		mav.addObject("movie", moviedao.getMovieGrade());
		mav.setViewName("movie");

		return mav;
	}

}
