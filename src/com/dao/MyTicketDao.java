package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.MyTicketVo;

@Repository
public class MyTicketDao {
	@Autowired
	SqlSessionTemplate template;
	
	public List<MyTicketVo> findList(String email) {
		return template.selectList("myTicket.ticketList", email);
	}

	public int ticketDel(int num) {
		return template.delete("myTicket.ticketDel", num);
	}
	
	public int ticketRem(int num) {
		return template.delete("myTicket.ticketRem", num);
	}
	
}
