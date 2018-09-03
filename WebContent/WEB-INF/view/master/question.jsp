<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h2 align="center">질문 보관함</h2>

		<table class="w3-table-all w3-card-4 w3-hoverable">
			<tr>
				<th><input type="checkbox"></th>
				<th>writer</th>
				<th style="width:50%">title</th>
				<th>date</th>
			</tr>
			<c:forEach var="qvo" items="${qlist}">
				<tr>
					<td><input type="checkbox" name="${qvo.num }" value="${qvo.num }"></td>
					<td>${qvo.writer }</td>
					<td><a href="/master/readQuestion.do?no=${qvo.num }" style= "text-decoration:none" >
						<c:set var="ct" value="${fn:escapeXml(qvo.title) }" />
						<c:choose>
							<c:when test="${fn:length(ct) gt 21 }">
							${fn:substring(ct,0,21) }··<c:if test="${qvo.cnt ne 0 }">
							<span>💬</span>
							</c:if>
							</c:when>
							<c:otherwise>
							${ct }<c:if test="${qvo.cnt ne 0 }">
							<span>💬</span>
							</c:if>
							</c:otherwise>
						</c:choose>
						</a>
					</td>
					<td><fmt:formatDate value="${qvo.regdate }" pattern="yy-MM-dd [HH:mm]"/></td>
				</tr>
			</c:forEach>	
					
		</table>
		</br>
		<div class="w3-bar" align="center">
			<c:if test = "${page.page ne 1}" >
				<a href="/master/showQuestion.do?num=${page.minpage-5}" ><button type="button" class="w3-button w3-black w3-round-large">◀</button></a>
			</c:if>
			<c:forEach var="i" begin="${page.minpage }" end="${page.maxpage }">
				<c:choose>
					<c:when test="${i eq page.num }">
						<span class="w3-button">${i }</span>
					</c:when>
					<c:otherwise>
						<a href="/master/showQuestion.do?num=${i }" class="w3-button"><span>${i}</span></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test = "${page.maxpage lt page.max}" >
				<a href="/master/showQuestion.do?num=${page.maxpage+1}"><button type="button" class="w3-button w3-black w3-round-large">▶</button></a>
			</c:if>
		</div>
		