<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
em {
	color: #cc0000;
}
</style>

<!-- 영화 메인 -->
<div style="height: 20px"></div>
<!-- 상단 여백 -->

<div class="w3-container" align="center">
	<a href="/movie/movieList.do?now=1"><button
			class="w3-button w3-white w3-border">현재 상영작</button></a> <a
		href="/movie/movieList.do?now=2"><button
			class="w3-button w3-white w3-border">상영 예정작</button></a>
</div>

<!-- 영화 -->
<div class="w3-row-padding">
	<c:forEach var="mo" items="${movie}" varStatus="mv">
		<div class="w3-quarter" style="padding: 20px;">
			<div class="w3-card">
				<img src="${mo.FILEURL}" alt="${mo.FILENAME}" style="width: 100%;">
				<div class="w3-container w3-center">
					<b style="font-size:20px;">${mo.MOVIENAME}</b><small><br /><br /> 관람 평점 : </small><em>${mo.GRADE}</em>
					&nbsp;|&nbsp; <small>${mo.RATING}</small><br />
					<br />
					<div class="w3-bar">
						<a href="/reserve/page.do?day=0"><button
								class="w3-bar-item w3-button w3-border" style="width: 50%;">예매하기</button></a>
						<a href="/movie/movieDetail.do?num=${mo.NUM }&now=1"><button
								class="w3-bar-item w3-button w3-border" style="width: 50%;">상세보기</button></a>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>