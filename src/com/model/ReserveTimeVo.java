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
	
	@Override
	public String toString() {
		return "ReserveTimeVo [timeCode=" + timeCode + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", movieTime=" + movieDate + ", movieCount=" + movieCount + ", screenCode=" + screenCode
				+ ", movieCode=" + movieCode + "]";
	}
	
	
}


























