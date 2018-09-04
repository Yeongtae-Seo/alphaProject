package com.model;

import java.sql.Date;

public class ReserveTimeVo {

	String timeCode;
	String startTime;
	String endTime;
	Date movieDate;
	int movieCount;
	int screenCode;
	int movieCode;
	String movieName;
	String selectSeat;
	
	public String getTimeCode() {
		return timeCode;
	}
	public void setTimeCode(String timeCode) {
		this.timeCode = timeCode;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public Date getMovieTime() {
		return movieDate;
	}
	public void setMovieTime(Date movieTime) {
		this.movieDate = movieTime;
	}
	public int getMovieCount() {
		return movieCount;
	}
	public void setMovieCount(int movieCount) {
		this.movieCount = movieCount;
	}
	public int getScreenCode() {
		return screenCode;
	}
	public void setScreenCode(int screenCode) {
		this.screenCode = screenCode;
	}
	public int getMovieCode() {
		return movieCode;
	}
	public void setMovieCode(int movieCode) {
		this.movieCode = movieCode;
	}
	public Date getMovieDate() {
		return movieDate;
	}
	public void setMovieDate(Date movieDate) {
		this.movieDate = movieDate;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getSelectSeat() {
		return selectSeat;
	}
	public void setSelectSeat(String selectSeat) {
		this.selectSeat = selectSeat;
	}
	@Override
	public String toString() {
		return "ReserveTimeVo [timeCode=" + timeCode + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", movieDate=" + movieDate + ", movieCount=" + movieCount + ", screenCode=" + screenCode
				+ ", movieCode=" + movieCode + ", movieName=" + movieName + ", selectSeat=" + selectSeat + "]";
	}
	

	
}


























