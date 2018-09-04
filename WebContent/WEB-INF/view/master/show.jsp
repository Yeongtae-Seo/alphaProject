<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<br />
<br />
<div align="center">
	<table class="w3-table w3-bordered" style="width: 1000px;">
		<tr>
			<th style="text-align: left;"><small>글번호 : ${qvo.num }</small></th>
			<th style="text-align: center;">제 목 : ${qvo.movieName }</th>
			<th style="text-align: right;"><small> 등록일 : <fmt:formatDate
						value="${qvo.release }" pattern="yy-MM-dd [HH:mm]" />
			</small></th>
		</tr>
		<tr>
			<c:if test="${ivo ne null }">
				<c:forEach var="file" items="${ivo }">
					<td colspan="3" style="text-align: right;"><a
						href="<c:url value="${file.fileurl }"/>" download>${file.filename }</a>
					</td>
				</c:forEach>
			</c:if>
		</tr>
		<tr>
			<td colspan="3" style="height: 500px;"><c:out
					value="${qvo.synopsis }" escapeXml="true"></c:out></td>
		</tr>

	</table>
	<br /> <br /> <a href="/master/showMovieFile.do?num=${qvo.num }"><button
			type="button" class="w3-button w3-black w3-round-large">이미지업로드</button></a>
	<a href="/master/showUpdateMovie.do?num=${qvo.num }"><button
			type="button" class="w3-button w3-black w3-round-large">수정하기</button></a>
	<a href="/master/deleteMovie.do?num=${qvo.num }"><button
			type="button" class="w3-button w3-black w3-round-large">삭제하기</button></a>
	<a href="/master/showMovie.do"><button type="button"
			class="w3-button w3-black w3-round-large">목록</button></a>

</div>
