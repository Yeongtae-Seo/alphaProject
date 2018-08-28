package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.ReserveTimeVo;

@Repository
public class ReserveDao {

	@Autowired
	SqlSessionTemplate template;
	
	public List<ReserveTimeVo> getMovieTime(Map map){
		
		return template.selectList("reserve.main", map);
	}
}
