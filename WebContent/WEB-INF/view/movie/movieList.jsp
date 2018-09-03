<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<title>movie</title>


<div id="nav">
	<tiles:insertAttribute name="nav" />
</div>

<div id="logo">
	<tiles:insertAttribute name="logo" />
</div>

<div id="menu">
	<tiles:insertAttribute name="menu" />
</div>

<div id="movieContent">
	<tiles:insertAttribute name="movieContent" />
</div>

<div id="review">
	<tiles:insertAttribute name="review" />
</div>


