package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.MyTicketVo;

@Repository
public class MyTicketDao {
	@Autowired
	SqlSessionTemplate template;
	
	public List<MyTicketVo> findList(Map map) {
		return template.selectList("myTicket.ticketList", map);
	}

	public int ticketDel(int num) {
		return template.delete("myTicket.ticketDel", num);
	}
	
	public int ticketRem(int num) {
		return template.delete("myTicket.ticketRem", num);
	}

	public int getfindlistCount(String email) {
		return template.selectOne("myTicket.getfindlistCount", email);
	}
	
}
