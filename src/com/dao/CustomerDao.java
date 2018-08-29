package com.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.CustomerVo;

@Repository
public class CustomerDao {
	
	@Autowired
	SqlSessionTemplate template;
	

	//1.Q&A insert
	public void addCustomer(CustomerVo vo) {
		template.insert("customer.addCustomer", vo);  
	}
	
	//2.Q&A delete
	public void deleteCustomer(int num) {
		template.delete("customer.deleteCustomer", num);  //�� ��ȣ�� �� ����
	}
	
	//3.Q&A update
	public void updateCustomer(CustomerVo vo) {
		template.update("customer.updateCustomer", vo);  
	}
	
	//4.카테고리별 데이터 가져오기
	public List<CustomerVo> getCategory(String category){
		return template.selectList("customer.getCategory", category);  
	}
	
	//5.전체 데이터 가져오기
	public List<CustomerVo> getAll(){
		return template.selectList("customer.getAll");  
	}
	
	//6.top5만 가져오기
	public List<CustomerVo> getTop5(){
		return template.selectList("customer.getTop5");
	}
	
	//7.카테고리별 데이터 갯수(특정 카테고리의 데이터 갯수)
	public List getCateCount() {
		return template.selectList("customer.getCateCount");
	}
	
	//8.전체 데이터 갯수(전체 카테고리의 데이터 갯수) 
	public int getAllCount() {
		return template.selectOne("customer.getAllCount");
	}
	
	//9.views(조회수 증가)
	public int addCount(int num) {
		return template.update("customer.addCount", num);  
	}
}
