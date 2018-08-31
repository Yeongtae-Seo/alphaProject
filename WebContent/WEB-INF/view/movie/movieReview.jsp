<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- 영화 평점 및 리뷰 입력 -->
<div class="w3-center">
	<h3>평점 및 영화 리뷰</h3>
</div>
<div>
	<div class="w3-row">
		<div class="w3-col w3-container" style="width: 26%"></div>
		<div class="w3-bar w3-col w3-container" style="width: 48%">

			<select class="w3-select w3-border w3-sand w3-bar-item"
				style="width: 18%; height: 10%;" id="usergrade">
				<option value="" disabled selected>평점</option>
				<c:forEach begin="1" end="10" varStatus="star">
					<option name="grade" value="${star.index}">${star.index }점</option>
				</c:forEach>
			</select>

			<c:choose>
				<c:when test="${empty sessionScope.auth}">
					<a href="/login.do"><textarea id="comments"
							class="w3-bar-item w3-border"
							style="width: 64%; height: 10%; resize: none;"
							placeholder="영화 리뷰는 로그인 후에 작성하실 수 있습니다..."></textarea></a>
				</c:when>
				<c:otherwise>
					<textarea id="comments" class="w3-bar-item w3-border"
						style="width: 64%; height: 10%; resize: none;"></textarea>
				</c:otherwise>
			</c:choose>
			<button id="submit" class="w3-bar-item w3-button w3-border"
				style="width: 18%; height: 10%;">입력</button>
		</div>
		<div class="w3-col w3-container" style="width: 26%"></div>
	</div>
</div>

<!-- 리뷰 창 -->
<div class="w3-Container">
	<div class="w3-row w3-margin">
		<div class="w3-col w3-container" style="width: 26%"></div>
		<div
			class="w3-col w3-container w3-border-top w3-padding-24 w3-border-bottom w3-light-grey"
			style="width: 48%">
			<c:forEach var="ar" items="${allReview }">
				<div class="w3-row w3-margin w3-border-bottom w3-padding">
					<div class="w3-col w3-container w3-border-right" style="width: 80%">
						<!-- 평점, 리뷰내용, 작성 날짜 -->
						평점 : (
						<c:forEach begin="1" end="${ar.grade }" varStatus="vs">			
									★
						</c:forEach>
						) <em id="re">${ar.grade}</em> | <small><fmt:formatDate
								value="${ar.regdate}" pattern="yyyy-MM-dd" /></small> <br />
						<p>${ar.comments }</p>
					</div>
					<div class="w3-col w3-container w3-center w3-margin-top"
						style="width: 20%">${ar.username }</div>
				</div>
			</c:forEach>
		</div>

		<div class="w3-col w3-container" style="width: 26%"></div>
	</div>
</div>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />


<script>
	var rd = new Date();

	$("#submit").on("click", function() {
		var data = {
			"grade" : $("#usergrade").val(),
			"comments" : $("textarea").val(),
			"username" : "${sessionScope.auth.name}",
			"regdate" : rd
		};
		//console.log(data);
		$.ajax({
			"url" : "/movie/comment.do", //요청 경로
			"method" : "post", //post 방식
			"data" : data,
			"async" : true
		//비동기
		}).done(function(r) {
			$("#comments").val("");
		});
	});
</script>