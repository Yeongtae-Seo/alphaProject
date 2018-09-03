<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<div style="height: 30px"></div>
<div align="center">
	<h1>Login</h1>
	<br />
	<form action="<c:url value="/logining.do" />" method="post" autocomplete="off">
		<div align="center" style="width: 500px">
			<p>
				- Email <input class="w3-input w3-hover-black" type="text"
					name="email" id="email" required />
			</p>
			<p>
				- Password <input class="w3-input w3-hover-black" type="password"
					name="pass" id="pass" required /> <span id="loginCheck"></span>
			</p>
			<p style="color: red;">
				${fail }
			</p>
		</div>

		<p>
			<input type="checkbox" name="keep">keep logged in &nbsp;&nbsp;
			<button class="w3-button w3-black w3-round-large" type="submit"
				id="signin">Sign in</button>
		</p>
		</p>

	</form>
</div>


