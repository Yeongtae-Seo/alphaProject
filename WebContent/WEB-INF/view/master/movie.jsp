<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<h2 align="center">상영작 목록</h2>

<table class="w3-table-all w3-card-4 w3-hoverable">
	<tr>
		<th><input type="checkbox"></th>
		<th>num</th>
		<th style="width: 50%">title</th>
		<th>date</th>
	</tr>
	<c:forEach var="qvo" items="${qlist}">
		<tr>
			<td><input type="checkbox" name="${qvo.num }"
				value="${qvo.num }"></td>
			<td>${qvo.num }</td>
			<td><a href="/master/readMovie.do?no=${qvo.num }"
				style="text-decoration: none"> <c:set var="ct"
						value="${fn:escapeXml(qvo.movieName) }" /> <c:choose>
						<c:when test="${fn:length(ct) gt 21 }">
							${fn:substring(ct,0,21) }··
							</c:when>
						<c:otherwise>
							${ct }
							</c:otherwise>
					</c:choose>
			</a></td>
			<td><fmt:formatDate value="${qvo.release }"
					pattern="yy-MM-dd [HH:mm]" /></td>
		</tr>
	</c:forEach>

</table>
</br>
<div class="w3-bar" align="center">
	<c:if test="${page.page ne 1}">
		<a href="/master/showMovie.do?num=${page.minpage-5}"><button
				type="button" class="w3-button w3-black w3-round-large">◀</button></a>
	</c:if>
	<c:forEach var="i" begin="${page.minpage }" end="${page.maxpage }">
		<c:choose>
			<c:when test="${i eq page.num }">
				<span class="w3-button">${i }</span>
			</c:when>
			<c:otherwise>
				<a href="/master/showMovie.do?num=${i }" class="w3-button"><span>${i}</span></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${page.maxpage lt page.max}">
		<a href="/master/showMovie.do?num=${page.maxpage+1}"><button
				type="button" class="w3-button w3-black w3-round-large">▶</button></a>
	</c:if>
</div>