<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div align="Center">
	<h2>좌 석 선 택</h2>
	${selectMovie.movieName }
	<br/>
	<div style="background-color:#EAEAEA; width:25%; height:5%; ">
		스 크 린
	</div>
	<br/>
	<br/>
	<c:forEach begin="1" end="10" var="j" step="1">
		<c:forEach begin="1" end="20" var="i" step="1">
			<input type="checkbox" value="${j }-${i }" name="${j }-${i }" id="${j }-${i}" class="aa"/>
			<c:if test="${i == 10 }">
				&nbsp;&nbsp;
			</c:if>
			<c:if test="${i == 20 }">
				<br/>
			</c:if>
		</c:forEach>
	</c:forEach>
</div>
<script>
	$('.aa').click(function(){
		var b ;
		for(var i=1; i<11; i++){
			for(var j=1 ;j<21; j++){
				b = i + "-" + j;
				if(document.getElementById(b).checked){

				}else{
					console.log("bsa");
					document.getElementById(b).disabled = true;
				}
			}
		}
		console.log(b);
	});
</script>
