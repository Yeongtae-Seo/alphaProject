package com.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dao.MovieDao;
import com.model.MemberVo;
import com.model.MovieReviewVo;

@Controller
@RequestMapping("/movie")
public class MovieController {

	@Autowired
	MovieDao moviedao;

	//영화 페이지
	@RequestMapping("/movieList.do")
	public ModelAndView movieListHandle() {

		ModelAndView mav = new ModelAndView();
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
	
	
	//영화 상세 페이지
	@RequestMapping("/movieDetail.do")
	public ModelAndView detailHandle(@RequestParam("num") int num, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("movie", moviedao.getMovie(num));  //영화 전체 정보 가져오기
		mav.addObject("allReview",moviedao.getReview(num));  //전체 댓글 리스트
		mav.addObject("g",moviedao.findGradeInc(num));
		mav.addObject("num",num);
		if(session.getAttribute("auth") == null) {
			
		}else {
			MemberVo vo = (MemberVo) session.getAttribute("auth");
			String email = vo.getEmail();
			mav.addObject("fr", moviedao.findReview(email,num));
			System.out.println(moviedao.findReview(email,num));
		}
		mav.setViewName("detail");		
		return mav;
	}
	
	
	//영화 댓글 페이지
	@RequestMapping(path = "/comment.do", produces = "application/json;chatset=utf-8")
	@ResponseBody
	public ModelAndView commentHandle(@ModelAttribute MovieReviewVo rvo, HttpSession session) {
		
		moviedao.addReview(rvo); // mongoDB에 댓글 등록

		if(moviedao.findGradeInc(rvo.getNum()).isEmpty()) {  //평점 처리를 위한 DB의 영화 번호가 이미 존재하면 
			Map gmap = new HashMap();
			gmap.put("num", rvo.getNum());
			gmap.put("grade", rvo.getGrade());
			gmap.put("cnt", 1);
			System.out.println("if : " + gmap);
			moviedao.addGradeInc(gmap);  //mongoDB에 새로운 평점 삽입
		}else {	//평점이 저장된 적 없는 영화라면
			Map gmap = new HashMap();
			gmap.put("num", rvo.getNum());
			gmap.put("grade",rvo.getGrade());
			gmap.put("cnt", 1);
			System.out.println("else : " + gmap);
			moviedao.setGradeInc(gmap);  //mongoDB에 평점 저장
		}
		
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("auth") == null) {
			System.out.println("null");
		}else {
			MemberVo vo = (MemberVo) session.getAttribute("auth");
			String email = vo.getEmail();
			mav.addObject("fr", moviedao.findReview(email,rvo.getNum()));
		}
	
		mav.addObject("allReview",moviedao.getReview(rvo.getNum()));  //전체 댓글 리스트
		mav.addObject("rvo",rvo);  //댓글 갱신용
		return mav;
		
	}

	
	//test 페이지
	@RequestMapping("/videoTest.do")
	public String testHandle() {
		return "/videoTest";	
	}
	
}
