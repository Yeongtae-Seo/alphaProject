package com.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.MemberVo;


@Repository
public class MemberDao {	// DB를 연결해줌
	@Autowired
	SqlSessionTemplate template;
	
	public int addMember(MemberVo vo) {	// 회원가입
		return template.insert("member.addMember", vo);
	}	// mapper에 있는 명령문이랑 연결해서 값을 받아 옴
	
	public MemberVo findByEmailAndPass(Map map) {	// 로그인
		return template.selectOne("member.findByEmailAndPass", map);
	}
	
	public int getSequence() {	// 순서
		return template.selectOne("member.getSequence");
	}

	public int emailCheck(String echeck) {	// 중복확인
		return template.selectOne("member.findByEmail", echeck);
	}
	public int phoneCheck(String pcheck) {
		return template.selectOne("memger.findByPhone", pcheck);
	}
	
	public MemberVo cookieVo(String email) {
		return template.selectOne("member.cookieVo", email);
		
	}
	
}
