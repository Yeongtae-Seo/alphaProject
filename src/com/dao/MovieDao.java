package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.MovieDetailVo;

@Repository
public class MovieDao {
	
	@Autowired
	SqlSessionTemplate template;

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
	public List<MovieDetailVo> getMovie() {
		return template.selectList("movie.getMovie");
	}
	// 5.영화 평점순 가져오기
	public List getMovieGrade() {
		return template.selectList("movie.getMovieGrade");
	}
}
