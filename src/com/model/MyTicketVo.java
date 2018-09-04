package com.model;

import java.sql.Date;

public class MyTicketVo {

	String moviename;
	Date moviedate;
	String name;
	String selectseat;
	String starttime;
	
	
	public String getMoviename() {
		return moviename;
	}
	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	public Date getMoviedate() {
		return moviedate;
	}
	public void setMoviedate(Date moviedate) {
		this.moviedate = moviedate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSelectseat() {
		return selectseat;
	}
	public void setSelectseat(String selectseat) {
		this.selectseat = selectseat;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	
	@Override
	public String toString() {
		return "MyTicketVo [moviename=" + moviename + ", moviedate=" + moviedate + ", name=" + name + ", selectseat="
				+ selectseat + ", starttime=" + starttime + "]";
	}
	
	
}
