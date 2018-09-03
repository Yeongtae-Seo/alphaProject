package com.model;

public class ReserveVo {

	int reserveCode;
	String email;
	String timeCode;
	int movieCode;
	int seatCode;
	int screenCode;
	String selectSeat;
	
	public int getReserveCode() {
		return reserveCode;
	}
	public void setReserveCode(int reserveCode) {
		this.reserveCode = reserveCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTimeCode() {
		return timeCode;
	}
	public void setTimeCode(String timeCode) {
		this.timeCode = timeCode;
	}
	public int getMovieCode() {
		return movieCode;
	}
	public void setMovieCode(int movieCode) {
		this.movieCode = movieCode;
	}
	public int getSeatCode() {
		return seatCode;
	}
	public void setSeatCode(int seatCode) {
		this.seatCode = seatCode;
	}
	public int getScreenCode() {
		return screenCode;
	}
	public void setScreenCode(int screenCode) {
		this.screenCode = screenCode;
	}
	public String getSelectSeat() {
		return selectSeat;
	}
	public void setSelectSeat(String selectSeat) {
		this.selectSeat = selectSeat;
	}
	
	@Override
	public String toString() {
		return "ReserveVo [reserveCode=" + reserveCode + ", email=" + email + ", timeCode=" + timeCode + ", movieCode="
				+ movieCode + ", seatCode=" + seatCode + ", screenCode=" + screenCode + ", selectSeat=" + selectSeat
				+ "]";
	}
	
}
