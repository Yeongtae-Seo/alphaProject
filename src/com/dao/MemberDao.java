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
		return template.selectOne("member.findByPhone", pcheck);
	}
	
	public MemberVo cookieVo(String email) {
		return template.selectOne("member.cookieVo", email);
	}

	public int updateMember(MemberVo vo) {
		return template.update("member.changeAll", vo);	// update 하려면 template.update를 사용해야되고 
														// 조건에 따라서 parameter를 넣어야 함
	}	// member.changeAll은 사용할 mapper를 씀
	
	public int deleteMember (String email) {
		return template.delete("member.memberDel", email);
	}
	
	
}
