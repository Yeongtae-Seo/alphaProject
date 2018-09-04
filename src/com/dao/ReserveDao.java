package com.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.ReserveTimeVo;
import com.model.ReserveVo;

@Repository
public class ReserveDao {

	@Autowired
	SqlSessionTemplate template;
	
	public List<ReserveTimeVo> getMovieTime(Map map){
		
		return template.selectList("reserve.main", map);
	}

	public ReserveTimeVo getReserveTime(String reserveCode) {
		
		return template.selectOne("reserve.getReserve", reserveCode);
	}
	
	public int getSeatCode() {
		return template.selectOne("reserve.getSeatCode");
	}

	public int insertSeat(ReserveVo reserveVo) {
		
		return template.insert("reserve.insertSeat", reserveVo);
	}

	public int insertReserve(ReserveVo reserveVo) {
		
		return template.insert("reserve.insertReserve", reserveVo);
	}
	
	public List<String> getSeat(String reserveCode){
		return template.selectList("reserve.getSeat", reserveCode);
	}

}




























