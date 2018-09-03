<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<form action="/master/addAnswer.do"
	class="w3-container w3-card-4 w3-light-grey w3-text-black w3-margin"
	method="post" autocomplete="off" >
	<h2 class="w3-center">1:1 문의사항 답변</h2>

	<div class="w3-row w3-section">
		<div class="w3-col" style="width: 50px">
			<i class="w3-xxlarge fa fa-user"></i>
		</div>
		<div class="w3-rest">
			<input class="w3-input w3-border" name="parent" type="text"
				value="${answerNum }" readonly>
		</div>
	</div>


	<div class="w3-row w3-section">
		<div class="w3-col" style="width: 50px">
			<i class="w3-xxlarge fa fa-envelope-o"></i>
		</div>
		<div class="w3-rest">
			<input class="w3-input w3-border" name="aname" type="text"
				value="${auth.email}" readonly>
		</div>
	</div>

	

	<div class="w3-row w3-section">
		<div class="w3-col" style="width: 50px">
			<i class="w3-xxlarge fa fa-pencil"></i>
		</div>
		<div class="w3-rest">
			<textarea class="w3-input w3-border" name="acontent" 
				placeholder="Message" required></textarea>
		</div>
	</div>
	


	<button
		class="w3-button w3-block w3-section w3-black w3-ripple w3-padding"
		type="submit">Send</button>

</form>

