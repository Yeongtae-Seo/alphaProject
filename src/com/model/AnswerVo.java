package com.model;

import java.util.Date;

public class AnswerVo {
	int number;
	String aname;
	String acontent;
	int parent;
	Date adate;
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAcontent() {
		return acontent;
	}
	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public Date getAdate() {
		return adate;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
	}
	@Override
	public String toString() {
		return "AnswerVo [number=" + number + ", aname=" + aname + ", acontent=" + acontent + ", parent=" + parent
				+ ", adate=" + adate + "]";
	}
	
	
}
