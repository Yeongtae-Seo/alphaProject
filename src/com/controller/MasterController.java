package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.dao.InfoDao;
import com.dao.MasterDao;
import com.dao.MovieDao;
import com.dao.QuestionDao;
import com.model.AnswerVo;
import com.model.CustomerVo;
import com.model.InfoFileVo;
import com.model.InfoVo;
import com.model.MemberVo;
import com.model.MovieDetailVo;
import com.model.QuestionFileVo;
import com.model.QuestionVo;

@Controller
@RequestMapping("/master")
public class MasterController {
	@Autowired
	MasterDao masterDao;
	
	@Autowired
	InfoDao infoDao;
	
	@Autowired
	QuestionDao questionDao;
	
	@Autowired
	MovieDao movieDao;
	
	@RequestMapping("/showmember.do")
	public ModelAndView showMember() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("el.master");
		mav.addObject("contents", "/WEB-INF/view/master/member.jsp");
		return mav;
	}
	
	@RequestMapping("/mdeleteid.do")
	public ModelAndView deleteIdHandle(@RequestParam(name="id") String id) {
		ModelAndView mav = new ModelAndView();
		int r = masterDao.DeleteId(id);
		if(r==1) {
			mav.setViewName("el.master");
			mav.addObject("contents", "/WEB-INF/view/master/membered.jsp");
		}else {
			mav.setViewName("el.master");
			mav.addObject("contents", "/WEB-INF/view/master/error.jsp");
		}
		return mav;
	}
	
	@RequestMapping("/mupdateId.do")
	public ModelAndView updateIdHandle(@RequestParam(name="no")int no,@RequestParam(name="id") String id) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("id", id);
		map.put("no", no);
		int r = masterDao.UpdateId(map);
		if(r==1) {
			mav.setViewName("el.master");
			mav.addObject("contents", "/WEB-INF/view/master/membered.jsp");
		}else {
			mav.setViewName("el.master");
			mav.addObject("contents", "/WEB-INF/view/master/error.jsp");
		}
		return mav;
	}
	
	@RequestMapping("/info.do")
	public ModelAndView infoHandle(@RequestParam int num, int page, int viewPage) {				// 공지 사항 페이지로 이동하는 메소드
		ModelAndView mav = new ModelAndView();
		List<InfoVo> list = infoDao.getList(viewPage);
		int pageCount = infoDao.getPageCount(page);
		double aa = (double)pageCount/10;
		mav.addObject("list", list);
		mav.addObject("num", num);
		mav.addObject("pageCount", Math.ceil(aa));
		mav.addObject("page", page);
		mav.setViewName("el.master");
		mav.addObject("contents","/WEB-INF/view/info/info.jsp");
		return mav;
	}
	
	@RequestMapping("/readInfo.do")
	public ModelAndView readInfo(@RequestParam int num) {
		ModelAndView mav = new ModelAndView();
		InfoVo vo = infoDao.getReadCustomer(num);
		InfoFileVo fvo = infoDao.getInfoFile(num);
		mav.addObject("InfoVo", vo);
		mav.addObject("infoFile", fvo);
		mav.setViewName("readInfo");
		mav.setViewName("el.master");
		mav.addObject("contents","/WEB-INF/view/info/readInfo.jsp");
		return mav;
	}
	
	@RequestMapping("/showCustomer.do")
	public ModelAndView showCustomer() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("el.master");
		mav.addObject("contents", "/WEB-INF/view/customer/writeFaq.jsp");
		return mav;
	}
	
	@RequestMapping("/addFaq.do")
	public ModelAndView addFaq(@ModelAttribute CustomerVo vo) {
		ModelAndView mav = new ModelAndView();
		vo.setCount(0);
		//System.out.println(vo);
		int r = masterDao.addFaq(vo);
		if(r==1) {
			mav.setViewName("el.master");
			mav.addObject("contents", "/WEB-INF/view/customer/writeFaq.jsp");
		}else {
			mav.setViewName("el.master");
			mav.addObject("contents", "/WEB-INF/view/master/error.jsp");
		}
		return mav;
	}
	
	@RequestMapping("/showQuestion.do")
	public ModelAndView sendHandle(@SessionAttribute(name = "auth") MemberVo vo,
			@RequestParam(value = "num", defaultValue = "1") int num) {
		ModelAndView mav = new ModelAndView();

		List<QuestionVo> qlist = masterDao.getQuestionByAll(num);

		int count = masterDao.getQuestionByAllCount();
		int max = count / 10 + ((count % 10) > 0 ? 1 : 0);
		int page = (num/5)+ ((num % 5) > 0 ? 1 : 0);
		int minpage = page * 5 - 4;
		int maxpage = page * 5;
		if (maxpage > max) {
			maxpage = max;
		}

		Map<String, Object> pages = new HashMap<String, Object>();

		pages.put("max", max);
		pages.put("page", page);
		pages.put("minpage", minpage);
		pages.put("maxpage", maxpage);
		pages.put("num", num);
		
		//System.out.println(max+"/"+page+"/"+minpage+"/"+maxpage+"/"+num);
		
		mav.setViewName("el.master");
		mav.addObject("qlist", qlist);
		mav.addObject("page", pages);
		mav.addObject("contents", "/WEB-INF/view/master/question.jsp");

		return mav;
	}

	
	
	@RequestMapping("/readQuestion.do")
	public ModelAndView showHandle(@SessionAttribute(name="auth")MemberVo vo,@RequestParam(name="no")int no) {
		ModelAndView mav = new ModelAndView();
		QuestionVo qvo= questionDao.getQuestionByNo(no);
		QuestionFileVo qfvo = questionDao.getQuestionFileByParent(no);
		List<AnswerVo> avo = questionDao.getAnswerParent(no);
		mav.setViewName("el.master");
		mav.addObject("contents", "/WEB-INF/view/quest/show.jsp");
		mav.addObject("qvo", qvo);
		mav.addObject("attach", qfvo);
		mav.addObject("avo", avo);
		
		return mav;
	}
	
	@RequestMapping("/answer.do")
	public ModelAndView answerHandle(@RequestParam int num) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("answerNum", num);
		mav.setViewName("el.master");
		mav.addObject("contents", "/WEB-INF/view/master/answer.jsp");
		return mav;
	}
	
	@RequestMapping("/addAnswer.do")
	public ModelAndView addAnswerHandle(@ModelAttribute AnswerVo vo) {
		ModelAndView mav = new ModelAndView();
		//System.out.println(vo);
		int r = masterDao.addAnswer(vo);
		if(r==1) {
			mav.setViewName("redirect:/master/showQuestion.do");
			}else {
			mav.setViewName("el.master");
			mav.addObject("contents", "/WEB-INF/view/master/error.jsp");
		}
		return mav;
	}
	
	@RequestMapping("/showMovie.do")
	public ModelAndView showMovieHandle(@SessionAttribute(name = "auth") MemberVo vo,
			@RequestParam(value = "num", defaultValue = "1") int num) {
		ModelAndView mav = new ModelAndView();

		List<MovieDetailVo> qlist = masterDao.getMovieByAll(num);

		int count = masterDao.getMovieByAllCount();
		int max = count / 10 + ((count % 10) > 0 ? 1 : 0);
		int page = (num/5)+ ((num % 5) > 0 ? 1 : 0);
		int minpage = page * 5 - 4;
		int maxpage = page * 5;
		if (maxpage > max) {
			maxpage = max;
		}

		Map<String, Object> pages = new HashMap<String, Object>();

		pages.put("max", max);
		pages.put("page", page);
		pages.put("minpage", minpage);
		pages.put("maxpage", maxpage);
		pages.put("num", num);
		
		//System.out.println(max+"/"+page+"/"+minpage+"/"+maxpage+"/"+num);
		
		mav.setViewName("el.master");
		mav.addObject("qlist", qlist);
		mav.addObject("page", pages);
		mav.addObject("contents", "/WEB-INF/view/master/movie.jsp");
		
		return mav;
	}
	
	@RequestMapping("/readMovie.do")
	public ModelAndView readMovieHandle(@SessionAttribute(name="auth")MemberVo vo,@RequestParam(name="no")int no) {
		ModelAndView mav = new ModelAndView();
		MovieDetailVo qvo= masterDao.getMovieByNo(no);
		//QuestionFileVo qfvo = questionDao.getQuestionFileByParent(no);
		//List<AnswerVo> avo = questionDao.getAnswerParent(no);
		mav.setViewName("el.master");
		mav.addObject("contents", "/WEB-INF/view/master/show.jsp");
		mav.addObject("qvo", qvo);
		//mav.addObject("attach", qfvo);
		//mav.addObject("avo", avo);
		
		return mav;
	}
	
}
