package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dao.QuestionDao;
import com.model.AnswerVo;
import com.model.MemberVo;
import com.model.QuestionFileVo;
import com.model.QuestionVo;
import com.service.UploadService;

import javassist.bytecode.annotation.MemberValueVisitor;

@Controller
@RequestMapping("/question")
public class QuestionController {

	@Autowired
	QuestionDao questionDao;

	@Autowired
	UploadService uploadService;

	@RequestMapping("/send.do")
	public ModelAndView sendHandle(@SessionAttribute(name = "auth") MemberVo vo,
			@RequestParam(value = "num", defaultValue = "1") int num) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("writer", vo.getEmail());

		map.put("num", num);
		List<QuestionVo> qlist = questionDao.getQuestionByReceiver(map);

		int count = questionDao.getQuestionByReceiverCount(vo.getEmail());
		int max = count / 10 + ((count % 10) > 0 ? 1 : 0);
		int page = (num / 5) + ((num % 5) > 0 ? 1 : 0);
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

		// System.out.println(max+"/"+page+"/"+minpage+"/"+maxpage+"/"+num);

		mav.setViewName("el.question");
		mav.addObject("qlist", qlist);
		mav.addObject("page", pages);
		mav.addObject("contents", "/WEB-INF/view/quest/question.jsp");

		mav.addObject("contents2", "/WEB-INF/view/quest/send.jsp");
		return mav;
	}

	@RequestMapping("/sended.do")
	public ModelAndView sendedHandle(@ModelAttribute QuestionVo vo, @RequestParam("attach") MultipartFile files
	/* ,@SessionAttribute(name="auth") MemverVo auth */) {
		ModelAndView mav = new ModelAndView();
		int seq = questionDao.getQuestSequence();
		vo.setNum(seq);
		try {
			int r = questionDao.addQuestion(vo);
			if (!files.isEmpty()) {
				QuestionFileVo fvo = uploadService.execute(files, seq);
				questionDao.addAttach(fvo);
			}
			mav.setViewName("el.question2");
			mav.addObject("contents", "/WEB-INF/view/quest/sended.jsp");
			mav.addObject("qvo", vo);
		} catch (Exception e) {
			e.printStackTrace();
			mav.setViewName("el.question2");
			mav.addObject("contents", "/WEB-INF/view/quest/error.jsp");
		}
		return mav;
	}

	@RequestMapping("/show.do")
	public ModelAndView showHandle(@SessionAttribute(name = "auth") MemberVo vo, @RequestParam(name = "no") int no) {
		ModelAndView mav = new ModelAndView();
		QuestionVo qvo = questionDao.getQuestionByNo(no);
		QuestionFileVo qfvo = questionDao.getQuestionFileByParent(no);
		List<AnswerVo> avo = questionDao.getAnswerParent(no);
		mav.setViewName("el.question2");
		mav.addObject("contents", "/WEB-INF/view/quest/show.jsp");
		mav.addObject("qvo", qvo);
		mav.addObject("attach", qfvo);
		mav.addObject("avo", avo);

		return mav;
	}

	@RequestMapping("/delete.do")
	public ModelAndView deleteHandle(@RequestParam(name = "no") int no) {
		ModelAndView mav = new ModelAndView();
		int f = questionDao.deleteQuestionfile(no);
		int a = questionDao.deleteAnswer(no);
		int r = questionDao.deleteQuestion(no);
		if (r == 1) {
			mav.setViewName("redirect:/question/send.do");
		} else {
			mav.setViewName("el.question2");
			mav.addObject("contents", "/WEB-INF/view/quest/error.jsp");
		}
		return mav;
	}

	@RequestMapping("/error.do")
	public ModelAndView errorHandle() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("el.question2");
		mav.addObject("contents", "/WEB-INF/view/quest/error.jsp");

		return mav;
	}

	@RequestMapping("/deleted.do")
	public ModelAndView deletedHandle(@RequestParam Map map) {
		ModelAndView mav = new ModelAndView();
		List<String> list = new ArrayList<>(map.keySet());
		for (int i = 0; i < list.size(); i++) {
			// System.out.println(list.get(i));
			int no = Integer.parseInt(list.get(i));
			questionDao.deleteQuestionfile(no);
			questionDao.deleteAnswer(no);
			questionDao.deleteQuestion(no);
		}
		mav.setViewName("redirect:/question/send.do");
		/*
		 * if(r == 1) { mav.setViewName("redirect:/question/send.do"); }else {
		 * mav.setViewName("el.question2"); mav.addObject("contents",
		 * "/WEB-INF/view/quest/error.jsp"); }
		 */
		return mav;
	}

}
