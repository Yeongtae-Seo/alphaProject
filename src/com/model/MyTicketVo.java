package com.model;

import java.sql.Date;

public class MyTicketVo {

	int reservecode;
	String email;
	String timecode;
	int moviecode;
	int seatcode;
	int screencode;
	String selectseat;
	Date starttime;
	Date endtime;
	Date moviedate;
	int moviecount;
	String name;
	String moviename;
	String starttimes;
	
	public int getReservecode() {
		return reservecode;
	}
	public void setReservecode(int reservecode) {
		this.reservecode = reservecode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTimecode() {
		return timecode;
	}
	public void setTimecode(String timecode) {
		this.timecode = timecode;
	}
	public int getMoviecode() {
		return moviecode;
	}
	public void setMoviecode(int moviecode) {
		this.moviecode = moviecode;
	}
	public int getSeatcode() {
		return seatcode;
	}
	public void setSeatcode(int seatcode) {
		this.seatcode = seatcode;
	}
	public int getScreencode() {
		return screencode;
	}
	public void setScreencode(int screencode) {
		this.screencode = screencode;
	}
	public String getSelectseat() {
		return selectseat;
	}
	public void setSelectseat(String selectseat) {
		this.selectseat = selectseat;
	}
	public Date getStarttime() {
		return starttime;
	}
	public void setStarttime(Date starttime) {
		this.starttime = starttime;
	}
	public Date getEndtime() {
		return endtime;
	}
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}
	public Date getMoviedate() {
		return moviedate;
	}
	public void setMoviedate(Date moviedate) {
		this.moviedate = moviedate;
	}
	public int getMoviecount() {
		return moviecount;
	}
	public void setMoviecount(int moviecount) {
		this.moviecount = moviecount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMoviename() {
		return moviename;
	}
	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	public String getStarttimes() {
		return starttimes;
	}
	public void setStarttimes(String starttimes) {
		this.starttimes = starttimes;
	}
	
	@Override
	public String toString() {
		return "MyTicketVo [reservecode=" + reservecode + ", email=" + email + ", timecode=" + timecode + ", moviecode="
				+ moviecode + ", seatcode=" + seatcode + ", screencode=" + screencode + ", selectseat=" + selectseat
				+ ", starttime=" + starttime + ", endtime=" + endtime + ", moviedate=" + moviedate + ", moviecount="
				+ moviecount + ", name=" + name + ", moviename=" + moviename + ", starttimes=" + starttimes + "]";
	}
	
}
