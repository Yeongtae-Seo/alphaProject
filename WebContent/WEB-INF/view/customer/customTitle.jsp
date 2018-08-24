<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
ul.nav {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #e6e6e6;
	width: 42%;
}

li.link {
	float: left;
}

li a {
	display: block;
	color: black;
	text-align: center;
	text-decoration: none;
	margin: 10px;
	padding: 5px;
}

li a:hover {
	background-color: #d9d9d9;
}

em {
	color: #cc0000;
}
</style>

<div style="height: 20px"></div>
<!-- 상단 여백 -->

<h2>고객센터</h2>
<div>
	<ul class="nav">
		<!-- 전체 버튼 -->
		<li class="link"><a href="/customer/center.do">전체<em>(${allCount})</em></a></li>

		<c:forEach var="cc" items="${cateCount}" varStatus="count">
			<!-- 카테고리별 버튼 -->
			<li class="link"><a href="category.do?category=${cc.CATEGORY }">${ cc.CATEGORY }<em>(${ cc.C })</em></a></li>
		</c:forEach>
	</ul>
</div>
