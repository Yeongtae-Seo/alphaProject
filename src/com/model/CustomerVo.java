package com.model;

import java.util.Date;

//�� ���� 

public class CustomerVo {

	int num;	//�� ��ȣ
	String title;  //�� ����
	String content;  //�� ����
	Date regdate;	//�� �ۼ���
	String category;  //ī�װ�
	int count;		//��ȸ�� top5 Ȯ�ο�

	
	//---------------------------------------------------------------------------------------------------------
	
	
	@Override
	public String toString() {
		return "CustomerVo [num=" + num + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", category=" + category + ", count=" + count + "]";
	}

	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	


	
}
