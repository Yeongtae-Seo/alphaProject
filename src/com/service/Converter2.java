package com.service;

import java.sql.Date;

public class Converter2 {

	public Date convertToDate(String str) {

	      long time =   new java.util.Date(str).getTime();
	      
	      return new Date(time);
	   }
}
