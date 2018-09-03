<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>movie</title>
</head>
<body>
	<div id="nav">
		<tiles:insertAttribute name="nav" />
	</div>

	<div id="logo">
		<tiles:insertAttribute name="logo" />
	</div>

	<div id="menu">
		<tiles:insertAttribute name="menu" />
	</div>
	<div class="w3-row">
		<!-- Sidebar -->
		<div class="w3-container w3-quarter w3-bar-block">
			<h3 class="w3-bar-item">Master Menu</h3>
			<a href="/master/showmember.do" class="w3-bar-item w3-button">member</a> <a href="/master/info.do?num=1&page=1&viewPage=1"
				class="w3-bar-item w3-button">info</a> <a href="/master/showCustomer.do"
				class="w3-bar-item w3-button">customer</a> <a href="/master/showQuestion.do"
				class="w3-bar-item w3-button">question</a> <a href="/master/showMovie.do"
				class="w3-bar-item w3-button">movie</a>
		</div>
		<!-- Page Content -->
		<div class="w3-threequarter w3-container">
			<tiles:insertAttribute name="contents" />
		</div>
	</div>
</body>
</html>