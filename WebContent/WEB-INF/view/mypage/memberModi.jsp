<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<div style="height: 80px"></div>
<div align="center">
	<h1>Modification</h1>
	<br />
	<form class="w3-container" action="/modiSucHandle.do" method="post" autocomplete="off">
		<div align="center" style="width: 500px">
			<input type="hidden" value="${person.email }" name="email" />
			<b>${person.email }</b>(${person.birth })<br/><br/>
			<label>- modify Password</label><br/>
			<small>(숫자와 문자 포함 6자리 이상 입력)</small>
			<input class="w3-input" type="password" name="pass" id="pass" value="${person.pass }" required />
			<span id="passCheck"></span>
			<label>- modify Name</label>
			<input class="w3-input" type="text" name="name" value="${person.name}" required />
			<label>- modify Phone</label>
			<input class="w3-input" type="text" name="phone" id="phone" value="${person.phone }" required />
			<span id="phoneCheck"></span>
			<label>- modify Address</label>
			<input class="w3-input" type="text" name="address" id="addr" value="${person.address }" onclick="sample4_execDaumPostcode()" />
		</div>
		<p>
			<button class="w3-button w3-black w3-round-large" type="submit">submit</button>
			<button class="w3-button w3-black w3-round-large" type="reset">reset</button>
		</p>
	<p align="left">
		<a href="/withdraw.do"><button class="w3-button w3-black w3-round-large" type="button">withdrawal</button></a>
	</p>
		
	</form>
</div>
<script>
	var passRule = /^[A-Za-z0-9]{6,12}$/;
	var phoneRule =/^\d{3}-\d{3,4}-\d{4}$/;
	
	$("#pass").on("change", function() {
		$("passCheck").html("");
		if(passRule.test($(this).val())) {
			$("#passCheck").css("color", "green");
			$("#passCheck").html("사용가능한 비밀번호 입니다.<br/><br/>")
		}else {
			$("#passCheck").css("color", "red");
			$("#passCheck").html("비밀번호 형식에 맞지 않습니다.<br/><br/>")	
		}
	});
		
	
	$("#phone").on("change", function() {	// id 가져올때는 #을 붙여
		$("#phoneCheck").html("");	// #emailCheck는 span id
	if (phoneRule.test($(this).val())) {
		$.ajax({
			"url" : "/phoneCheckHandle.do",
			"method" : "post",
			"data" : {
				"echeck" : $(this).val()
			}
		}).done(function(r) {
			var rCheck = r.rst;
			if(rCheck == "YYYY") {
				$("#phoneCheck").css("color", "green");
				$("#phoneCheck").html("사용가능한 번호 입니다.<br/><br/>");
			}else {
				$("#phoneCheck").css("color", "red");
				$("#phoneCheck").html("이미 사용중인 번호 입니다.<br/><br/>");
			}
		}).fail(function(r) {
			console.log(r);
		});
	} else {
		$("#phoneCheck").css("color", "red");
		$("#phoneCheck").html("폰번호 형식에 맞지 않습니다.<br/><br/>");
	}
});
	
	
	
</script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                //document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                //document.getElementById('sample4_jibunAddress').value = data.jibunAddress;
                document.getElementById("addr").value=data.zonecode + " " + fullRoadAddr;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
               /* if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
                */
            }
        }).open();
    }
</script>


