<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 영화 평점 및 리뷰 입력 -->
<div class="w3-center">
	<h4>평점 및 영화 리뷰</h4>
</div>
<div>
	<div class="w3-row">
		<div class="w3-col w3-container" style="width: 26%"></div>
		<div class="w3-bar w3-col w3-container" style="width: 48%">
			<select class="w3-select w3-border w3-bar-item w3-light-grey"
				style="width: 18%; height: 10%;" id="usergrade" required>
				<option value="" disabled selected>평점 선택</option>
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
					<c:choose>
						<c:when test="${fr[0] eq null}">
						<div class="w3-bar-item w3-border" style="width: 64%; height: 10%;">
							<textarea  style="width:90%;height:90%;resize:none;" name ="limitedtextarea" onKeyDown = "limitText(this);" onKeyUp = "limitText(this);"></textarea>
							<input type = "text" id="countdown" size="1" value="150" style="font-size: xx-small; text-align: right;" readonly>
						</div>
						</c:when>
						<c:otherwise>
							<textarea id="comments" class="w3-bar-item w3-border"
								style="width: 64%; height: 10%; resize: none;" placeholder="이미 리뷰를 작성하셨습니다" readonly></textarea>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
			<button id="submit"
				class="w3-bar-item w3-button w3-border w3-light-grey"
				style="width: 18%; height: 10%;">등록</button>
		</div>
		<div class="w3-col w3-container" style="width: 26%"></div>
	</div>
</div>

<!-- 리뷰 창 -->
<div class="w3-Container">
	<div class="w3-row w3-margin">
		<div class="w3-col w3-container" style="width: 26%"></div>
		<div
			class="w3-col w3-container w3-border-top w3-padding-24 w3-border-bottomy"
			style="width: 48%">
			<c:forEach var="ar" items="${allReview }">
				<div class="w3-row w3-margin w3-border-bottom w3-padding">
					<div class="w3-col w3-container w3-border-right" style="width: 80%">
						<!-- 평점, 리뷰내용, 작성 날짜 -->
						평점 : (
						<c:forEach begin="1" end="${ar.grade }" varStatus="vs">			
									⭐
						</c:forEach>
						) <em id="re">${ar.grade}</em> | <small>${ar.regdate}</small> <br />
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
	var regdate = rd.getFullYear() + "-" + (rd.getMonth() + 1) + "-"
			+ rd.getDate();
	var num = ${num};
	var email = "${sessionScope.auth.email}";
	
	console.log(typeof num);
	$("#submit").on("click", function() {
		if ($("#usergrade").val() == null || $("#usergrade").val() == "" || $("textarea").val()== "" || $("textarea").val()== null) {
			window.alert("평점과 리뷰를 작성해 주세요");
		} else {
			var data = {
				"num" : num,
				"email" : email,
				"grade" : $("#usergrade").val(),
				"comments" : $("textarea").val(),
				"username" : "${sessionScope.auth.name}",
				"regdate" : regdate
			};
		console.log(data);
		$.ajax({
			"url" : "/movie/comment.do", //요청 경로
			"method" : "post", //post 방식
			"data" : data,
			"async" : true
		//비동기
		}).done(function(r) {
			//여기서 댓글 ㄷ시 받아서 바로 보이게 처리
		});
	}
	});
	
	//=================================================글자 수 제한
	 function limitText(target) {
		 if ($(target).val().length> 150) {
			 $(target).val( $(target).val().substring(0,150) );
		 } 
		 $("#countdown").val(150-$(target).val().length );
	};
</script>