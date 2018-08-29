<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div align="Center">
	<h2>좌 석 선 택</h2>
	${selectMovie.movieName }
	<br/>

	<c:forEach begin="1" end="10" var="j" step="1">
		<c:forEach begin="1" end="10" var="i" step="1">
			<input type="checkbox" value="${j }-${i }" />
			<c:if test="${i == 10 }">
				<br/>
			</c:if>
		</c:forEach>
	</c:forEach>
</div>
