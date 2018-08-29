<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="${pageContext.servletContext.contextPath }/js/jquery-3.3.1.min.js"></script>


<div>
	<ul>
		<h4>${category[0].category}</h4>
		<div style="text-align: left;"
			class="w3-container w3-border-dark-grey w3-border-bottom w3-border-top w3-padding-16">
			<span>분류</span>질문
		</div>
		<c:forEach var="cate" items="${category}" varStatus="category">
			<li id="cateId" class="menu">
				<div class="t  w3-border-bottom w3-padding-16" value="${cate.num }">
					<span id="ex">${cate.category }</span>${cate.title }</div>
				<div
					class="hide w3-container w3-padding-24 w3-border-bottom w3-light-grey">${cate.content }</div>
			</li>
		</c:forEach>
	</ul>
</div>


<script>
	$(document).ready(function() { //ready()는 웹페이지 로딩이 끝나는 시점에 실행되는 메소드 
		$(".t").on("click", function() { //t라는 이름의 클래스를 가진 a태그가 클릭되었을 떄
			//console.log($(this).attr("value"));
			//a태그의 다음으로 오는 ul태그를 사용하는 걸 찾는다
			//그게 hide라는 이름의 class를 가지고 있으면 그 클래스 제거, 없으면 추가
			if ($(this).next("div").hasClass("hide")) {
				$(this).next("div").toggleClass("hide");
				$.ajax({
					"url" : "/customer/count.do", //요청 경로
					"method" : "post", //post 방식
					"data" : {
						"num" : $(this).attr("value")
					//글 번호를 넘김
					},
					"async" : true
				//비동기
				}).done(function(r) {
					console.log($(this).attr("value") + " : " + r.rst); //결과 출력. 성공시 true, 실패시 false 반환
				});
			} else {
				$(this).next("div").toggleClass("hide");
			}
		});
	});
</script>


