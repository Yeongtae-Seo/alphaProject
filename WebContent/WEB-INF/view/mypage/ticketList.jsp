<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<div class="w3-container" style="height: 30px;">
	<span class="w3-tag w3-xxlarge w3-padding w3-red"
		style="transform: rotate(-10deg)"> &nbsp;&nbsp;- Ticketing List🔖&nbsp;&nbsp; </span>
</div>

<div class="w3-cell-row">
<div class="w3-container w3-col s2">
</div>
<div class="w3-container w3-col s8">
<br />
<br />
<br />

<table class="w3-table-all w3-card-4 w3-hoverable">
<form action="/myPage/cancelPage.do">
	<tr>
		<th><input type="checkbox"></th>
		<th style="width: 30%">영화제목</th>
		<th>예약정보</th>
	</tr>
	<c:forEach items="${list }" var="ticketing">
		<tr>
			<td><input type="checkbox" name="${ticketing.seatcode }" value="${ticketing.seatcode }"></td>
			<td>${ticketing.moviename }
			</td>
			<td>${ticketing.moviedate }(${ticketing.starttime })&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;${ticketing.selectseat }&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;${ticketing.name }
			</td>
		</tr>
	</c:forEach>
</table>

		<div class="w3-bar" align="center">
			<c:if test = "${page.page ne 1}" >	<!-- 뒤로가기 버튼은 1이 아닐 때만 나옴 -->
				<a href="/myPage/historyHandle.do?num=${page.minpage-5}" ><button type="button" class="w3-button w3-black w3-round-large">◀</button></a>
			</c:if>
			<c:forEach var="i" begin="${page.minpage }" end="${page.maxpage }">
				<c:choose>
					<c:when test="${i eq page.num }">	<!-- i와 페이지넘버가 같으면 해야할 버튼처리 -->
						<span class="w3-button">${i }</span>
					</c:when>
					<c:otherwise>
						<a href="/myPage/historyHandle.do?num=${i }" class="w3-button"><span>${i}</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test = "${page.maxpage lt page.max}" >
				<a href="/myPage/historyHandle.do?num=${page.maxpage+1}"><button type="button" class="w3-button w3-black w3-round-large">▶</button></a>
			</c:if>
		</div>


	<p align="center">
		<button class="w3-button w3-black w3-round-large" type="submit">cancel</button></a>
	</p>
	</form>
</div>
</div>


