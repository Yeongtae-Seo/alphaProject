<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
.menu a {
	cursor: pointer;
	background-color: #ffffff;
	border-bottom: 1px solid #cccccc;
}

.menu .hide {
	display: none;
	background-color: #e6e6e6;
}

ul {
	list-style-type: none;
	width: 45%;
	vertical-align: baseline;
}

div.t {
	margin: 5px;
	border: 5px;
}

#cateId {
	text-align: left;
}

span#ex {
	display: inline-block;
	vertical-align: middle;
	width: 155px;
	font-weight: bold;
}

span {
	display: inline-block;
	vertical-align: middle;
	width: 155px;
}

.top {
	width: 43%;
}
</style>

<div style="height: 50px"></div>
<!-- 상단 여백 -->

<div class="w3-border-bottom top w3-border-dark-grey">
	<h4>자주 묻는 질문 TOP5</h4>
</div>
<div>
	<ul>
		<c:forEach var="t" items="${top}" varStatus="top">
			<li id="cateId" class="menu">
				<div class="t w3-border-bottom w3-padding-16" value="${t.num }">
					<span id="ex">${t.category }</span>${t.title }</div>
				<div
					class="hide w3-container w3-padding-24 w3-border-bottom w3-light-grey">${t.content }</div>
			</li>
		</c:forEach>
	</ul>
</div>
