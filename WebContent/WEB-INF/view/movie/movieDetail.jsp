<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<style>
em {
	color: #cc0000;
	font-size: 24px;
}

em#re {
	color: #cc0000;
	font-size: 18px;
}

#lay_pop {
	position: absolute;
	z-index: 500;
	width: 800px;
	height: 600px;
	display: none;
	background-color: #ffffff;
	border: 2px solid #cccccc;
}

#all_body {
	position: absolute;
	z-index: 9;
	display: block;
	filter: alpha(opacity = 50);
	opacity: 0.5;
	-moz-opacity: 0.5;
	background-color: #000000;
	left: 0;
	top: 0;
}

.synopsis {
	background-color: #f2f2f2;
}

#tdtd {
	background-size: auto;
}
</style>

<div style="height: 20px"></div>

<!-- 영화 트레일러 영역 -->
<div class="w3-Container w3-black w3-center w3-padding-16">
	<%-- <div id="all_body"></div>
	<div id="lay_pop" style="background-color: black;">
		<div align="right">
			<a href="javascript:;" onclick="layerClose('lay_pop','all_body')"><img
				src="/img/x.jpg" style="height: 25px; width: 25px;" /></a>
		</div>
		<br />
		<iframe style="width: 100%; height: 80%;" id="trailer"
			src="http://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/201808/13081_301_1.mp4"
			frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>트레일러</iframe>
	</div>
	<div id="all_body"></div> 
	--%>
	<!-- =============================================================================== -->
 	<div class="box w3-row">
		<div class="w3-col w3-container" style="width: 26%"></div>
		<div class="w3-col w3-container" style="width: 48%">
		<iframe style="width: 90%; height: 70%;" id="trailer"
			src="${movie[0].URL}"
			frameborder="0" allow="autoplay; encrypted-media" allowfullscreen>트레일러</iframe>
		<!-- <img onclick="pushLayer()" src="/img/play.png" /> -->
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td id="tdtd">

					</td>
				</tr>
			</table> 
			
		</div>
		<div class="w3-col w3-container" style="width: 26%"></div>
	</div>

</div>


<!-- 영화 상세 설명 -->
<br/>
<div class="w3-row">
	<div class="w3-col w3-container" style="width: 26%"></div>
	<div class="w3-Container w3-col" style="width: 17%">
		<image style="max-width:100%;" src="${image[0].FILEURL }" alt="포스터"/>
		<br />
	</div>
	<div class="w3-Container w3-col" style="width: 31%;">
		<h3 class="w3-serif w3-border-bottom">${movie[0].MOVIENAME}</h3>
		<b>관람 평점</b> : <em><fmt:formatNumber value="${g[0].grade/g[0].cnt}" pattern=".0"/> </em><br/>
		<b>관람 등급</b> : ${movie[0].RATING}<br /> <b>개봉일</b> :
		<fmt:formatDate value="${movie[0].RELEASE }" pattern="yyyy-MM-dd" />
		<br /> <b>장르</b> : ${movie[0].GENRE }<br /> <b>출연진</b> :
		<c:forTokens items="${movie[0].CAST}" delims="/" var="ca"
			varStatus="vs">
			${ca} 
			<c:if test="${!vs.last }">,</c:if>
		</c:forTokens>
		<br/><br/><br/>
		<a href="/reserve/page.do?day=0"><button class="w3-button w3-light-grey">예매하기</button></a>
	</div>
	<div class="w3-col w3-container" style="width: 26%"></div>
</div>
<br />
<br />

<!-- 영화 시놉시스 -->
<div class="w3-center">
	<span style="font-size:20px; font-weight:bold;">줄거리</span>
</div>
<div class="w3-row">
	<div class="w3-col w3-container" style="width: 26%"></div>
	<div class="synopsis w3-col w3-container" style="width: 48%">
		<c:forTokens items="${movie[0].SYNOPSIS}" delims="." var="item">
			<p>${item}.</p>
		</c:forTokens>
	</div>
	<div class="w3-col w3-container" style="width: 26%"></div>
</div>
<br />
<br />
<br />

<!-- 
 비디오(영화 트레일러)
<script >
	function pushLayer() {
		var $width = parseInt($("#lay_pop").css("width"));
		var $height = parseInt($("#lay_pop").css("height"));
		var left = ($(window).width() - $width) / 2;
		var sctop = $(window).scrollTop() * 2;
		var top = ($(window).height() - $height + sctop) / 2;
		var height = document.getElementsByTagName("body")[0].scrollHeight;
		$("#lay_pop").css("left", left);
		$("#lay_pop").css("top", top);
		$("#lay_pop").css("display", "block");
		$("#lay_pop").css("z-index", "555");
		$("#all_body").css("display", "block");
		$("#all_body").css("width", $(window).width());
		$("#all_body").css("height", height);
		document.getElementById("trailer").contentDocument.location.reload(true);

	}
	function layerClose(lay1, lay2) {
		$("#" + lay1).css("display", "none");
		$("#" + lay2).css("display", "none");
	}
</script>  -->