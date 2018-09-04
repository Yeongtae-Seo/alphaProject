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
			<th style="text-align: center;">제 목 : ${qvo.title }</th>
			<th style="text-align: right;"><small> 등록일 : <fmt:formatDate
						value="${qvo.regdate }" pattern="yy-MM-dd [HH:mm]" />
			</small></th>
		</tr>
		<c:if test="${attach ne null }">
		<tr>
			<td colspan="3" style="text-align: right;"><a
				href="<c:url value="${attach.furl }"/>" download>${attach.fname }</a></td>

		</tr>
		</c:if>
		<tr>
			<td colspan="3" style="height: 500px;"><c:out
					value="${qvo.content }" escapeXml="true"></c:out></td>
		</tr>
		<c:if test="${avo ne null }">
			<c:forEach var="answer" items="${avo }">
				<tr>
					<th colspan="2" style="text-align: left;"><small>답변 :
							${answer.acontent }</small></th>

					<th style="text-align: right;"><small> 등록일 : <fmt:formatDate
								value="${answer.adate }" pattern="yy-MM-dd [HH:mm]" />
					</small></th>

				</tr>
			</c:forEach>
		</c:if>
	</table>
	<br /> <br />
	<c:choose>
		<c:when test="${auth.grade eq 0 }">
			<a href="/master/answer.do?num=${qvo.num }"><button type="button"
					class="w3-button w3-black w3-round-large">답변하기</button></a>
			<a href="/master/showQuestion.do"><button type="button"
					class="w3-button w3-black w3-round-large">목록</button></a>
		</c:when>
		<c:otherwise>
			<a href="/question/send.do"><button type="button"
					class="w3-button w3-black w3-round-large">목록</button></a>
			<a href="/question/delete.do?no=${qvo.num }"><button
					type="button" class="w3-button w3-black w3-round-large">삭제</button></a>
		</c:otherwise>
	</c:choose>
</div>

