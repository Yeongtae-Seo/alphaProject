package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.AnswerVo;
import com.model.QuestionFileVo;
import com.model.QuestionVo;


@Repository
public class QuestionDao {
	
	@Autowired
	SqlSessionTemplate template;
	
	public int getQuestSequence() {
		return template.selectOne("question.getQuestSequence");
	}
	
	public int addQuestion(QuestionVo vo) {
		return template.insert("question.addQuestion", vo);
	}
	
	public int addAttach(QuestionFileVo vo) {
		return template.insert("question.addAttach", vo);
	}
	
	public List<QuestionVo> getQuestionByReceiver(Map<String,Object> map) {
		return template.selectList("question.getQuestionByReceiver", map);
	}

	public QuestionFileVo getQuestionFileByParent(int no) {
		return template.selectOne("question.getQuestionFileByParent", no);
	}
	
	public QuestionVo getQuestionByNo(int no) {
		return template.selectOne("question.getQuestionByNo", no);
	}
	
	public int getQuestionByReceiverCount(String id) {
		return template.selectOne("question.getQuestionByReceiverCount",id);
	}
	
	public List<AnswerVo> getAnswerParent(int no) {
		return template.selectList("question.getAnswerParent",no);
	}
	
	public int deleteQuestion(int no ) {
		return template.delete("question.deleteQuestion", no);
	}
	
	public int deleteQuestionfile(int no) {
		return template.delete("question.deleteQuestionfile", no);
	}
	
	public int deleteAnswer(int no) {
		return template.delete("question.deleteAnswer",no);
	}
	
}
