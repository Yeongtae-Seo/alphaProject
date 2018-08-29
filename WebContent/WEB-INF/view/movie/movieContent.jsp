<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<!-- 영화 메인 -->
<div style="height: 20px"></div>
<!-- 상단 여백 -->

<div class="w3-container" align="center">
	<a href="/movieList.do"><button class="w3-button w3-green">평점순</button></a>
</div>

<div class="w3-container" align="center">
	<!-- 영화 -->
	<c:forEach var="mo" items="${movie}" varStatus="movie">

		<div class="w3-container w3-center">
			<img src="img_avatar3.png" alt="Avatar" style="width: 80%">
			<div class="w3-section">
				<h5>${mo.moviename}</h5>
				&nbsp;
				<c:if test="${mo.grade}"></c:if>
			</div>
			<div class="w3-section">
				<button class="w3-button">예매하기</button>
				<button class="w3-button">상세보기</button>
			</div>

			<c:if test="${(movie%3) eq 0}">
				<!-- 4개 출력되면 다음 줄로 출력되게 처리 -->
				<br />
				<br />
			</c:if>
	</c:forEach>
</div>
