package com.dao;

import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import com.model.MovieDetailVo;

@Repository
public class MovieDao {
	
	@Autowired
	SqlSessionTemplate template;
	
	@Autowired
	MongoTemplate mongo;

	// 1.관리자 - 영화 데이터 입력 
	public void addMovie(MovieDetailVo vo) {
		template.insert("movie.addMovie",vo);
	}
	//  2.관리자 - 영화 데이터 수정 
	public void updateMovie(MovieDetailVo vo) {
		template.insert("movie.updateMovie",vo);
	}
	// 3.관리자 - 영화 데이터 삭제 
	public void deleteMovie(int num) {
		template.insert("movie.deleteMovie",num);
	}
	// 4.영화 상세 정보 가져오기 
	public List getMovie(int num) {
		return template.selectList("movie.getMovie",num);
	}
	// 5.영화 평점순 가져오기
	public List getMovieGrade() {
		return template.selectList("movie.getMovieGrade");
	}
	//6.영화 장르 가져오기
	public List getGenre() {
		return template.selectList("movie.getGenre");
	}
	//7.영화 관람등급 가져오기
	public List getRating() {
		return template.selectList("movie.getRating");
	}
	//========================================================
	//8.mongoDB 리뷰 등록
	public void addReview(Map map) {
		mongo.insert(map, "reviewTest");
	}
	
	//9.mongoDB 리뷰 가져오기
	public List<Map> getReview(String num) {
		Query query = (Query) new BasicQuery(new Document().append("num",num));
		return mongo.find(query, java.util.Map.class, "reviewTest");
	}
}
