<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div align="center">
	<br/>
	이미 예약 되 있는 좌석 입니다.<br/><br/>
	<a href="/reserve/selectSeat.do?reserveCode=${reserveCode }"><button type="button" class="w3-button w3-black w3-ripple w3-round">다시 예약</button></a>
	
</div>