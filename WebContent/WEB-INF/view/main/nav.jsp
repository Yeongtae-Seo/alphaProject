<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
body {
	font-family: "Times New Roman", Georgia, Serif;
}

h1, h2, h3, h4, h5, h6 {
	font-family: "Playfair Display";
	letter-spacing: 5px;
}

#navA {
	text-decoration: none;
}

#navB {
	color: blue;
	font-style: italic;
}
</style>
<div class="w3-top">
	<div class="w3-bar w3-white w3-padding w3-card"
		style="letter-spacing: 4px;">
		<a href="/index.do" class="w3-bar-item w3-button">29 CINEMA</a>
		<div class="w3-right w3-hide-small">
			<c:choose>
				<c:when test="${!empty sessionScope.auth}">
					<c:if test="${auth.grade eq 0}">
						<a id="navA" href="/master/showmember.do"
							class="w3-bar-item w3-button">MASTER</a>
					</c:if>
					<a id="navB" href="/myPage/myPage.do" class="w3-bar-item w3-button">${sessionScope.auth.email}</a>
					<a id="navA" href="/logout.do" class="w3-bar-item w3-button">Logout</a>
					<a id="navA" href="/info.do?num=1&page=1&viewPage=1"
						class="w3-bar-item w3-button">InFo</a>
					<a id="navA" href="/customer/center.do"
						class="w3-bar-item w3-button">Customer</a>
					<a id="navA" href="/question/send.do" class="w3-bar-item w3-button">Question</a>
				</c:when>
				<c:otherwise>
					<a id="navA" href="/login.do" class="w3-bar-item w3-button">Login</a>
					<a id="navA" href="/join.do" class="w3-bar-item w3-button">Join</a>
					<a id="navA" href="/info.do?num=1&page=1&viewPage=1"
						class="w3-bar-item w3-button">Info</a>
					<a id="navA" href="/customer/center.do"
						class="w3-bar-item w3-button">Customer</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
