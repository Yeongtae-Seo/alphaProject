s<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>write FAQ</title>

<div id="nav">
	<tiles:insertAttribute name="nav" />
</div>

<div id="logo">
	<tiles:insertAttribute name="logo" />
</div>

<div id="menu">
	<tiles:insertAttribute name="menu" />
</div>

<div class="w3-container" align="center">
	<h3>FAQ 작성</h3>
</div>
<div align="center">
	<div class="w3-card-4" align="center" style="width: 50%;">
		<div class="w3-container" align="center">
			<p>
				<label class="w3-text-black"><b>카테고리</b></label> <input
					class="w3-input w3-border w3-sand" name="title" type="text" />
			</p>
			<p>
				<label class="w3-text-black"><b>질문</b></label> <input
					class="w3-input w3-border w3-sand" name="title" type="text" />
			</p>
			<p>
				<label class="w3-text-black"><b>질문 답변</b></label>
				<textarea rows="8" cols="40" name="content"
					class="w3-input w3-border w3-sand" style="resize: none;"></textarea>
			</p>
			<p>
				<button class="w3-btn w3-black">입력</button>
				<button class="w3-btn w3-black">수정</button>
				<button class="w3-btn w3-black">삭제</button>
				<a href="/customer/center.do"><button type="button"
						class="w3-btn w3-black">취소</button></a>
			</p>
		</div>
	</div>
</div>