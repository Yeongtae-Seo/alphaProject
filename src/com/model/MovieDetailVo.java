package com.model;

import java.util.Date;

public class MovieDetailVo {

	int num;  //영화 고유 번호
	String movieName; //영화 이름
	Date release;  //개봉일 
	int ratingcode;  //관람등급코드
	String genrecode;  //장르코드
	double grade;  //평점
	String synopsis;  //시놉시스
	String cast; //배우
	String url;  //동영상 url
	int now; //현재 상영작 유뮤(1이 현재 상영, 2가 상영 예정) 

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
	public int getRatingcode() {
		return ratingcode;
	}
	public void setRatingcode(int ratingcode) {
		this.ratingcode = ratingcode;
	}
	public String getGenrecode() {
		return genrecode;
	}
	public void setGenrecode(String genrecode) {
		this.genrecode = genrecode;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
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
	
	@Override
	public String toString() {
		return "MovieDetailVo [num=" + num + ", movieName=" + movieName + ", release=" + release + ", ratingcode="
				+ ratingcode + ", genrecode=" + genrecode + ", grade=" + grade + ", synopsis=" + synopsis + ", cast="
				+ cast + ", url=" + url + ", now=" + now + "]";
	}
	
	
	


}
