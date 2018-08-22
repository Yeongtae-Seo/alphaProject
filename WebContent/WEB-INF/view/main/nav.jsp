<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="w3-top" >
	<div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing: 4px;">
		<a href="#home" class="w3-bar-item w3-button">M o v i e</a>
		<!-- Right-sided navbar links. Hide them on small screens -->
		<div class="w3-right w3-hide-small" >
			<!-- <a href="#about" class="w3-bar-item w3-button">About</a> <a
				href="#menu" class="w3-bar-item w3-button">Menu</a> <a
				href="#contact" class="w3-bar-item w3-button">Contact</a> -->
			<c:choose>
				<c:when test="${!empty sessionScope.auth}">s
					<a id="navA" href="/logout.do" class="w3-bar-item w3-button">Logout</a>
					<a id="navA" href="/info.do" class="w3-bar-item w3-button">InFo</a>
					<a id="navA" href="/customer.do" class="w3-bar-item w3-button">Customer</a>
					<a id="navA" href="/question.do" class="w3-bar-item w3-button">Question</a>
				</c:when>
				<c:otherwise>
					<a id="navA" href="/login.do" class="w3-bar-item w3-button">Login</a>
					<a id="navA" href="/join.do" class="w3-bar-item w3-button">Join</a>
					<a id="navA" href="/info.do" class="w3-bar-item w3-button">InFo</a>
					<a id="navA" href="/customer.do" class="w3-bar-item w3-button">Customer</a>					
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
<%-- <div>
	<c:choose>
		<c:when test="${!empty sessionScope.auth}">
			<a id="navA" href="/logout.do">로그아웃</a>&nbsp;&nbsp;
		<a id="navA" href="/info.do">공지사항</a>&nbsp;&nbsp;
		<a id="navA" href="/customer.do">고객센터</a>
		</c:when>
		<c:otherwise>
			<a id="navA" href="/login.do">로그인</a>&nbsp;&nbsp;
		<a id="navA" href="/memberInsert.do">회원가입</a>&nbsp;&nbsp;
		<a id="navA" href="/info.do">공지사항</a>&nbsp;&nbsp;
		<a id="navA" href="/customer.do">고객센터</a>&nbsp;&nbsp;
	</c:otherwise>
	</c:choose>
</div>
 --%>