package com.model;

import java.sql.Date;

public class ReserveTimeVo {

	String timeCode;
	Date startTime;
	Date endTime;
	Date movieTime;
	int movieCount;
	int screenCode;
	int movieCode;
	
	public String getTimeCode() {
		return timeCode;
	}
	public void setTimeCode(String timeCode) {
		this.timeCode = timeCode;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Date getMovieTime() {
		return movieTime;
	}
	public void setMovieTime(Date movieTime) {
		this.movieTime = movieTime;
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
				+ ", movieTime=" + movieTime + ", movieCount=" + movieCount + ", screenCode=" + screenCode
				+ ", movieCode=" + movieCode + "]";
	}
	
	
}


























