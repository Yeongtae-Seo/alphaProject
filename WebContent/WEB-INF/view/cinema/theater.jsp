<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="w3-container">
  <div class="w3-panel w3-leftbar w3-blue-grey">
    <p class="w3-large w3-serif"><i>| 영화관 위치정보</i></p>
  </div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=02f98fd003ee030ad30d62d918ad4dab"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=02f98fd003ee030ad30d62d918ad4dab&libraries=drawing"></script>

	<div align="center">
	<a href="http://map.daum.net/link/map/29시네마,37.4965791,127.0297537" >
	<div id="map" style="width:70%;height:350px;"></div>
	</a>
	</div>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.4965791, 127.0297537), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(25, 25), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new daum.maps.LatLng(37.4965791, 127.0297537); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition, 
    image: markerImage // 마커이미지 설정 
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
</script>
</div>
<div class="w3-container">
  <div class="w3-panel w3-leftbar w3-blue-grey">
    <p class="w3-large w3-serif"><i>| 대중교통 안내</i></p>
  </div>
  	<b>&nbsp;&nbsp;&nbsp;&nbsp;- 지하철</b>
     <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;강남역 
     		<span class="w3-badge w3-green">2</span>호선 3번 출구<span style="color:green">  도보 3분</span></p>
     <b>&nbsp;&nbsp;&nbsp;&nbsp;- 버스</b><small>  신분당선 강남역 22-009</small>
     <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="w3-tag w3-green">일반</span>&nbsp;&nbsp;&nbsp;33, 500-5</p>
     <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="w3-tag w3-blue">간선</span>
     		&nbsp;&nbsp;&nbsp;140, 400, 402, 407, 420, 440, 441, 452, 471, 541, 542, N37</p>
     <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="w3-tag w3-red">직행</span>
     		&nbsp;&nbsp;&nbsp;1005, 1005-1, 1151, 1550-1, 1551, 1551-B, 1560, 3100, 4403, 5001,
     		5001-1, 5002, 5003A, 5003B, 5006, 5100, 6001, 6002, 6002-1, 6427, 8501, G5100, G7426</p>
     <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="w3-tag w3-red">급행</span>
     		&nbsp;&nbsp;&nbsp;8101</p>
     <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="w3-tag w3-red">광역</span>
     		&nbsp;&nbsp;&nbsp;9404,9408, M4403, M4434, M5438, M6427, M7412</p>
     <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="w3-tag w3-teal">공항</span>
     		&nbsp;&nbsp;&nbsp;6009, 6009-1, 6500</p>
</div>
<div class="w3-container">
  <div class="w3-panel w3-leftbar w3-blue-grey">
    <p class="w3-large w3-serif"><i>| 주차정보 및 이용안내</i></p>
  </div>
  <b>&nbsp;&nbsp;&nbsp;&nbsp;- 자가용(주차정보)</b><br/>
  <p>
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 제이스타워 오른쪽에 위치<br/>
  </p>
  
  <b>&nbsp;&nbsp;&nbsp;&nbsp;- 이용안내</b>
  <p>
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 영화 관람시 무료주차 가능합니다.(요일무관)<br/>
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 29CINEMA 주차장은 주말에는 매우 혼잡하므로 영화관 방문에 시간적 여유를 두시거나, 대중교통 이용을 권장합니다.
  </p>
</div>
	
