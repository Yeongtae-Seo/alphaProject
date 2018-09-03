package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.AnswerVo;
import com.model.CustomerVo;
import com.model.MovieDetailVo;
import com.model.QuestionVo;

@Repository
public class MasterDao {
	@Autowired
	SqlSessionTemplate template;
	
	public int DeleteId(String id) {
		return template.delete("master.deleteId",id);
	}
	
	public int UpdateId(Map map) {
		return template.update("master.updateId",map);
	}
	
	public int addFaq(CustomerVo vo) {
		return template.insert("master.addFaq", vo);
	}
	
	public List<QuestionVo> getQuestionByAll(int num){
		return template.selectList("master.getQuestionByAll",num);
	}
	
	public int getQuestionByAllCount() {
		return template.selectOne("master.getQuestionByAllCount");
	}
	
	public int addAnswer(AnswerVo vo) {
		return template.insert("master.addAnswer", vo);
	}
	
	public List<MovieDetailVo> getMovieByAll(int num){
		return template.selectList("master.getMovieByAll",num);
	}
	
	public int getMovieByAllCount() {
		return template.selectOne("master.getMovieByAllCount");
	}

	public MovieDetailVo getMovieByNo(int no) {
		return template.selectOne("master.getMovieByNo",no);
	}
	
	
}
