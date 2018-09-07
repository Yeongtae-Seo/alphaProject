<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div align="center">
<div style="width:70%;">
	<h2>영 화 예 매</h2>
	<div style="background-color:#FAF4C0;">
		<c:forEach var="day" begin="${selectDay }" end="20180910" step="1" >
			<a href="/reserve/page.do?day=${day }"><button class="w3-button w3-hover-light-grey" >${day%201809 } </button></a>
		</c:forEach>
	</div>
	<div >
		${day }
		<h3>1관</h3>
		<c:forEach items="${timeList1 }" var="list">
			<%-- <c:choose>
				<c:when test="${list.screenCode == 10 }">
					<a href="/reserve/selectSeat.do?reserveCode=${list.timeCode }">
						<button class="w3-button w3-border w3-hover-light-grey" style="width:10%;">${list.movieName}<hr/>${list.startTime }</button>
					</a>
				</c:when>
			</c:choose> --%>
				<a href="/reserve/selectSeat.do?reserveCode=${list.timeCode }">
						<button class="w3-button w3-border w3-hover-light-grey" style="width:10%;">${list.movieName}<hr/>${list.startTime }</button>
					</a>
		</c:forEach>
		
		<h3>2관</h3>
		<c:forEach items="${timeList2 }" var="list">
			<%-- <c:choose>
				<c:when test="${list.screenCode == 20 }">
					<a href="/reserve/selectSeat.do?reserveCode=${list.timeCode }">
						<button class="w3-button w3-border w3-hover-light-grey" style="width:10%;">${list.movieName}<hr/>${list.startTime }</button>
					</a>
				</c:when>
			</c:choose> --%>
			<a href="/reserve/selectSeat.do?reserveCode=${list.timeCode }">
						<button class="w3-button w3-border w3-hover-light-grey" style="width:10%;">${list.movieName}<hr/>${list.startTime }</button>
					</a>
		</c:forEach>
		
		<h3>3관</h3>
		<c:forEach items="${timeList3 }" var="list">
			<%-- <c:choose>
				<c:when test="${list.screenCode == 30 }">
					<button class="w3-button w3-border w3-hover-light-grey" style="width:10%;">${list.movieName}<hr/>${list.startTime }</button>
				</c:when>
			</c:choose> --%>
			<a href="/reserve/selectSeat.do?reserveCode=${list.timeCode }">
						<button class="w3-button w3-border w3-hover-light-grey" style="width:10%;">${list.movieName}<hr/>${list.startTime }</button>
					</a>
		</c:forEach>
		
		<%-- <h3>4관</h3>
		<c:forEach items="${timeList }" var="list">
			<c:choose>
				<c:when test="${list.screenCode == 40 }">
					<button class="w3-button w3-border w3-hover-light-grey" style="width:10%;">${list.movieName}<hr/>${list.startTime }</button>
				</c:when>
			</c:choose>
		</c:forEach> --%>
	</div>
	
</div>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>