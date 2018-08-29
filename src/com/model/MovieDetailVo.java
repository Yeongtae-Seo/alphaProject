package com.model;

import java.util.Date;

public class MovieDetailVo {

	int num;  //영화 고유 번호
	String movieName; //영화 이름
	Date release;  //개봉일 
	int rating;  //관람등급
	String genre;  //장르
	double grade;  //평점
	String sysnoopsis;  //시놉시스
	String cast; //배우
	String url;  //동영상 url
	int now; //현재 상영작 유뮤(1이 현재 상영, 2가 상영 예정) 
	
	
	
	@Override
	public String toString() {
		return "movieDetailVo [num=" + num + ", movieName=" + movieName + ", release=" + release + ", rating=" + rating
				+ ", genre=" + genre + ", grade=" + grade + ", sysnoopsis=" + sysnoopsis + ", cast=" + cast + ", url="
				+ url + ", now=" + now + "]";
	}
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public Date getRelease() {
		return release;
	}
	public void setRelease(Date release) {
		this.release = release;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getSysnoopsis() {
		return sysnoopsis;
	}
	public void setSysnoopsis(String sysnoopsis) {
		this.sysnoopsis = sysnoopsis;
	}
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getNow() {
		return now;
	}
	public void setNow(int now) {
		this.now = now;
	}
	
	
	
	
	

}
