package com.model;

import java.util.Date;

import org.bson.types.ObjectId;

public class MovieReviewVo {

	ObjectId _id;  //_id
	int num;   //영화 번호
	String email;  //중복 방지용 사용자 이메일
	double grade;  //평점
	String comments;  //리뷰
	String username;  //사용자 이름
	Date regdate;   //등록 날짜
	public ObjectId get_id() {
		return _id;
	}
	public void set_id(ObjectId _id) {
		this._id = _id;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MovieReviewVo [_id=" + _id + ", num=" + num + ", email=" + email + ", grade=" + grade + ", comments="
				+ comments + ", username=" + username + ", regdate=" + regdate + "]";
	}
	
	
}
