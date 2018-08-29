<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<div style="height: 80px"></div>
<div align="center">
	<h1>계정 삭제 비밀번호 확인</h1>
	<br />
	<form class="w3-container" action="/withdrawal.do" method="post" autocomplete="off">
		<div align="center" style="width: 500px">
			<input type="hidden" value="${person.email }" name="email" />
			<b>${person.email }</b>(${person.birth })<br/><br/>
			<label>- Password</label><br/>
			<small>(숫자와 문자 포함 6자리 이상 입력)</small>
			<input class="w3-input" type="password" name="pass" id="pass" value="${person.pass }" required />
			<span id="passCheck"></span>
		</div>
		<p>
			<button class="w3-button w3-black w3-round-large" type="submit">submit</button>
			<button class="w3-button w3-black w3-round-large" type="reset">reset</button>
		</p>
	<p align="left">
		<a href="/withdrow.do"><button class="w3-button w3-black w3-round-large" type="button">withdrawal</button></a>
	</p>
		
	</form>
</div>


	