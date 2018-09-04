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


	<tr>
		<th><input type="checkbox"></th>
		<th style="width: 30%">영화제목</th>
		<th>예약정보</th>

	</tr>
	<c:forEach items="${list }" var="ticketing">
		<tr>
			<td><input type="checkbox"></td>
			<td>${ticketing.moviename }
			</td>
			<td>${ticketing.moviedate }(${ticketing.starttime })&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;${ticketing.selectseat }&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;${ticketing.name }
			</td>
		</tr>
	</c:forEach>


</table>
</div>
</div>


