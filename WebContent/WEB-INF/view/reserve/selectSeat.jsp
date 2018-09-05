<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<div align="Center">
	<h2>좌 석 선 택</h2>
	<input type="hidden" name="grade" id="grade" value="${sessionScope.auth.grade }" />
	<div style="width:25%" align="left">
		인원 수 : <select name="nop" id="nop">
		    <option value="1" selected="selected">1</option>
		    <option value="2">2</option>
		</select>
	</div>
	<br/>
	<div style="background-color:#EAEAEA; width:25%; height:5%;">
		<p style="display:table-cell; vertical-align: middel;">
			스 크 린
		</p>
	</div>
	<br/>
	<br/>
	<c:forEach var="seat" items="${selectSeat }">
		<input type="hidden" value=${seat } name="io" />
	</c:forEach>
	<form action="/reserve/seatSelect.do">
		<input type="hidden" name="timeCode" value=${selectMovie.timeCode } />
		<input type="hidden" name="email" value=${sessionScope.auth.email } />
	<table>
		<tr>
			<c:forEach begin="0" end="20" var="i">
				<c:choose>
					<c:when test="${i eq 0 }">
						<th>
						</th>
					</c:when>
					<c:otherwise>
						<th style="text-align:center; font-weight:none;">
							${i }
							<c:choose>
								<c:when test="${i == 10 }">
									&nbsp;&nbsp;&nbsp;
								</c:when>
							</c:choose>
						</th>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tr>
		<tr>
	<c:forEach begin="1" end="10" var="j" step="1">
		<c:forEach begin="0" end="20" var="i" step="1">
			
				<c:choose>
					<c:when test="${i == 0 }">
						<td style="text-align:center;">

							<c:choose>
								<c:when test="${j ==1 }">
									A
								</c:when>
								<c:when test="${j ==2 }">
									B
								</c:when>
								<c:when test="${j ==3 }">
									C
								</c:when>
								<c:when test="${j ==4 }">
									D
								</c:when>
								<c:when test="${j ==5 }">
									E
								</c:when>
								<c:when test="${j ==6 }">
									F
								</c:when>
								<c:when test="${j ==7 }">
									G
								</c:when>
								<c:when test="${j ==8 }">
									H
								</c:when>
								<c:when test="${j ==9 }">
									I
								</c:when>
								<c:when test="${j ==10 }">
									J
								</c:when>
							</c:choose>
						</td>
					</c:when>
					<c:otherwise>
					
						<td>
							<%-- <c:choose>
								<c:when test="${j==i }">
									<input type="checkbox" value="${j }-${i }" name="checkSeat" id="${j }-${i}" class="aa rev" checked disabled/>	
								</c:when>
								<c:otherwise>
									<input type="checkbox" value="${j }-${i }" name="checkSeat" id="${j }-${i}" class="aa"/>
								</c:otherwise>
							</c:choose> --%>
							<c:choose>
								<c:when test="${j==1 }">
									<input type="checkbox" value="A-${i }" name="checkSeat" id="${j }-${i}" class="aa" required="required"/>
								</c:when>
								<c:when test="${j==2 }">
									<input type="checkbox" value="B-${i }" name="checkSeat" id="${j }-${i}" class="aa" required="required"/>
								</c:when>
								<c:when test="${j==3 }">
									<input type="checkbox" value="C-${i }" name="checkSeat" id="${j }-${i}" class="aa" required="required"/>
								</c:when>
								<c:when test="${j==4 }">
									<input type="checkbox" value="D-${i }" name="checkSeat" id="${j }-${i}" class="aa" required="required"/>
								</c:when>
								<c:when test="${j==5 }">
									<input type="checkbox" value="E-${i }" name="checkSeat" id="${j }-${i}" class="aa" required="required"/>
								</c:when>
								<c:when test="${j==6 }">
									<input type="checkbox" value="F-${i }" name="checkSeat" id="${j }-${i}" class="aa" required="required"/>
								</c:when>
								<c:when test="${j==7 }">
									<input type="checkbox" value="G-${i }" name="checkSeat" id="${j }-${i}" class="aa" required="required"/>
								</c:when>
								<c:when test="${j==8 }">
									<input type="checkbox" value="H-${i }" name="checkSeat" id="${j }-${i}" class="aa" required="required"/>
								</c:when>
								<c:when test="${j==9 }">
									<input type="checkbox" value="I-${i }" name="checkSeat" id="${j }-${i}" class="aa" required="required"/>
								</c:when>
								<c:when test="${j==10 }">
									<input type="checkbox" value="J-${i }" name="checkSeat" id="${j }-${i}" class="aa" required="required"/>
								</c:when>
							</c:choose>
							
							<%-- <input type="checkbox" value="${j }-${i }" name="checkSeat" id="${j }-${i}" class="aa"/> --%>
						</td>
					</c:otherwise>
				</c:choose>
			<c:if test="${i == 20 }">
			</tr>
			<tr>
			</c:if>
		</c:forEach>
	</c:forEach>
		</tr>
		<tr>
			<td colspan="21" style="text-align:right;">
				<br/>
				<br/>
				<button class="w3-button w3-black w3-ripple w3-round" type="submit">예약</button>
			</td>
		</tr>
	</table>
	<br/>
	<div align="center" class="w3-container w3-gray w3-round" style="width:25%; height:18%;">
		<br/>
		<table style="width:100%;">
			<tr>
				<td align="left">
					${selectMovie.movieName }
				</td>
				<td align="right">
					선택한 좌석 : 
				</td>
				<td align="center" style="width:20%;">
					<span id = "yourSeat"></span>
				</td>
			</tr>
		</table>
		<hr/>
		<div align="right">
			총 가격<br/>
			<h4><span id="price"> </span>&#8361;</h4>
		</div>
	</div>
	<input type="hidden" name="selectSeat" id="selectSeat"/>
	</form>
</div>
<script>
	var list = [];
	$('.aa').click(function(){
		if(document.getElementById("nop").value == "1"){
			var b ;
			if(document.getElementById(this.id).checked){
				for(var i=1; i<11; i++){
					for(var j=1 ;j<21; j++){
						b = i + "-" + j;
						if(document.getElementById(b).checked){
		
						}else{
							console.log("bsa");
							document.getElementById(b).disabled = true;
							document.getElementById("yourSeat").innerHTML = this.value;
							if(document.getElementById("grade").value == 1){
								document.getElementById("price").innerHTML = "8000" ;
							}else if(document.getElementById("grade").value == 2){
								document.getElementById("price").innerHTML = "7600" ;
							}else if(document.getElementById("grade").value == 3){
								document.getElementById("price").innerHTML = "7200" ;
							}
							document.getElementById("selectSeat").value = this.value + ",";
						}
					}
				}
			}else{
				for(var i=1; i<11; i++){
					for(var j=1 ;j<21; j++){
						b = i + "-" + j;
						if(document.getElementById(b).checked){
		
						}else{
							console.log("bsa");
							document.getElementById(b).disabled = false;
							document.getElementById("yourSeat").innerHTML = "";
							document.getElementById("price").innerHTML = "";
							document.getElementById("selectSeat").value = "";
						}
					}
				}
			}
		console.log(b);
		}else{
			if(document.getElementById(this.id).checked){
				list.push(this.id);
			}else{
				list.splice(list.indexOf(this),1);
			}
			console.log(list.length);
			console.log(list);
			if(list.length == 2){
					for(var i=1; i<11; i++){
						for(var j=1 ;j<21; j++){
							b = i + "-" + j;
							if(document.getElementById(b).checked){
			
							}else{
								console.log("bsa");
								document.getElementById(b).disabled = true;
								document.getElementById("yourSeat").innerHTML = 
									document.getElementById(list[0]).value + "," + document.getElementById(list[1]).value;
								if(document.getElementById("grade").value == 1){
									document.getElementById("price").innerHTML = "16000" ;
								}else if(document.getElementById("grade").value == 2){
									document.getElementById("price").innerHTML = "15200" ;
								}else if(document.getElementById("grade").value == 3){
									document.getElementById("price").innerHTML = "14400" ;
								}

								document.getElementById("selectSeat").value = document.getElementById(list[0]).value + "," + document.getElementById(list[1]).value + ",";

							}
						}
					}
			}else{
				for(var i=1; i<11; i++){
					for(var j=1 ;j<21; j++){
						b = i + "-" + j;
						if(document.getElementById(b).checked){
		
						}else{
							console.log("bsa");
							document.getElementById(b).disabled = false;
							document.getElementById("yourSeat").innerHTML = "";
							document.getElementById("price").innerHTML = "";
							document.getElementById("selectSeat").value = "";
						}
					}
				}
			}
		}
	});

	var a = document.getElementsByName("io");
	
	for(var i=1; i<11; i++){
		for(var j=1; j<21; j++){
			var c = i+"-"+j;
			var d = document.getElementById(c).value;
			for(p=0; p<a.length; p++){
				if(a[p].value == d){	
					document.getElementById(c).disabled = true;
					document.getElementById(c).checked = true;
					break;
				}
			}
		}
	}
	

</script>









































