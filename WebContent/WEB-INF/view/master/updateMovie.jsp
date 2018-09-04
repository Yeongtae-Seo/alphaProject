<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.ta {
	resize: none;
	rows: 100;
}
</style>

<!-- 영화 관리자 페이지 -->
<div style="height: 20px"></div>


<!-- 영화 정보 입력,삭제 -->
<div class="w3-container" align="center">
	<h4>영화 DB 관리</h4>
</div>
<form class="w3-container" action="/master/updateMovie.do"
	enctype="multipart/form-data" method="post">
	<div align="center">
		<div class="w3-card-4 w3-margin-bottom" align="center"
			style="width: 50%;">
			<div class="w3-container w3-margin-bottom" align="center">
			<input type="hidden" name="num" value="${qvo.num }">
			<input type="hidden" name="grade" value="${qvo.grade }">
				<p>
					<b>영화 제목</b><input class="w3-input w3-border w3-sand"
						name="movieName" type="text" value="${qvo.movieName }" />
				</p>
				<p>
					<b>개봉일</b><input class="w3-input w3-border w3-sand" name="releases"
						type="date"
						value="<fmt:formatDate value="${qvo.release }" pattern="yyyy-MM-dd"/>" />
				</p>
				<p>
					<b>관람등급</b><select class="w3-select w3-border w3-sand"
						name="ratingcode">
						<option value="" disabled selected>등급을 선택하세요</option>
						<c:forEach var="rat" items="${rating}">
							<option value="${rat.ID}"
								${rat.ID eq qvo.ratingcode ? 'selected' :'' }>
								${rat.RATING}</option>
						</c:forEach>
					</select>
				</p>
				<p>
					<b>장르</b><br />
				<div class="w3-panel w3-border w3-sand">
					<c:forEach var="g" items="${genre }" varStatus="gvs">
						<input name="genrecode" class="w3-check" type="checkbox"
							value="${g.ID }" ${g.ID eq qvo.genrecode? 'checked':'' }
							onclick="oneCheckbox(this)">
						<label>${g.GENRE}</label>
						<c:if test="${((gvs.index+1)%8)==0 }">
							<br />
						</c:if>
					</c:forEach>
				</div>
				</p>
				<p>
					<b>출연진(띄어쓰기 없이 /로 구분해서 입력)</b><input
						class="w3-input w3-border w3-sand" name="cast" type="text"
						value="${qvo.cast }" />
				</p>
				<p>
					<b>영화 트레일러 (동영상 url)</b><input class="w3-input w3-border w3-sand"
						name="url" type="text" value="${qvo.url }" />
				</p>
				<p>
					<b>시놉시스</b>
					<textarea class="ta w3-input w3-border w3-sand" name="synopsis"
						type="text">${qvo.synopsis }</textarea>
				</p>
				<p>
					<b>상영 예정</b>
				<div class="w3-panel w3-border w3-sand">
					<c:choose>
						<c:when test="${qvo.now eq 1 }">
							<input class="w3-radio" type="radio" name="now" value="1"
								checked="checked" />
							<label>현재 상영작</label>
							<input class="w3-radio" type="radio" name="now" value="2" />
							<label>상영 예정작</label>
						</c:when>
						<c:otherwise>
							<input class="w3-radio" type="radio" name="now" value="1" />
							<label>현재 상영작</label>
							<input class="w3-radio" type="radio" name="now" value="2"
								checked="checked" />
							<label>상영 예정작</label>
						</c:otherwise>
					</c:choose>
				</div>

				<button class="w3-btn w3-black" type="submit">수정</button>
				<a href="/master/showMovie.do"><button type="button"
						class="w3-btn w3-black">취소</button></a>
				</p>
			</div>
		</div>
	</div>

</form>
<script type="text/javascript">
	function oneCheckbox(a) {

		var obj = document.getElementsByName("genrecode");

		for (var i = 0; i < obj.length; i++) {

			if (obj[i] != a) {
				obj[i].checked = false;
			}
		}
	}
</script>
