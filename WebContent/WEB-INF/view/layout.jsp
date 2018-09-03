<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- <style>
	#navA{
		text-decoration:none;
		color:black;
		font-family:"돋움";
	}
	#navbar{
		line-height: 35px;
	}
</style> -->
<!-- Navbar (sit on top) -->
<style>
body {
	font-family: "Times New Roman", Georgia, Serif;
}

h1, h2, h3, h4, h5, h6 {
	font-family: "Playfair Display";
	letter-spacing: 5px;
}

#navA {
	text-decoration: none;
}
</style>
<title>TILES-template</title>
</head>
<body>
<div>

	<div id="nav">
		<tiles:insertAttribute name="nav" />
	</div>
	
	<div id="logo">
		<tiles:insertAttribute name="logo"/>
	</div>

	<div id="menu">
		<tiles:insertAttribute name="menu"/>
	</div>

	<div id="contents">
		<tiles:insertAttribute name="contents" />
	</div>

</div>

</body>
</html>
